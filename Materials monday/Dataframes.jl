# load the relevant libraries
using CSV, DataFrames

# read the data set
mammals = CSV.read("mammal_sleep.CSV", DataFrame)

# some basic variables
typeof(mammals)
nrow(mammals)
describe(mammals)
mammals[1:2, 8:end]

names(mammals)
mammals.awake

mammals[Not(1), Between("name", "order")]

filter(row -> row.order == "Rodentia" && row.vore == "herbi", mammals)
filter(row -> row.order == "Rodentia" && row.vore == "herbi", dropmissing(mammals, [:order, :vore]))

groupby(mammals, [:order, :vore])

using Statistics
combine(groupby(mammals, [:order, :vore])) do sdf
    mean_sleep = mean(sdf.sleep_total)
end


using Chain
@chain mammals begin
    groupby([:order, :vore])
    combine(nrow, :sleep_total => mean)
end

@chain mammals begin
    groupby([:order, :vore])
    combine(nrow, :sleep_total => mean)
    sort(:sleep_total_mean)
end

@chain mammals begin
    groupby([:order, :vore])
    combine(nrow)
    unstack(:order, :vore, :nrow, allowmissing = true)
end

# Exercise 1

# Exercise 2


# using DataFramesMeta
using DataFramesMeta

# commands similar to dplyr
# dplyr       DataFramesMeta
# select      @select 
# mutate      @transform
# filter      @subset
# arrange     @orderby 
# summarize   @combine 
# group_by    groupby



@select mammals :name :order

@subset mammals :order .== "Rodentia"
@rsubset mammals :order == "Rodentia"
@rsubset mammals begin
     :order == "Rodentia"
     :vore == "herbi"
end

@chain mammals begin
    @select :name :order :sleep_total
    @orderby :order :sleep_total
    @rsubset :sleep_total > 16
end

# Do the example from before with DataFramesMeta
@chain mammals begin
    groupby([:order, :vore])
    @transform :mean_sleep_total = mean(:sleep_total)
    @orderby :mean_sleep_total
end

@chain msleep begin
    groupby(:order)
    @combine begin
        :avg_sleep = mean(:sleep_total)
        :min_sleep = minimum(:sleep_total)
        :max_sleep = maximum(:sleep_total)
        :total = length(:sleep_total)
    end
end

# Exercise 3


# Exercise 4