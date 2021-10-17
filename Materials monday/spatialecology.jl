using SpatialEcology, DataFrames, CSV, Plots

mammals = CSV.read("mammals.csv", DataFrame)
regions = DataFrame(CSV.File("wallace_points.csv"))
coord = CSV.read("coord.csv", DataFrame)

world_mammals = Assemblage(mammals, coord)

plot(world_mammals)

addsitestats!(world_mammals, regions[!, 3:end], :coord)
g = unique(world_mammals[:Realm])
gg = [findfirst(isequal(x), g) for x in world_mammals[:Realm]]
plot(gg, world_mammals, c = cgrad(:Paired_12, categorical = true))

afr = findall(isequal("Afrotropical"), world_mammals[:Realm])

afro_view = view(world_mammals, sites = afr, dropempty = true)
plot(afro_view, c = :Reds)
afro = copy(afro_view)
plot(afro, c = :Reds)

default(fillcolor = :Reds)

occupancy(afro)
histogram(ans)
occupancy(afro)#up
asquantiles(ans, 4)
addtraits!(afro, ans, :quart)

sep = [view(afro, species = afro[:quartile] .== i) for i in 1:4]
quarts = groupspecies(afro, :quart)
nspecies.(quarts)
plot(plot.(quarts)...)

NPP = CSV.read("NPP.csv", DataFrame)
NPP
addsitestats!(afro, NPP, :coord)
plot(:NPP, afro, fc = :Spectral_r)
scatter(afro[:NPP], richness(afro))

quarts = groupspecies(afro, :quart)#up
p = [scatter(n[:NPP], richness(n)) for n in quarts]
plot(p...)








