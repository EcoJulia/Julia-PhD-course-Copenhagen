# This example will be gone through by the teacher
using SpatialEcology, DataFrames, CSV, Plots

# Read the data
mammals = CSV.read("mammals.csv", DataFrame)
regions = DataFrame(CSV.File("wallace_points.csv"))
coord = CSV.read("coord.csv", DataFrame)

# build the assemblage object and plot it
world_mammals = Assemblage(mammals, coord)
plot(world_mammals)

# Add the regions data
addsitestats!(world_mammals, regions[!, 3:end], :coord)

# How can we plot the regions? A workaround with a list comprehension
g = unique(world_mammals[:Realm])
gg = [findfirst(isequal(x), g) for x in world_mammals[:Realm]]
plot(gg, world_mammals, c = cgrad(:Paired_12, categorical = true))

# Let's make a vector of all Afrotropical sites
afr = findall(isequal("Afrotropical"), world_mammals[:Realm])

# and create a view
afro_view = view(world_mammals, sites = afr, dropempty = true)
plot(afro_view, c = :Reds)
afro = copy(afro_view)
plot(afro, c = :Reds)

# read NPP and add it
NPP = CSV.read("npp.csv", DataFrame)
addsitestats!(afro, NPP, :coord)
plot(:NPP, afro, fc = :Spectral_r)
scatter(afro[:NPP], richness(afro))

# some information is readily accesible
occupancy(afro)
histogram(ans)
plot(
    histogram(log10.(richness(afro))),
    histogram(log10.(occupancy(afro)))
)

# add the quantile as a trait
quant = asquantiles(occupancy(afro), 4)
addtraits!(afro, quant, :quart)

# then we can split it on it
sep = [view(afro, species = afro[:quartile] .== i) for i in 1:4]
sep[1]
quarts = groupspecies(afro, :quart)
nspecies.(quarts)
plot(plot.(quarts)...)
p = [scatter(n[:NPP], richness(n)) for n in quarts]
plot(p...)
