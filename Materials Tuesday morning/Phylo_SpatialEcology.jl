## Node-based analysis of species distributions

# This example demonstrates how to do a node-based comparison of species
# distributions, as described in Borregaard et al., MEE 2014. 

# We will work with the distributions and phylogenetic relationships for all
# species of the family `Tyrannidae` in the Americas. The species occurrences
# are defined on a regular grid with a cellsize of 1 lat/long degree. This is
# one of the datasets used in the Borregaard _et al._ (2014) paper.

### Load data and create objects

# Load relevant packages
using CSV, DataFrames, SpatialEcology, Plots, Phylo

# Load the datasets
phylocom = CSV.read("tyrann_phylocom.tsv", DataFrame)
coord = CSV.read("tyrann_coords.tsv", DataFrame)

# Exercise
# Use the various inspection functions on the DataFrames
# What is the format?
# How many unique species are there?


# Exercise
# The site columns are used to match the two DataFrames together, but for that they
# need to be strings. What type are they now?. 
# We can transform a single number to a String with e.g. `string(3)`. 
# How can you use this knowledge to change all elements of the column with site names
# in each of the dataframes to be Strings, so they can be matched?

# Create the assemblage
tyrants = Assemblage(phylocom, coord)

# Exercise
# Create a nice species richness plot with a good color scale

# Next, we'll read in the phylogenetic tree
tree = open(parsenewick, "tyrannid_tree.tre") # most file opening methods in Julia start with 
                                              # the `open` function - the first argument is a 
                                              # function to apply to the file contents
                                              # `parsenewick` is an inbuilt function to parse 
                                              # newick files

# Exercise
# plot the tree, experimenting with the keywords `showtips` (true or false), 
# `treetype` (:fan or :dendrogram) or `tipfont` (try `(5,)`, or add a name of a 
# font or a color to the tuple), or try a relevant keyword from here 
# https://docs.juliaplots.org/latest/generated/attributes_series/ (many will not work)

# Exercise
# What happens if you call `sort!` on the tree, and then plot it?

# Phylo has functions to create iterators over nodes (`nodes` in Phylo include both 
# tips/leaves and internal nodes). Using `nodenamefilter` you can get a lazy
# iterator over the internal nodes on the tree
# `isleaf` is an anonymous function used to filter
nodes = nodenamefilter(!isleaf, tree)

# Exercise
# We are interested in getting the 131'st node. How do you make the `nodes` iterator
# into a vector, and extract the 131'st element?

# Exercise
# Here's a more complex exercise
# we want to create a function that gives us a list of the species that
# descend from a given node
# use the functions `filter`, `isleaf`, and `getdescendants`
# Note that `isleaf` normally takes two arguments (try `?isleaf`), so 
# should be called as `isleaf(tree, node)`

# Exercise
# Use your function to get the name of all species desciending from our 131st node

# Exercise
# Now use that species list to subset an `Assemblage` object that
# only contains the species descended from our node.

# Exercise
# Plot the species richness for that clade 

# Exercise
# Take the steps you did above and merge them into a function that can be used
# to create the sub-Assemblage for any node on the tree

### Comparing the richness of sister clades
# The question we are interested in addressing here is: At a given node where the
# lineage splits into two sister clades - are the two descendant clades distributed
# differently? This could be an indication that an evolutionary or biogeographic
# event happened at that time, of consequence for the current distribution of 
# the species. 

# Exercise
# Use the `getchildren` function to get the two daughter nodes from our focal node
# Plot the species richness of the parent clade, and those of it's two descendents
# next to each other. 

# Comment on the comparison - did something interesting happen here? What?
