# # Host/Parasite model
#
# Load packages
using GeoData, DynamicGrids, Dispersal, Plots, Dates, Pkg

# Get the data 
using Pkg; Pkg.add("Git"); using Git
repo = "SpatialMechanisticModellingInJulia"
isdir(repo) || run(`$(git()) clone http://github.com/cesaraustralia/$repo`)
# Load growthrates from tif files saved in growthmaps.jl
datapath = joinpath(pwd(), repo, "data", "growthrates")
# Reorganise the tif files to be auxilllary data for the simulation,
# cut to Australia with a time-span and the right orientation
function get_rate_data(species)
    growthtimespan = DateTime(2020, 1):Month(1):DateTime(2020, 12)
    dir = joinpath(datapath, species)
    filepaths = readdir(dir; join=true)
    aus = X(Between(113.0, 154.0)), Y(Between(-44.0, -10.0))
    slices = map(filepaths) do path
        A = GeoArray(path; mappedcrs=EPSG(4326), name=Symbol(species))[aus..., Band(1)]
        permutedims(replace_missing(A, 0.0), (Y, X))
    end
    return cat(slices...; dims=Ti(growthtimespan))
end

rate_h = get_rate_data("host")
rate_p = get_rate_data("parasitoid")

plot(rate_h)


# ## Define DynamicGrids.jl rules

# Rules are the components of the DynamicGridws.jl simulation.
# Initially, we will use predefined rules form Dispersal.jl

# ### Growth rule:

carrycap = 1e9
growth = LogisticGrowth{:H}(rate=Aux(:rH), carrycap=carrycap, timestep=Day(1))

# ### Allee extinction rule:
allee = AlleeExtinction{:H}(; minfounders=Param(20.0; bounds=(0.0, 200.0)))

# Host local dispersal rule:
localdisp = InwardsDispersal{:H}(;
    radius=1, formulation=ExponentialKernel(Param(0.25; bounds=(0.05, 0.5)))
)

# ### Wind dispersal rule:

# Here we begin to define our own rules. 
# This rule uses the short-form `SetCell` `do` syntax:

wind = let wind_disp_prob = Param(0.01; bounds=(0.0, 0.1))
    SetCell{:H}() do data, H, I 
        H > zero(H) || return nothing # Ignore empty cells
        rand() < wind_disp_prob || return nothing # Randomise a dispersal event
        ## Randomise a destination
        dest = I .+ (rand(-20:20), rand(-20:20))
        if isinbounds(data, dest)
            ## Update dest cell and current cell, if dest is on the grid
            add!(data[:H], H / 10, dest...)
            sub!(data[:H], H / 10, I...)
        end
        return nothing
    end
end



# Set up the simulation data
#
# Take an array slice to use as a template
template = rate_h[Ti(1)]

# Make a masking layer for ocean areas
mask = boolmask(template)

# Create an initial population array for the host
init_h = zero(template)

# Add a host population around Cairns in Queensland
cairns = Y(Between(-17, -20)), X(Between(144.0, 145.0))
init_h[cairns...] .= carrycap

# Initialise scattered parasitoid populations
init_p = broadcast(template) do _
    rand() < 0.1 ? carrycap * 1e-4 : 0.0
end


# Define initialisation and auxilary data for the simulations.
# :rand is only required on GPU
initdata = (; H=init_h, P=init_p)
auxdata = (; rH=rate_h, rP=rate_p);


# Run the rule
#
# Set the time span for the simulation
tspan = DateTime(2020, 1):Week(1):DateTime(2030, 1)

ruleset = Ruleset(localdisp, wind, allee, growth)

using DynamicGridsInteract, ColorSchemes
output = ElectronOutput((; H=init_h);
    ruleset=ruleset,
    aux=auxdata, 
    mask=mask,
    tspan=tspan,
    minval=0.0, maxval=carrycap,
    scheme=ColorSchemes.autumn,
)


# Multi-species: add parasitism rules
#
#
# This rule uses the long form definition, defining a struct
# and an `applyrule` method that dispatches on it.
struct Parasitism{R,W,GR,M,HS,A,B} <: CellRule{R,W}
    rate::GR
    mortality::M
    halfsat::HS
    a::A
    b::B
end

function Dispersal.applyrule(data, rule::Parasitism, (H, P), I)
    γ = rule.mortality; halfsat = rule.halfsat; a = rule.a; b = rule.b
    rP = get(data, rule.rate, I) * 7 # Growthrate for the cell/timestep
    h = 1 / (a * exp(b * rP)) # Handling time
    β = 1 / (h * halfsat) # Encounter rate
    R = β * H / (1 + h * β * H) # Holling type II response
    δ = h * (rP - γ) # Conversion efficiency
    dHdt = -R * P # Change in host population
    dPdt = δ * R * P * rP - γ * P # Change in parasitoid population
    return (H + dHdt, P + dPdt) # Updated populations for the cell
end

parasitism = Parasitism{Tuple{:H,:P}}(
    Aux(:rP), 
    Param(0.2; bounds=(0.1, 0.5)), 
    Param(1f8; bounds=(1f7, 1f9)), 
    Param(2.0; bounds=(1.0, 5.0)), 
    Param(5.0; bounds=(1.0, 10.0)),
)

# ### Parasitoid local dispersal rules:
localdisp_p = InwardsDispersal{:P}(; 
    radius=1, formulation=ExponentialKernel(; λ=Param(0.18; bounds=(0.001, 0.5))), 
)
allee_p = AlleeExtinction{:P}(; minfounders=Param(20.0; bounds=(0.0, 200.0)))

# Define the ruleset
host_para_ruleset = Ruleset(localdisp, wind, allee, growth, localdisp_p, allee_p, parasitism)

output = ElectronOutput((H=init_h, P=init_p);
    ruleset=host_para_ruleset,
    aux=auxdata, 
    mask=mask,
    tspan=tspan,
    minval=[0.0 0.0], maxval=[carrycap carrycap],
    scheme=[ColorSchemes.autumn ColorSchemes.jet],
)
