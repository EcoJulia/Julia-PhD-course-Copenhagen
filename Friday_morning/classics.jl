using DynamicGrids

# Write the Game of life
#
# Use the dsctiption at:
# https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life
































# It could be something like this
life = Neighbors(Moore(1)) do data, hood, active, I
    if active 
        sum(hood) in (2, 3)
    else
        sum(hood) == 3
    end
end

init = rand(Bool, 1000, 1000)
repl_output = REPLOutput(init; tspan=1:100, fps=25)
sim!(repl_output, life; boundary=Wrap())

# How fast is this thing?
# 
# Benchmark it!
using BenchmarkTools
result_output = ResultOutput(init; tspan=1:100)
@btime sim!(result_output, life; boundary=Wrap())

# But actually, this laptop has 8 cores:
Threads.nthreads()
sim!(repl_output, life; boundary=Wrap(), proc=ThreadedCPU())
@btime sim!(result_output, life; boundary=Wrap(), proc=ThreadedCPU())

# And a GPU!
# Loading CUDAKernels gives us CUDA GPU capability
using CUDAKernels
sim!(repl_output, life; boundary=Wrap(), proc=CuGPU())
@btime sim!(result_output, life; boundary=Wrap(), proc=CuGPU())


# Forest Fire

# Use the numnered rules in 
# https://en.wikipedia.org/wiki/Forest-fire_model

# To get you started, the grid will have 3 states:
const EMPTY = 0
const BURNING = 1
const ALIVE = 2






























# forest fire with parameters for sliders
forest_fire = let f = Param(0.001; bounds=(0.0, 1.0)),
                  p = Param(0.01; bounds=(0.0, 1.0))
    Neighbors() do _, hood, state, I
        if state == ALIVE
            if BURNING in hood
                BURNING
            else
                rand() < f ? BURNING : ALIVE
            end
        elseif state == BURNING
            EMPTY
        else # EMPTY
            rand() < p ? ALIVE : EMPTY
        end
    end
end


init = fill(ALIVE, 150, 300)
repl_output = REPLOutput(init; tspan=1:200)
ruleset = Ruleset(forest_fire; boundary=Wrap())
sim!(repl_output, forest_fire)

using DynamicGridsInteract, ColorSchemes, Colors
# Live output
output = ElectronOutput(init;
    ruleset=ruleset,
    tspan=1:2000,
    scheme=ColorSchemes.brg,
    minval=EMPTY,
    maxval=ALIVE,
    zerocolor=RGB(0),
    throttle=0.5,
)