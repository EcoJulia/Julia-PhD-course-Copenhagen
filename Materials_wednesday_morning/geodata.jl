# # Rasters and Polygons with GeoData.jl
# 
# Mapping the diversity of mammals in scandinavia, and investigating
# which bioclim layers seem the most associated with it.
#
# - use a BioClim raster layer as template for resolution and CRS
# - use polygons of country outlines to select the area of interest
# - use polygons of species ranges to count diversity
#
# Packages: GeoData.jl, RasterDataSources.jl, Plots.jl, Shapefiles.jl and GADM.jl,
# GLM.jl, DataFrames.jl
#
# First, load the basic packages
using GeoData, Plots, Downloads

# Load raster data
#
# We download a worldclim layer to use as a template
# using RasterDataSources.jl
filename = getraster(WorldClim{BioClim}, 1)

# And load it.
A = GeoArray(filename)
plot(A)

# Or use Selectors to use the dimension coordinates
# Between selects a range of values
plot(A[X=Between(100, 170), Band=1]) 
# Near will find a particular value nearest our search
A[X=Near(100), Y=Near(45), Band=1] 
# At has to be EXACT, but can have a tolerance
A[X=At(110; atol=1e7), Y=At(57; atol=1e7), Band=1] 

# Its just an array! `broadcast` and other julia methods work
A .* 10 |> plot

# Now we know how it works, `getraster` is actually
# integrated into GeoData, so you can just do:
bio = GeoArray(WorldClim{BioClim}, 1)

# We drop the Band dimension, also loading the array from disk into memory
bio = bio[Band(1)]
plot(bio)

# We could also load a multi-layer stack
bio_stack = GeoStack(WorldClim{BioClim}, (1, 3, 5, 7))
plot(bio_stack)

#= !!!!!!! RasterDataSources.jl Examples !!!!!!!!

Set a path for files (so we never fill your home directory)

=#
ENV["RASTERDATASOURCES_PATH"] = "/path/to/your/data/"
#=

If you want to later, make this permanent by adding
the above line to your startup.jl:

Windows : `C:\Users\USERNAME\.julia\config\startup.jl`
Linux/Mac: `~/.julia/config/startup.jl`

### Now get some data

Get a RasterDataSources.jl dataset as a `GeoArray` or `GeoStack`, and plot
some layers from one of:

`WorldClim{Climate}`
`EarthEnv{LandCover}`
`EarthEnv{HabitatHeterogeneity}`

See the docs for `RasterDataSources.getraster` for syntax.
They may need a `layer` argument, and/or keyword arguments.
=#


# Loading shapefiles

# Use GADM.jl for high-definition plots by name
#
# These are somewhat slow to plot and lines may have too much detail
using GADM
denmark_border = GADM.get("DNK").geom[1]
sweden_border = GADM.get("SWE").geom[1]
norway_border = GADM.get("NOR").geom[1]

plot(denmark_border)
 
# Use the Natural-Earth dataset
#
# Country numbers are here:
# https://public.opendatasoft.com/explore/dataset/natural-earth-countries-1_50m/table/
# 
# Download some simple and fast shapefiles from the web
using Shapefile
shapefile_url = "https://github.com/nvkelso/natural-earth-vector/raw/master/10m_cultural/ne_10m_admin_0_countries.shp"
shapefile_name = "boundary_lines.shp"
Downloads.download(shapefile_url, shapefile_name)

# Load using Shapefile.jl
shapes = Shapefile.Handle(shapefile_name)
denmark_border = shapes.shapes[72]
norway_border = shapes.shapes[54]
sweden_border = shapes.shapes[55]

plot(sweden_border)

#= !!!!!!! Shapefile.jl/GADM.jl Examples !!!!!!!!

# Shapefile and GADM

1. Use GADM.jl to download and plot another country of your choice,
using 3-letter ISO country codes: 

https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes

2. Download the natural earth dataset and use Shapefile.jl to
plot some different countries (see what you get!)
=#


# GeoData.jl GIS functions
#
# `mask` and `trim`
#
# First, experiment with masking denmark:
d_masked = mask(bio; to=denmark_border)
plot(d_masked)
d_trimmed = trim(d_masked)
plot(d_trimmed)

# Now plot the outlines
plot!(denmark_border; fillalpha=0)

# It works, but the shape is a cut off the edge of the pixels where
# they are a little inside the line. We also need to apply this
# to multiple shape files.
#
# So lets do it agai, and this time using a function  
#
# We define a `mask_trim` to mask and trim to all shapes in
# the same way, with padding of 10 pixels around the trimmed area.
mask_trim(x, poly) = trim(mask(x; to=poly); pad=5)

# Now mask and trim mask each country
@time denmark = mask_trim(bio, denmark_border)
@time sweden = mask_trim(bio, sweden_border)
@time norway = mask_trim(bio, norway_border)

# Check them
plot(denmark) 
plot(sweden)
plot(norway)

# Norway shape includes a lot of islands. Lets crop them out.
norway_region = bio[X(Between(0, 40)), Y(Between(55, 73))]
plot(norway_region)
norway = mask_trim(norway_region, norway_border)
np = plot(norway)

# Now we can plot the individual countries.
#
# Define a function to add borders to all subplots.
# To do this we use a generator to make a vector with the polygon repeated
# four times.
borders!(p, poly) = plot!(p, [poly for i in p.subplots]; fillalpha=0, linewidth=0.7)

borders!(np, norway_border)

# `mosaic`
#
# Now we can combine the rasters, using `mosaic`.

# Combine the countries into a single raster using `mosaic`. `first` will take the
# first value if/when there is an overlap.
scandinavia = mosaic(first, denmark, norway, sweden)

# Plot scandinavia, with all borders included:
p = plot(scandinavia)
borders!(p, denmark_border)
borders!(p, norway_border)
borders!(p, sweden_border)

write("scandinavia_bio1.nc", scandinavia)
write("scandinavia_bio1.tif", scandinavia)


#=!!!!!!! GeoData.jl Examples !!!!!!!!

- Cut out a region of a raster using `Between` for both `X` and `Y`
- Get a single value using `Near(coord)` for both `X` and `Y`, and `Band(1)``.

Use some of the docs methods on a raster file you loaded earlier:

- mask
- trim
- crop
- aggregate
- resample

There are examples in all the docstrings, and in the package docs

Save your results to a tif or nc file.
=#


# # Counting Mammal diversity
#
# Open a the mammal range shape file 
# Download from:
# https://www.iucnredlist.org/resources/spatial-data-download
# 
# Choose the "Terrestrial mammals" dataset
# It will send a link to your email you can download (666 MB) and unzip (1GB)
mammals_shapefile = "/home/raf/PhD/Teaching/MAMMALS_TERRESTRIAL_ONLY/MAMMALS_TERRESTRIAL_ONLY.shp"
mammal_ranges = Shapefile.Handle(mammals_shapefile)
length(mammal_ranges)

# Define a function to rasterize all the species
# Each polygon simply adds 1 to the current value
function count_species!(A::GeoArray, shp)
    for species_range in shp.shapes
        rasterize!(A, species_range; fill=n -> n + 1)
    end
end

# Make an array similar to the bioclim layers, but holding Int zeros
num_mammals = similar(scandinavia, Int16) .* Int16(0)
num_mammals = GeoArray(num_mammals; name=:mammal_diversity)

# Rasterize the species to the num_mammals array
#
# How long will this take??? the `@time` macro will time it.
@time count_species!(num_mammals, mammal_ranges)

# using ProfileView
# @time count_species!(num_species, shp, 8000:9000)
plot(num_mammals)
num_mammals

masked_mammals = mask(num_mammals; to=scandinavia, missingval=missing)
# And plot
p = plot(masked_mammals)

# Save as a tif file
write("scandinavian_mammal_diversity.tif", masked_mammals)


# Fit a GLM to diversity
#
# Fit a generalised linear model to the diversity and bioclim variables
using GLM, DataFrames, Distributions

# Get all the bioclim layers and crop/mask them to the ones we have 
bio_stack = GeoStack(WorldClim{BioClim}, (1, 3, 10, 12))[Band(1)] |>
    x -> crop(x; to=scandinavia) |> 
    x -> mask(x; to=scandinavia) |>
    replace_missing

plot(bio_stack)

# Add the num_mammals layer to the stack
variables = GeoStack(masked_mammals, bio_stack...)
plot(variables)

# Write a function to build a model from any key,
# and build a linear model for all keys,
f = @formula(mammal_diversity ~ bio1 + bio3 + bio10 + bio12)
model = glm(f, variables, Poisson())

# Make predictions
#
# Notice: we don't use a DataFrame here at all! A `GeoStack` already
# follows the Tables.jl interface, and behaves like a DataFrame
# when it is asked for rows or columns.
predictions = predict(model, variables)

# Make a raster from predictions
pred_rast = GeoArray(predictions, dims(masked_mammals); name=:predictions)
plot(pred_rast)





# Some other ways to do this...
#
# 2. We can use a DataFrame and `rasterize!`
# This method will also work on filtered subsets of the data, unlike the others.
df = DataFrame(variables)
df[!, :predicted_diversity] = predictions

# Define a GeoArray to rasterize to
pred_raster = GeoArray(masked_mammals * 0.0; name=:predicted_diversity)
rasterize!(pred_raster, df; name=:predicted_diversity)
p = plot(GeoStack(masked_mammals, pred_raster); clims=(14, 40))

# 3. Because the dataframe is the same length as the original stack and 
# represents the same points, we can also just skip `rasterize`,
# and pass the data and dimensions directly
st = GeoStack(df, dims(pred_raster))
plot(st)

