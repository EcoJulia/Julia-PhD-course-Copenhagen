# The simplest mechanistic/process-based species distribution model
#
# (For herb or grass of some kind...)
#
# Load packages
using GeoData, Plots, Dates
# We will use scientific units!
using Unitful, UnitfulRecipes

# First, load a series of worldclim stacks for each month
#
# Choose the average temperature and precipitation datasets
jan_stack = GeoStack(WorldClim{Climate}, (:tavg, :prec); month=Jan) |> replace_missing
july_stack = GeoStack(WorldClim{Climate}, (:tavg, :prec); month=July) |> replace_missing

plot(jan_stack)
jan_temp, jan_prec = jan_stack
july_temp, july_prec = july_stack


# Model 1: our first model! ################################
#
# Define the simplest (e.g. worst) possible model.
# Growth is the product of temperature and precipitation.
model1(temp, prec) = temp * prec

# Run and plot both months
model1.(jan_temp, jan_prec) |> plot
model1.(july_temp, july_prec) |> plot


# Model 2: I cant stand the rain ###########################
#
# Limit the positive effect of precipitation above 50mm a month.
# Use precipitaiton as a scalar between zero and one
# (still not very mechanistic...)
model2(temp, prec) = temp * (min(prec, 50) / 50)

# Run and plot both months
plot(model2.(jan_temp, jan_prec); title="Jan")
plot(model2.(july_temp, july_prec); title="July")


# Model 3: All grown up ####################################
#
# Use a parametrised growth-rate function from the literature
#
# Define a Parent-Tardeua plant-growth response model
function parent_tardieua(ΔH_A, α, t0, t)
    ex = exp(-ΔH_A / (u"R" * t))
    return t * ex / (1 + ex^(α * (1 - (t / t0))))
end

# Define our parameters as a struct (object)
struct ParentTardieu{Δ,Al,T,S}
plot(july_temp)
    ΔH_A::Δ
    α::Al
    t0::T
    scale::S
end        

# Define a response function for the parameters at a given temperature
temp_response(p::ParentTardieu, t) = p.scale * parent_tardieua(p.ΔH_A, p.α, p.t0, t)

# Define some default parameters
#
# We use units specified with the string macro u"_"
ΔH_A = 63.5u"kJ*mol^-1"
α = 3.5    
t0 = 300.0u"K"
scale = 1 / parent_tardieua(ΔH_A, α, t0, t0)

params = ParentTardieu(ΔH_A, α, t0, scale)

# Plot the temperature respponse
temperatures = (0.0u"°C":1.0u"K":40.0u"°C") .|> u"K"
plot(t -> temp_response(params, t), temperatures)

# Define the model
model3(p, temp, prec) = (1 + temp_response(p, u"K"(temp * u"°C")))u"1/m" * (min(prec, 50) / 50)

# Run and plot both months
plot(model3.(Ref(params), jan_temp, jan_prec); title="Growth rate Jan")
plot(model3.(Ref(params), july_temp, july_prec); title="Growth rate July")


# What else could we do to improve this model and code?

