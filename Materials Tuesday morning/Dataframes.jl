
# load the relevant libraries
using CSV, DataFrames

# read the data set - note that you need a special package for this
msleep = CSV.read("mammal_sleep.CSV", DataFrame)
# Look at the DataFrame in the console - what are the element types
# of the columns? Notice that some have a little questionmark after
# - why do you think that is? (hint - it's not because Julia is in doubt)

# Exercise:
# Try running some basic descriptor functions for DataFrames
# including typeof, nrow, describe, names - and try indexing into the dataframe

# You can get a column from a dataframe in three ways
msleep[:, :awake] # this copies the column
msleep[!, :awake] # this gets a link to the column
msleep.awake      # this is the same as [!, :awake]


# Exercise
# Select multiple columns and rows
# You can use e.g. `Not(1)` to exclude index one,
# and the `Between(a,b)` function to choose multiple columns
# Get a dataframe with all rows except the first and 
# all sleep/awakeness related columns 

# You can also select multiple columns by using a regular expression
# regular expression search strings are created by `r"mysearchstring"`
# E.g. try
select(msleep, r"sleep_")

# Exercise
# use the `groupby` function to create a dataframe grouped by
# order and "vore" called `gdf`

# Split-apply-combine
# Let's use this to find the mean sleep total
# for the mean function we need to load the standard library "Statistics"
using Statistics
combine(gdf) do sdf
    mean_sleep = mean(sdf.sleep_total)
end

# We can use the Chain package to chain operations
# much like the "pipe" function in dplyr
# Exercise - what does this syntax do?
using Chain
@chain msleep begin
    groupby([:order, :vore])
    combine(nrow, :sleep_total => mean)
end

# Exercise
# adapt the code above so the dataframe ends up being
# sorted by the sleep_total_mean column

# This transforms to long format
@chain msleep begin
    groupby([:order, :vore])
    combine(nrow)
    unstack(:order, :vore, :nrow, allowmissing = true)
end

# Exercise 
# Which two orders have the lowest mean body weight?

using DataFramesMeta

# The DataFramesMeta package provides metaprogramming
# macros, that lets you use a syntax very similar to dplyrs

# dplyr       DataFramesMeta    What it does

# select      @select           Selects columns
# mutate      @transform        Calculates new columns
# filter      @subset           Selects rows by a condition
# arrange     @orderby          Sorts rows
# summarize   @combine          Creates summary statistisc
# group_by    groupby           Groups

# You can select columns using this simple] format
@select msleep :name :order

@subset msleep :order .== "Rodentia" # here is how you would subset/filter rows
                                     # note the dot in `.==`
                                     # this applies to the whole column
@rsubset msleep :order == "Rodentia" # you can use the `@rsubset` (note the added `r`)
                                     # to work on a row-by-row basis
@rsubset msleep begin                # chain multiple commands like this
     :order == "Rodentia"
     :vore == "herbi"
end

# Exercise
# Selecting only the needed columns, sort the dataframe by order 
# and total sleep, retaining only those with at least 16 hours of sleep

# Exercise
# Redo the exercise from line 54 with DataFramesMeta

# use @combine to calculate the mean, minimum and maximum sleep
# across different mammal orders

