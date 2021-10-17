### A Pluto.jl notebook ###
# v0.16.1

using Markdown
using InteractiveUtils

# ╔═╡ a34203c1-4670-4a16-81b4-7498f8b8ae2a
using Distributions, StatsPlots

# ╔═╡ c22199d2-6d8b-43e7-8a1d-03e44836ae48
using Unitful:uconvert, cm, km, s, d

# ╔═╡ 2c4ea052-e43e-4200-bc18-b44e2a605c97
md"## Assigning variables"

# ╔═╡ 3a5820e4-6290-480b-a084-b0007b402fc5
myvar = "Hello world"

# ╔═╡ 11e58702-720e-4d23-a9a6-32512e800b31
typeof(myvar)

# ╔═╡ 377434da-3852-4802-8f35-8fcc20552b40
π = 3.14

# ╔═╡ 279302fb-0656-4a7b-876f-1a4e571d16ac
typeof(π)

# ╔═╡ 275ff4f1-eaa5-4c69-8ba8-d7f42bb43ca8
😄 = 3

# ╔═╡ 07638144-8de1-4f59-9ba0-ec2eb60ddee5
typeof(😄)

# ╔═╡ c0b617b3-b4b6-4b7f-9d86-b01bc9dfa2ef
pival = "pi has the value $(π)"

# ╔═╡ 9e93896f-c94b-4ea2-9b5b-5228ca01bb68
md"#### Exercise
You can copy-paste anything in the julia REPL in the help shell mode and it will tell you how to type it in the terminal. Fire up a REPL and work out how to type some unicode symbols and use them for some simple assignments"


# ╔═╡ 6023a230-e135-44b5-ad65-a093558c2ba5


# ╔═╡ 8d63a2eb-fd5e-4428-8542-15da4b600b82
md"""## Types
What is a thing's type? What does it mean to have a type?"""

# ╔═╡ 2d342f4d-b06e-44d3-8f7e-22b9f3becafc
bitstring(3)

# ╔═╡ 7c2cb818-4ab8-40c2-a9a6-7e5014fba77f
bitstring(3.14)

# ╔═╡ f2dccb5c-54ba-4618-9035-0bf4e5f7453c
bitstring(myvar)

# ╔═╡ 5f0eca7d-95fc-4377-b3bc-ddcaec9e6a93
bitstring('a')

# ╔═╡ 6f053b72-029b-4cba-b5f1-fb3c9c258143
md"#### Exercise
Use the `bitstring` function to work out what happens when you add two integers and when you add two floating point numbers"

# ╔═╡ 8c47757d-0eb4-459e-b657-7a377d9275c5


# ╔═╡ e9b49713-397e-48ad-8382-38dff98fa5a4
md"""
### Container types
Julia has many containers like list and vector in R, but they are not the same. A Julia Vector is the same as a list or a vector but without names
"""

# ╔═╡ a50841fe-3a25-452f-b1a3-f3267f89579c
md"#### vectors"

# ╔═╡ a5f84adb-5bca-4a17-8727-07f1e45810ab
vector1 = [1, 2, 3]

# ╔═╡ afa0e81e-f7bc-4581-91fe-04a608191488
vector2 = rand(3)

# ╔═╡ 7c72c753-af60-49c4-b4f9-bd1d04025035
vector3 = fill("a vector", 3)

# ╔═╡ 99ab2f65-9f2f-4128-bae0-122e421a9f50
vector4 = Vector{Float64}(undef, 3)

# ╔═╡ 18e3a98a-7c46-4c79-a28f-a756c62d982b
md"#### Exercise
create some vectors on your own, see how they behave"

# ╔═╡ c0b2f016-044a-4eb2-a046-aa584375fdc1


# ╔═╡ e3585a43-e65f-4de8-be9d-39606c555155
md"#### Matrices"

# ╔═╡ 4609f6dd-08d1-4abb-ab83-9e0dc30a4e1c
matrix1 = [1 2 3; 4 5 6; 7 8 9]

# ╔═╡ 8609a4e0-fca7-40e6-9793-e64b19613f76
matrix2 = [1 2 3
           4 5 6
           7 8 9]

# ╔═╡ 1551d9d1-50bf-4d7d-9cf5-270ae4ebfca7
matrix2[:,3]

# ╔═╡ 9fd7b024-a9db-4927-823c-ac33924adf25
rand(2,3)

# ╔═╡ 7403bf4b-220c-4045-a276-a6c05974b0c6
fill("a matrix", 2, 3)

# ╔═╡ dbbc3006-a8b9-49c7-985a-a9503585c36b
md"#### Dicts"

# ╔═╡ 64159f40-e145-431d-bd8c-abf138e324c6
firstdict = Dict("a" => 2, "b" => 3)

# ╔═╡ 83c8e663-24d7-4037-950e-796b6af8f2c6
md"a dict can be of any type, not just text and numbers"

# ╔═╡ 0b71e865-e549-43b7-9621-287311ee5ec0
mydict = Dict(vector1 => "a", vector2 => "b")

# ╔═╡ 4191cfbd-c436-43e2-9ae7-3fead0fc8de6
mydict[vector1]

# ╔═╡ fefa24a4-467a-4fda-8739-719362c93b05
vector1

# ╔═╡ b265841b-95f5-4c2f-a891-3fe97e76e232
md"You can assign a new element to a Dict without issue, but not to a Vector"

# ╔═╡ e19ec737-7ab3-4e65-9f6b-8b32631063d1
firstdict["c"] = 4

# ╔═╡ a69b8dc5-de9b-455a-8958-574e160b4249
vector1[4] = 4

# ╔═╡ 680ea7e3-772b-4a7e-8b95-f1008bafbd5f
md"Instead you have to make the vector longer explicitly, e.g. by pushing to it"

# ╔═╡ 6e588c60-2284-4de1-bf40-1799ff6eee2f
push!(vector1, 4)

# ╔═╡ cb81aa8f-9d4d-4981-b62a-dd02ac2d8a4f
md"#### Exercise
Try to create some different Dict types - what makes sense?"

# ╔═╡ 56e3024e-03ea-4d7b-a139-d7965636cc70
md"#### Tuples"

# ╔═╡ 6fde343a-f7fd-4c86-b070-5ffd623e413a
tuple1 = (2, 3, "a")

# ╔═╡ 6200b837-8fdd-43dc-8a08-1f84fa5c931e
tuple1[1]

# ╔═╡ 80abf9cb-604c-4e78-8d12-c80c6d6571cc
tuple1[1] = 2

# ╔═╡ ef607ef8-6fa1-4d27-ac61-3731ac98b41e
xx,yy = (2,3)

# ╔═╡ 975caab4-d607-4dfa-88b1-bc549f636f95
yy

# ╔═╡ 31715fa4-bbc8-46e7-89dc-dfe73446c9ef
function returnstwo(i)
    i * 2, i + 2
end

# ╔═╡ 1c677bb9-8ddc-414b-9854-9d7794ad3858
k, j = returnstwo(3)

# ╔═╡ 6315ba57-e087-4361-81c4-2f742a9678b9
k

# ╔═╡ a2990848-5297-48c2-b487-5792a992ce78
md"Tuples can be named too"

# ╔═╡ 38413ace-af71-42e7-a2c3-377ca41f8dda
nt = (a = 2, b = "c")

# ╔═╡ efef2a72-3046-4b75-9c7b-d5b932929b30
typeof(nt)

# ╔═╡ f6817d36-665e-4433-bf9b-a738ee515a90
md"Tuples are also used for slurping and splatting"

# ╔═╡ 39a3cde5-0726-4053-9a12-c2e1e376eaa2
md"## Working with arrays (and other containers)"

# ╔═╡ 4a6d7b6a-f1c1-4c2f-9564-0f69c8a3bc34
md"#### The dot syntax"

# ╔═╡ 580c3c33-d496-42f5-8999-b956d8ddbf55
vec5 = rand(4)

# ╔═╡ 9f04207a-9aff-494f-915e-21a39b1adaf0
vec6 = rand(4)

# ╔═╡ 8afae57f-26c4-4454-84d1-81ce0338b31b
vec5 * vec6       # fails, because you can't multiply whole vectors

# ╔═╡ 3d49837d-d5b0-4c70-b224-0b0731e1bd14
vec5 > 0.5     # same here

# ╔═╡ d2601987-d9d3-4179-a41d-257432a97dc9
vec5 .* vec6      # use a dot for elementwise operations

# ╔═╡ 94469feb-b9e7-446e-b597-67b65c0a9e9b
f(x) =  2x + 2   # this generalises to using functions as well

# ╔═╡ 2c4220a9-aa81-4b30-9dd1-9b176fd48ad2
f(vec5)             # fails

# ╔═╡ 26538df1-e990-4156-889b-635c58d56ebe
f.(vec5)            # works (and essentially replaces `sapply`)

# ╔═╡ 408b61cb-e14d-4955-928f-c08f42540139
log10.(vec5)

# ╔═╡ 2fdad04e-f330-407f-835c-0051158ea205
md"""
This is very extensible and clear when you get used to it
"""

# ╔═╡ f2d6278a-a1a2-4118-89b8-8b5c7d3ec72c
rand.(1:5)

# ╔═╡ 0ba2517f-4b75-428c-9ce8-2a123cdb7896
vec5

# ╔═╡ cf592bbf-c3e5-44ba-b8a2-abea926eff51
vec7 = vec6'

# ╔═╡ c9698143-dedf-4206-b847-320535b50ed7
vec5 .* vec7

# ╔═╡ 874364c0-a284-4b34-a758-eadf9a95c9e3
md"""
You can wrap arguments that don't change in `Ref`
"""

# ╔═╡ 9735729b-49a3-4507-9c9b-d5aee3495595
ms = rand.(1:4, Ref(2))

# ╔═╡ e24786f8-172a-42b2-bb70-128684ff2604
md"#### Exercise
R has a `match(a, b)` function that gives the position of each element of `a` in `b`. Read the docs for julia's `indexin` function, and use the dot syntax to make it give the same result as R's match function for two vectors"

# ╔═╡ 8e927e6c-6621-4e4d-b745-84056812b2ba


# ╔═╡ 05c4a4a8-400d-4170-857b-712255fccee1
md"""
### Loops, comprehensions, generators and broadcasts, map and the do functionality
"""

# ╔═╡ 85e6da05-453f-49c0-b811-aa81ed87b869
md"""
##### Code does NOT have to be vectorized
for loops are great
"""

# ╔═╡ 347743cd-bf33-469f-b64e-d947fd4a6d0e
begin
	x = Int[]
	for i ∈ 1:5
		push!(x, 2i + 3)
	end
	x
end

# ╔═╡ 02a135ff-eb5a-4c21-b579-a2387beff2e7
md"""
Dotted functions
"""

# ╔═╡ 85622700-6ceb-4849-a842-b257a093113f
myfun(x) = 2x + 3

# ╔═╡ 8ff0f105-bd17-4e8c-a5e0-84e12ef1873e
myfun.(1:5)

# ╔═╡ 1c597935-a171-4c4b-b059-425fc09d73c4
md"""
Comprehensions
"""

# ╔═╡ ef2af08a-b282-4bfd-a17e-b1177c0d072b
[2i + 3 for i in 1:5]

# ╔═╡ 29df0242-c1f6-4844-8149-7ef4a1401225
md"You can even add conditions to a list comprehension"

# ╔═╡ 8c88567f-2098-456e-b240-92b6173d2d7c
[2i + 3 for i in 1:5 if i > 2]

# ╔═╡ 13333a78-af51-47c3-889a-2801f794c0d0
md"""
map and mapslices
"""

# ╔═╡ c0202f3f-444e-4e78-99d0-ba192210e825
map(myfun, 1:5)

# ╔═╡ ccccb385-e422-4a20-876f-1c57e41c0ebd
map(x->2x + 3, 1:5)

# ╔═╡ ee3180cf-d41b-4bec-b538-83d76b971d9f
map(1:5) do x
    2x + 3
end

# ╔═╡ ae8aaac9-915e-474a-b1e1-b35268b905ee
mapslices(sum, [1 2 3; 4 5 6], dims = 1)

# ╔═╡ 45c03247-f235-47d0-8660-075f90327add
md"#### Exercise
Use a list comprehension to create a vector of strings such as `number_2` for all even numbers between 1 and 10"

# ╔═╡ 9bf08f5b-a486-4240-a085-35422bdca8ab


# ╔═╡ 5bcb8b48-7795-4cb4-a324-ffee18d8bafd
md"## Minimizing memory reads"

# ╔═╡ d3999f96-6cc9-42a7-b7a9-919b3a65c3c1
md"### Lazyness"

# ╔═╡ d703431b-ca83-43e1-b366-139d87d2d8bd
myrange = 1:4

# ╔═╡ bd921e79-40bf-4a1c-aa52-8d5f430b5abc
sum(myrange)

# ╔═╡ 28b01ed5-63a8-436c-9bfc-cefaee9cf754
myrange isa Vector

# ╔═╡ 4028710a-ee13-47da-a1e9-eea4af2bb445
md"*Exercise:* Use the `typeof` function to work out what it is"

# ╔═╡ 1273b670-c924-4aaf-bb1f-cc12290c1b8d


# ╔═╡ fee27dda-16f8-4d05-92ca-bdbc7b3e6d99
ex = collect(1:4)

# ╔═╡ 69fec420-dd1e-44e3-a053-08e213f3b914
md"The syntax is a bit more powerful"

# ╔═╡ a712f0c0-ecfa-4426-b56b-34394a71b293
collect(4:-0.4:2)

# ╔═╡ 7e50a3c6-64e3-433f-ba8e-56c6940c6444
md"You can also make lazy list comprehensions, called generators)"

# ╔═╡ fad46628-096b-48a5-ac68-f2ee8706b22b
g=(2i + 3 for i in 1:5)

# ╔═╡ f4cc6b91-4b29-4f20-8acf-1f9ad5a05d48
collect(g)

# ╔═╡ ce9f2a15-a539-46a1-8ad7-b2a92b7e9c7d
md"### You have to copy explicitly"

# ╔═╡ 0fc7376f-2cb0-4cbd-ace3-e5e639ca7897
ex2 = ex

# ╔═╡ 72f57501-c3a4-4524-9c3d-f18f5b695a6d
ex3 = copy(ex)

# ╔═╡ 3fe9fdec-fdc4-4666-9355-01affc1a0b88
ex2[2] = 4

# ╔═╡ bceb4df4-01ef-4c17-a898-767bccd74aab
ex2

# ╔═╡ 6f74dbe4-ef34-4f0a-a257-dd50f378694b
ex

# ╔═╡ 3ba41fe0-a82a-4185-9eb1-fb558c050fd3


# ╔═╡ 2eefce35-e193-4659-99a3-760a73864fed
md"""
### Defining functions
There are several ways to define functions - let's look at the long-form, short form, and anonymous functions"""

# ╔═╡ 1674c224-e6a7-4d3e-9e4e-cdebd36a5315
function longform(x,y)
    ret = x * y+2
    return ret^2
end

# ╔═╡ da4ad281-262c-48af-89ff-8326a204ce09
longform(3, 4)

# ╔═╡ 831e07be-c4c9-4e94-8dc3-696ffa93b7cb
shortform(x,y) = x/y^2

# ╔═╡ 2189af2f-f48b-480e-bbe1-4a5c3bf216c9
shortform(3, 4)

# ╔═╡ 3cd401c0-626f-468d-9239-f226dce0ea65
md"""Anonymous functions are defined by `->` They are similar to R's syntax in eg. `sapply(1:10, function(x) 3 * x + 2)` and are very used in julia"""

# ╔═╡ c796d961-c8df-46b2-a357-3e6c3183ae00
anonymous = x -> 3x + 2

# ╔═╡ de4573ff-4e8c-4009-882f-9580b2fc8be8
md"""
### Exercise
Define a function that calculates the area of a circle given the radius. Try all three forms"""

# ╔═╡ 28b3954c-028d-4ce5-a642-646387d44e26


# ╔═╡ c399d84a-cc32-48e0-af8b-b77802a2f48d
md"#### Using anonymous functions"

# ╔═╡ 031689fb-f6db-45cb-b29d-0a8724a96392
md"""Anonymous functions are widely used in Julia. E.g. for searching and counting functions.

In R, to count all instances of 0s in a vector, you would do something like

`sum(myvec == 0)`

In Julia you would do"""

# ╔═╡ 0a6bfb0f-703b-4323-b1c9-5228e95439fa
myvec = [0, 3, 4, 0]

# ╔═╡ 49fc6b9f-0268-42e1-8799-5f9112daa94d
count(x -> x == 0, myvec)

# ╔═╡ ab6e2563-5cb8-40ef-8e4f-3b9196c2faf2
findall(x->x>0, myvec)

# ╔═╡ 274ed90a-40d1-4607-aae8-e4b8d5dffd27
md"""
`filter!` and `filter` are often used instead of indexing
"""

# ╔═╡ 6bbb2b93-1d82-4657-baff-d65600df034e
filter(x->x>0, myvec)

# ╔═╡ dd9f5841-51c9-4bfc-841c-f8332c32d300
md"""#### Exercise
Using what you know - why is it preferable to filter with a function, rather than something like `myvec[myvec > 0]`?"""

# ╔═╡ bbd56f2e-17ff-4e90-b566-ca4bcd0ec532
md"For the most common comparison functions, methods are defined with one argument less, particularly to pass into functions like this"

# ╔═╡ dd5ec629-1ffc-42c5-9b92-75472224cdbc
count(isequal(0), myvec)

# ╔═╡ 5a167dca-39cd-4499-8299-940c004ba63e
count(==(0), myvec)

# ╔═╡ 3b61e90c-89fb-4d91-a110-3b9d4242cf2d
md"""#### Exercise
Create a function that will roll a 6-sided die 100 times, and another function that will count how many times each individual value appeared"""

# ╔═╡ f1fb478a-4421-44dc-948f-35cc06a3c40d


# ╔═╡ 4b07f8b2-0484-4555-b0cb-8caa4bb7404c
md"""### Passing function arguments by reference
What happens to a variable that gets added to a function?"""

# ╔═╡ 921e3747-da80-4049-a127-810a443163d7
function tst1(a)
    println(a)
    a = 3
    a
end

# ╔═╡ 702b9d63-dbc5-4780-897f-23169687ea07
a = 4

# ╔═╡ a9910256-2836-42a8-8c30-faea02cfadf2
tst1(a)

# ╔═╡ 59d9a589-614e-4f13-81e9-799f6eac8112
a

# ╔═╡ 027f3a6e-19af-4858-9aae-69e25a24b5fa
md"Now what happens if the thing we pass to a function is a container, like a Vector?"

# ╔═╡ eae82cec-81bb-41ae-b8fb-0a024f86409a
function tst2!(b)
    println(b)
    b[1] = 3
    b
end

# ╔═╡ 3c9cd0d8-5186-4946-986f-9daf20d70e80
b = [1, 2, 3]

# ╔═╡ aeca76f9-4cc8-402c-9c8a-8f769ea53e2f
tst2!(b)

# ╔═╡ ee7a28d7-ee35-4867-a54d-2e128cb41dce
b

# ╔═╡ 4823ca31-4552-4886-9f51-18937db0e992
md"""This is a huge memory saver, but can sometimes be a surprise.
To deal with this, we always mark functions that may modify their arguments with `!`
Many functions in Julia have an alternative `!` form that lets it reuse containers
"""

# ╔═╡ d1888134-f86d-446b-b586-6b19f7396ef4
randvec = rand(5)

# ╔═╡ 1a37b9fa-609c-4f90-9103-4ab32958f189
filter!(>(0.5), randvec) 

# ╔═╡ 15930f49-9168-43ba-8d0a-fe94106a0f64
md"""
#### Slurping and splatting: `...`

The `...` operator is used for two different (almost opposite) purposes:

1. to "unpack" iterables (vectors, tuples, etc.) in order to pass them as separate arguments to a function
2. to collect multiple arguments to a function into a tuple ("varargs")
"""

# ╔═╡ b4e7b378-afa4-4bfa-87da-05a13b3333fc


# ╔═╡ 4041297b-0e2f-4bc5-bed1-727f7ee50454
md"""
[1] Our "shortform" function took two arguments. What happens if you pass `f` a vector or tuple of two numbers? Work out how to use the `...` operator when you call the function to unpack a vector into two arguments.
"""

# ╔═╡ 30b789ac-6f8b-4e5b-bdd5-a68984363cf0


# ╔═╡ eb7af092-86de-4731-b1de-a3c3f8c68761
md"""
[2] The function `vcat` does a vertical concatenation of arrays (try it). Use `vcat` together with the (conjugate) transpose operator `'` to convert a vector of vectors into the corresponding 2D matrix.
"""

# ╔═╡ 860aea6e-f84e-4b60-8ca4-3ebd2fc0e3eb


# ╔═╡ ef244196-059e-4f29-80e2-7a08d13f3b03
md"""## Multiple dispatch
The basic design idea of julia is that functions behave differently when called on different types"""

# ╔═╡ 4b1e44f1-d680-4dc8-b63c-827cc2a02eae
n = Exponential(0.2)

# ╔═╡ fba1172f-7e7c-45a5-9f75-6dc557953ccc
plot(n)

# ╔═╡ 24fadc1b-a350-4ca6-8f14-6ea080528c95
ns = rand(n, 1000)

# ╔═╡ fab6e71f-ace5-48aa-9ed8-c6bc8e82db46
rand(Normal(2, 4), 5)

# ╔═╡ 19d06208-ad38-499a-92e0-02547c4c3b68
rand(Gamma(3,5), 5)

# ╔═╡ 3741c160-8b36-4fa1-a91c-ae8beaa2fda4
histogram(ns)

# ╔═╡ 5a0fe5cd-4ff3-499f-8064-fd8f0a4a3257
begin
	histogram(ns, normalize = :pdf)
	plot!(n, lw = 2)
end

# ╔═╡ 4feb84ac-deea-4e51-93ca-30e4bb03e63e
md"This also means that a lot of other functions will apply to any distribution"

# ╔═╡ 4007fa62-e24f-4acf-a160-c41df8facc86
n1 = Normal(3, 2)

# ╔═╡ b8b3e789-9812-48f5-b7e3-dc52867d3896
rand(n1, 4)

# ╔═╡ 9cef4570-2a81-43ad-a726-08bec670a624
pdf(n1, 0)

# ╔═╡ 2a9bc01f-b28d-43bc-9bef-5ef7cff6bd2e
quantile(n1, 0.05)

# ╔═╡ 4c956af1-c895-4b2c-8bb6-72115fd68ad1
p1 = Poisson(4)

# ╔═╡ b05a3ca6-c615-4ecf-9276-29e365f6e398
rand(p1, 4)

# ╔═╡ 74befd16-5f58-4730-946c-9f3360b1ea6d
pdf.(p1, 1:3)

# ╔═╡ 5fc3b26b-e2a6-438b-bbbf-c1b7c9a77cc5
md"""### User-defined types
The most important component of Julia is how easy it is for users to create new types, that are just as powerful as the inbuilt ones"""

# ╔═╡ caa9ed10-91cb-4557-9460-04f82e411a55
md"""
### Making your own types
Julia is really centered around user types. E.g. let's make a type for a point in space
"""

# ╔═╡ 5bc4284d-1cfb-4573-9585-4e246dd8d915
struct Point
  x::Float64
  y::Float64
end

# ╔═╡ 3298dc1b-786f-47b2-a38f-726aabb1f60e
md"""
We can now make our own types that act on this type
"""

# ╔═╡ 5291c800-fb5a-4d1f-847f-86a8130b4dfb
distance(p1::Point, p2::Point) = sqrt((p1.x-p2.x)^2 + (p1.y - p2.y)^2)

# ╔═╡ f9c7fd0c-49df-4bd6-97ee-2107ffc53613
i = Point(3,4)

# ╔═╡ 4d5512a9-5f85-48ee-8e8d-3e4fa75043cc
l = Point(5,9)

# ╔═╡ 9e6526a2-41c2-4cc5-b6de-14fb20a38665
distance(i, l)

# ╔═╡ 95fe895e-3b63-44e2-98cc-0c91b1470fcf
md"""### Implementing your own new methods"""

# ╔═╡ 89621a82-b3ba-4a70-b095-d51fd90470ae
md"""
This is a very common pattern in Julia - defining different methods for different types
"""

# ╔═╡ 66886c25-88c4-48a9-8a79-6468971738f2
nrow(x::Vector) = length(x)

# ╔═╡ 6f9c23ae-de27-417d-a824-b4c4e4792546
nrow(x::Matrix) = size(x, 1)

# ╔═╡ 9cb5bc58-a93a-4766-9f8f-55d13ca47a53
nrow(rand(4))

# ╔═╡ 9f82361e-2c5c-4a74-80d2-77161c7e59c4
nrow([1 2; 3 4])

# ╔═╡ aa3dda74-9562-4a48-81ad-53d40939521e
methods(nrow)

# ╔═╡ 63c9c4d2-d480-4038-b6e1-c0cba187963e
nrow("arst")

# ╔═╡ 4effc2fd-ec8d-42ed-ab11-3db1901e0679
md"""
You can see which one is being called with @which
"""

# ╔═╡ 5dea975a-7033-47c4-966e-43e4c97ab9e5
@which nrow(rand(4))

# ╔═╡ f0e5ba5b-80f9-4b05-a8eb-9c29c79a1520
md"## Implementing multiple dispatch"

# ╔═╡ 9e2e8a77-9e39-4ec1-af16-f96b0b29990a
abstract type Animal end

# ╔═╡ 342a368b-35be-4344-a2da-2e71f6cc769b
struct Cat <: Animal end

# ╔═╡ ccece351-82ce-4646-85e8-40dbfb0b8d57
struct Dog <: Animal end

# ╔═╡ e47424a6-7ac0-40a9-9fbb-4b22af660287
struct Fish <: Animal end

# ╔═╡ 98236fe2-8f25-4873-8de8-9d54ad4a583f
begin
	cat1 = Cat()
	cat2 = Cat()
	dog1 = Dog()
	fish1 = Fish()
end

# ╔═╡ d0a355d7-8f0b-4914-8c28-5193f46c8a81
sound(a::Animal) = "hhh"

# ╔═╡ 97bfe748-a8fe-4575-a5d5-93eaa6fead87
sound(f::Fish) = "bubbles"

# ╔═╡ 4b302233-2ced-4ed7-8341-d0d9b88f0d8f
sound(cat1)

# ╔═╡ b7073a0c-27f1-4a8d-819d-bc216524ef6a
sound(fish1)

# ╔═╡ ec9aa50d-bbb4-43f6-9d42-7d0f94a49a78
meet(a::Cat, b::Animal) = "cat eats"

# ╔═╡ 58641cbe-ec0a-47af-a624-55a737122482
meet(a::Cat, b::Dog) = "cat runs"

# ╔═╡ 9902a886-ac5a-4bb9-88fb-e4630f94fdf1
meet(a, b::Cat) = meet(b, a)

# ╔═╡ 8827e5fc-1aef-46d4-bf4e-268243a8571d
meet(cat1, fish1)

# ╔═╡ f5465eee-7c96-4d07-91c4-0dc8e902d491
meet(dog1, cat1)

# ╔═╡ e19aed91-58fb-4bf4-94c2-90a60b4a0fea
md"""#### Exercise
Define a new species of animal that will fight with the dog, run from the cat and ignore all other animals"""

# ╔═╡ 7eb7f057-1c6f-402a-8e6f-afc5c2414e27
md"""
#### Missing values
Julia has missing values that act somewhat differently from in R
"""

# ╔═╡ 266d85f2-423b-4226-946c-622e5fccfa88
true || missing

# ╔═╡ 664cb485-3bf6-4e87-9370-faf28acc4370
false || missing

# ╔═╡ 93b82c6a-6801-47c4-8849-f1e0faced6ad
true && missing

# ╔═╡ c75ff8c9-36ea-41f2-ba51-8d3689de71cc
false && missing

# ╔═╡ f07dc093-2d02-4fd6-9dd4-c0b6d7131c5d
md"""
There are no `na.rm = T` arguments - you need to handle the missing values
See this blog post https://bkamins.github.io/julialang/2021/09/03/missing.html
"""

# ╔═╡ 5397b484-404b-4d66-b4e4-fa858ce8dbb5
mean([1, 2, 3, missing, 2])

# ╔═╡ 54916ce4-463f-4552-97c3-a3de4f437401
mean(skipmissing([1, 2, 3, missing, 2]))

# ╔═╡ bfae3c5d-3f28-48e5-b39c-d47a20d528bd
md"""
## Package ecosystem
In Julia, packages are not add-on - the language IS the package ecosystem. Even the most basic functionality is in a package!
The whole package ecosystem is built around github. Open the github notebook
"""

# ╔═╡ 6bc3a949-e060-4d1a-b57e-6f621821b12b
md"""
#### An example core package - the `Unitful` package
Julia works natively with units via the Unitful package. Very useful for working with physical constants etc.

It took a beetle 36 seconds to walk 25 cm. How many days will it take it to walk 3 km?
"""

# ╔═╡ 264d2f6c-dddd-441b-9222-2cf7a6ad00a4
v = 25cm/36s

# ╔═╡ 68f15c7b-9c9a-4766-9833-bf08e91cbf7a
t = 3km/v

# ╔═╡ 13b44a23-e32c-47eb-aa8a-d3e5100d51d1
uconvert(d, t)

# ╔═╡ 67f8aee8-8bb2-47da-acaf-c66a4d35a14f


# ╔═╡ 78e01ec5-e1e9-4a14-b7ac-c5b934edd141


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Distributions = "31c24e10-a181-5473-b8eb-7969acd0382f"
StatsPlots = "f3b207a7-027a-5e70-b257-86293d7955fd"
Unitful = "1986cc42-f94f-5a68-af5c-568840ba703d"

[compat]
Distributions = "~0.25.20"
StatsPlots = "~0.14.28"
Unitful = "~1.9.0"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.0-rc1"
manifest_format = "2.0"

[[deps.AbstractFFTs]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "485ee0867925449198280d4af84bdb46a2a404d0"
uuid = "621f4979-c628-5d54-868e-fcf4e3e8185c"
version = "1.0.1"

[[deps.Adapt]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "84918055d15b3114ede17ac6a7182f68870c16f7"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.3.1"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[deps.Arpack]]
deps = ["Arpack_jll", "Libdl", "LinearAlgebra"]
git-tree-sha1 = "2ff92b71ba1747c5fdd541f8fc87736d82f40ec9"
uuid = "7d9fca2a-8960-54d3-9f78-7d1dccf2cb97"
version = "0.4.0"

[[deps.Arpack_jll]]
deps = ["Libdl", "OpenBLAS_jll", "Pkg"]
git-tree-sha1 = "e214a9b9bd1b4e1b4f15b22c0994862b66af7ff7"
uuid = "68821587-b530-5797-8361-c406ea357684"
version = "3.5.0+3"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.AxisAlgorithms]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "WoodburyMatrices"]
git-tree-sha1 = "66771c8d21c8ff5e3a93379480a2307ac36863f7"
uuid = "13072b0f-2c55-5437-9ae7-d433b7a33950"
version = "1.0.1"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "19a35467a82e236ff51bc17a3a44b69ef35185a2"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.8+0"

[[deps.Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "f2202b55d816427cd385a9a4f3ffb226bee80f99"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.16.1+0"

[[deps.ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "8d954297bc51cc64f15937c2093799c3617b73e4"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.10.0"

[[deps.Clustering]]
deps = ["Distances", "LinearAlgebra", "NearestNeighbors", "Printf", "SparseArrays", "Statistics", "StatsBase"]
git-tree-sha1 = "75479b7df4167267d75294d14b58244695beb2ac"
uuid = "aaaa29a8-35af-508c-8bc3-b662a17a0fe5"
version = "0.14.2"

[[deps.ColorSchemes]]
deps = ["ColorTypes", "Colors", "FixedPointNumbers", "Random"]
git-tree-sha1 = "a851fec56cb73cfdf43762999ec72eff5b86882a"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.15.0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "024fe24d83e4a5bf5fc80501a314ce0d1aa35597"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.0"

[[deps.Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "417b0ed7b8b838aa6ca0a87aadf1bb9eb111ce40"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.8"

[[deps.Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "31d0151f5716b655421d9d75b7fa74cc4e744df2"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.39.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[deps.ConstructionBase]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "f74e9d5388b8620b4cee35d4c5a618dd4dc547f4"
uuid = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
version = "1.3.0"

[[deps.Contour]]
deps = ["StaticArrays"]
git-tree-sha1 = "9f02045d934dc030edad45944ea80dbd1f0ebea7"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.5.7"

[[deps.DataAPI]]
git-tree-sha1 = "cc70b17275652eb47bc9e5f81635981f13cea5c8"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.9.0"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "7d9d316f04214f7efdbb6398d545446e246eff02"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.10"

[[deps.DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[deps.DataValues]]
deps = ["DataValueInterfaces", "Dates"]
git-tree-sha1 = "d88a19299eba280a6d062e135a43f00323ae70bf"
uuid = "e7dc6d0d-1eca-5fa6-8ad6-5aecde8b7ea5"
version = "0.4.13"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[deps.Distances]]
deps = ["LinearAlgebra", "Statistics", "StatsAPI"]
git-tree-sha1 = "9f46deb4d4ee4494ffb5a40a27a2aced67bdd838"
uuid = "b4f34e82-e78d-54a5-968a-f98e89d6e8f7"
version = "0.10.4"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.Distributions]]
deps = ["ChainRulesCore", "FillArrays", "LinearAlgebra", "PDMats", "Printf", "QuadGK", "Random", "SparseArrays", "SpecialFunctions", "Statistics", "StatsBase", "StatsFuns"]
git-tree-sha1 = "9809cf6871ca006d5a4669136c09e77ba08bf51a"
uuid = "31c24e10-a181-5473-b8eb-7969acd0382f"
version = "0.25.20"

[[deps.DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "a32185f5428d3986f47c2ab78b1f216d5e6cc96f"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.8.5"

[[deps.Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[deps.EarCut_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "3f3a2501fa7236e9b911e0f7a588c657e822bb6d"
uuid = "5ae413db-bbd1-5e63-b57d-d24a61df00f5"
version = "2.2.3+0"

[[deps.Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b3bfd02e98aedfa5cf885665493c5598c350cd2f"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.2.10+0"

[[deps.FFMPEG]]
deps = ["FFMPEG_jll"]
git-tree-sha1 = "b57e3acbe22f8484b4b5ff66a7499717fe1a9cc8"
uuid = "c87230d0-a227-11e9-1b43-d7ebe4e7570a"
version = "0.4.1"

[[deps.FFMPEG_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "Pkg", "Zlib_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "d8a578692e3077ac998b50c0217dfd67f21d1e5f"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "4.4.0+0"

[[deps.FFTW]]
deps = ["AbstractFFTs", "FFTW_jll", "LinearAlgebra", "MKL_jll", "Preferences", "Reexport"]
git-tree-sha1 = "463cb335fa22c4ebacfd1faba5fde14edb80d96c"
uuid = "7a1cc6ca-52ef-59f5-83cd-3a7055c09341"
version = "1.4.5"

[[deps.FFTW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c6033cc3892d0ef5bb9cd29b7f2f0331ea5184ea"
uuid = "f5851436-0d7a-5f13-b9de-f02708fd171a"
version = "3.3.10+0"

[[deps.FillArrays]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "Statistics"]
git-tree-sha1 = "8756f9935b7ccc9064c6eef0bff0ad643df733a3"
uuid = "1a297f60-69ca-5386-bcde-b61e274b549b"
version = "0.12.7"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Fontconfig_jll]]
deps = ["Artifacts", "Bzip2_jll", "Expat_jll", "FreeType2_jll", "JLLWrappers", "Libdl", "Libuuid_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "21efd19106a55620a188615da6d3d06cd7f6ee03"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.13.93+0"

[[deps.Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[deps.FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "87eb71354d8ec1a96d4a7636bd57a7347dde3ef9"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.10.4+0"

[[deps.FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "aa31987c2ba8704e23c6c8ba8a4f769d5d7e4f91"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.10+0"

[[deps.GLFW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libglvnd_jll", "Pkg", "Xorg_libXcursor_jll", "Xorg_libXi_jll", "Xorg_libXinerama_jll", "Xorg_libXrandr_jll"]
git-tree-sha1 = "dba1e8614e98949abfa60480b13653813d8f0157"
uuid = "0656b61e-2033-5cc2-a64a-77c0f6c09b89"
version = "3.3.5+0"

[[deps.GR]]
deps = ["Base64", "DelimitedFiles", "GR_jll", "HTTP", "JSON", "Libdl", "LinearAlgebra", "Pkg", "Printf", "Random", "Serialization", "Sockets", "Test", "UUIDs"]
git-tree-sha1 = "d189c6d2004f63fd3c91748c458b09f26de0efaa"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.61.0"

[[deps.GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Pkg", "Qt5Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "cafe0823979a5c9bff86224b3b8de29ea5a44b2e"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.61.0+0"

[[deps.GeometryBasics]]
deps = ["EarCut_jll", "IterTools", "LinearAlgebra", "StaticArrays", "StructArrays", "Tables"]
git-tree-sha1 = "58bcdf5ebc057b085e58d95c138725628dd7453c"
uuid = "5c1252a2-5f33-56bf-86c9-59e7332b4326"
version = "0.4.1"

[[deps.Gettext_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "9b02998aba7bf074d14de89f9d37ca24a1a0b046"
uuid = "78b55507-aeef-58d4-861c-77aaff3498b1"
version = "0.21.0+0"

[[deps.Glib_jll]]
deps = ["Artifacts", "Gettext_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "7bf67e9a481712b3dbe9cb3dac852dc4b1162e02"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.68.3+0"

[[deps.Graphite2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "344bf40dcab1073aca04aa0df4fb092f920e4011"
uuid = "3b182d85-2403-5c21-9c21-1e1f0cc25472"
version = "1.3.14+0"

[[deps.Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[deps.HTTP]]
deps = ["Base64", "Dates", "IniFile", "Logging", "MbedTLS", "NetworkOptions", "Sockets", "URIs"]
git-tree-sha1 = "14eece7a3308b4d8be910e265c724a6ba51a9798"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "0.9.16"

[[deps.HarfBuzz_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "Graphite2_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg"]
git-tree-sha1 = "8a954fed8ac097d5be04921d595f741115c1b2ad"
uuid = "2e76f6c2-a576-52d4-95c1-20adfe4de566"
version = "2.8.1+0"

[[deps.IniFile]]
deps = ["Test"]
git-tree-sha1 = "098e4d2c533924c921f9f9847274f2ad89e018b8"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.0"

[[deps.IntelOpenMP_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "d979e54b71da82f3a65b62553da4fc3d18c9004c"
uuid = "1d5cc7b8-4909-519e-a0f8-d0f5ad9712d0"
version = "2018.0.3+2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.Interpolations]]
deps = ["AxisAlgorithms", "ChainRulesCore", "LinearAlgebra", "OffsetArrays", "Random", "Ratios", "Requires", "SharedArrays", "SparseArrays", "StaticArrays", "WoodburyMatrices"]
git-tree-sha1 = "61aa005707ea2cebf47c8d780da8dc9bc4e0c512"
uuid = "a98d9a8b-a2ab-59e6-89dd-64a1c18fca59"
version = "0.13.4"

[[deps.IrrationalConstants]]
git-tree-sha1 = "7fd44fd4ff43fc60815f8e764c0f352b83c49151"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.1.1"

[[deps.IterTools]]
git-tree-sha1 = "05110a2ab1fc5f932622ffea2a003221f4782c18"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.3.0"

[[deps.IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[deps.JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "642a199af8b68253517b80bd3bfd17eb4e84df6e"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.3.0"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[deps.JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "d735490ac75c5cb9f1b00d8b5509c11984dc6943"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "2.1.0+0"

[[deps.KernelDensity]]
deps = ["Distributions", "DocStringExtensions", "FFTW", "Interpolations", "StatsBase"]
git-tree-sha1 = "591e8dc09ad18386189610acafb970032c519707"
uuid = "5ab0869b-81aa-558d-bb23-cbf5423bbe9b"
version = "0.6.3"

[[deps.LAME_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "f6250b16881adf048549549fba48b1161acdac8c"
uuid = "c1c5ebd0-6772-5130-a774-d5fcae4a789d"
version = "3.100.1+0"

[[deps.LZO_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e5b909bcf985c5e2605737d2ce278ed791b89be6"
uuid = "dd4b983a-f0e5-5f8d-a1b7-129d4a5fb1ac"
version = "2.10.1+0"

[[deps.LaTeXStrings]]
git-tree-sha1 = "c7f1c695e06c01b95a67f0cd1d34994f3e7db104"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.2.1"

[[deps.Latexify]]
deps = ["Formatting", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "Printf", "Requires"]
git-tree-sha1 = "a4b12a1bd2ebade87891ab7e36fdbce582301a92"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.15.6"

[[deps.LazyArtifacts]]
deps = ["Artifacts", "Pkg"]
uuid = "4af54fe1-eca0-43a8-85a7-787d91b784e3"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.Libffi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "761a393aeccd6aa92ec3515e428c26bf99575b3b"
uuid = "e9f186c6-92d2-5b65-8a66-fee21dc1b490"
version = "3.2.2+0"

[[deps.Libgcrypt_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgpg_error_jll", "Pkg"]
git-tree-sha1 = "64613c82a59c120435c067c2b809fc61cf5166ae"
uuid = "d4300ac3-e22c-5743-9152-c294e39db1e4"
version = "1.8.7+0"

[[deps.Libglvnd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll", "Xorg_libXext_jll"]
git-tree-sha1 = "7739f837d6447403596a75d19ed01fd08d6f56bf"
uuid = "7e76a0d4-f3c7-5321-8279-8d96eeed0f29"
version = "1.3.0+3"

[[deps.Libgpg_error_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c333716e46366857753e273ce6a69ee0945a6db9"
uuid = "7add5ba3-2f88-524e-9cd5-f83b8a55f7b8"
version = "1.42.0+0"

[[deps.Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "42b62845d70a619f063a7da093d995ec8e15e778"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.16.1+1"

[[deps.Libmount_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9c30530bf0effd46e15e0fdcf2b8636e78cbbd73"
uuid = "4b2f31a3-9ecc-558c-b454-b3730dcb73e9"
version = "2.35.0+0"

[[deps.Libtiff_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Pkg", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "340e257aada13f95f98ee352d316c3bed37c8ab9"
uuid = "89763e89-9b03-5906-acba-b20f662cd828"
version = "4.3.0+0"

[[deps.Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7f3efec06033682db852f8b3bc3c1d2b0a0ab066"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.36.0+0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.LogExpFunctions]]
deps = ["ChainRulesCore", "DocStringExtensions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "34dc30f868e368f8a17b728a1238f3fcda43931a"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.3"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.MKL_jll]]
deps = ["Artifacts", "IntelOpenMP_jll", "JLLWrappers", "LazyArtifacts", "Libdl", "Pkg"]
git-tree-sha1 = "5455aef09b40e5020e1520f551fa3135040d4ed0"
uuid = "856f044c-d86e-5d09-b602-aeab76dc8ba7"
version = "2021.1.1+2"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "5a5bc6bf062f0f95e62d0fe0a2d99699fed82dd9"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.8"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "Random", "Sockets"]
git-tree-sha1 = "1c38e51c3d08ef2278062ebceade0e46cefc96fe"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.0.3"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[deps.Measures]]
git-tree-sha1 = "e498ddeee6f9fdb4551ce855a46f54dbd900245f"
uuid = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
version = "0.3.1"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "bf210ce90b6c9eed32d25dbcae1ebc565df2687f"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.0.2"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[deps.MultivariateStats]]
deps = ["Arpack", "LinearAlgebra", "SparseArrays", "Statistics", "StatsBase"]
git-tree-sha1 = "8d958ff1854b166003238fe191ec34b9d592860a"
uuid = "6f286f6a-111f-5878-ab1e-185364afe411"
version = "0.8.0"

[[deps.NaNMath]]
git-tree-sha1 = "bfe47e760d60b82b66b61d2d44128b62e3a369fb"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "0.3.5"

[[deps.NearestNeighbors]]
deps = ["Distances", "StaticArrays"]
git-tree-sha1 = "16baacfdc8758bc374882566c9187e785e85c2f0"
uuid = "b8a86587-4115-5ab1-83bc-aa920d37bbce"
version = "0.4.9"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[deps.Observables]]
git-tree-sha1 = "fe29afdef3d0c4a8286128d4e45cc50621b1e43d"
uuid = "510215fc-4207-5dde-b226-833fc4488ee2"
version = "0.4.0"

[[deps.OffsetArrays]]
deps = ["Adapt"]
git-tree-sha1 = "c0e9e582987d36d5a61e650e6e543b9e44d9914b"
uuid = "6fe1bfb0-de20-5000-8ca7-80f57d26f881"
version = "1.10.7"

[[deps.Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7937eda4681660b4d6aeeecc2f7e1c81c8ee4e2f"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.5+0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[deps.OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "15003dcb7d8db3c6c857fda14891a539a8f2705a"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "1.1.10+0"

[[deps.OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "13652491f6856acfd2db29360e1bbcd4565d04f1"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.5+0"

[[deps.Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "51a08fb14ec28da2ec7a927c4337e4332c2a4720"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.3.2+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.PCRE_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b2a7af664e098055a7529ad1a900ded962bca488"
uuid = "2f80f16e-611a-54ab-bc61-aa92de5b98fc"
version = "8.44.0+0"

[[deps.PDMats]]
deps = ["LinearAlgebra", "SparseArrays", "SuiteSparse"]
git-tree-sha1 = "4dd403333bcf0909341cfe57ec115152f937d7d8"
uuid = "90014a1f-27ba-587c-ab20-58faa44d9150"
version = "0.11.1"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "98f59ff3639b3d9485a03a72f3ab35bab9465720"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.0.6"

[[deps.Pixman_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b4f5d02549a10e20780a24fce72bea96b6329e29"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.40.1+0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[deps.PlotThemes]]
deps = ["PlotUtils", "Requires", "Statistics"]
git-tree-sha1 = "a3a964ce9dc7898193536002a6dd892b1b5a6f1d"
uuid = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
version = "2.0.1"

[[deps.PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "Printf", "Random", "Reexport", "Statistics"]
git-tree-sha1 = "b084324b4af5a438cd63619fd006614b3b20b87b"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.0.15"

[[deps.Plots]]
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "GeometryBasics", "JSON", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "PlotThemes", "PlotUtils", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "Requires", "Scratch", "Showoff", "SparseArrays", "Statistics", "StatsBase", "UUIDs"]
git-tree-sha1 = "ba43b248a1f04a9667ca4a9f782321d9211aa68e"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.22.6"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "00cfd92944ca9c760982747e9a1d0d5d86ab1e5a"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.2.2"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.Qt5Base_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Fontconfig_jll", "Glib_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "OpenSSL_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libxcb_jll", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_keysyms_jll", "Xorg_xcb_util_renderutil_jll", "Xorg_xcb_util_wm_jll", "Zlib_jll", "xkbcommon_jll"]
git-tree-sha1 = "ad368663a5e20dbb8d6dc2fddeefe4dae0781ae8"
uuid = "ea2cea3b-5b76-57ae-a6ef-0a8af62496e1"
version = "5.15.3+0"

[[deps.QuadGK]]
deps = ["DataStructures", "LinearAlgebra"]
git-tree-sha1 = "78aadffb3efd2155af139781b8a8df1ef279ea39"
uuid = "1fd47b50-473d-5c70-9696-f719f8f3bcdc"
version = "2.4.2"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Ratios]]
deps = ["Requires"]
git-tree-sha1 = "01d341f502250e81f6fec0afe662aa861392a3aa"
uuid = "c84ed2f1-dad5-54f0-aa8e-dbefe2724439"
version = "0.4.2"

[[deps.RecipesBase]]
git-tree-sha1 = "44a75aa7a527910ee3d1751d1f0e4148698add9e"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.1.2"

[[deps.RecipesPipeline]]
deps = ["Dates", "NaNMath", "PlotUtils", "RecipesBase"]
git-tree-sha1 = "7ad0dfa8d03b7bcf8c597f59f5292801730c55b8"
uuid = "01d81517-befc-4cb6-b9ec-a95719d0359c"
version = "0.4.1"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "4036a3bd08ac7e968e27c203d45f5fff15020621"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.1.3"

[[deps.Rmath]]
deps = ["Random", "Rmath_jll"]
git-tree-sha1 = "bf3188feca147ce108c76ad82c2792c57abe7b1f"
uuid = "79098fc4-a85e-5d69-aa6a-4863f24498fa"
version = "0.7.0"

[[deps.Rmath_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "68db32dff12bb6127bac73c209881191bf0efbb7"
uuid = "f50d1b31-88e8-58de-be2c-1cc44531875f"
version = "0.3.0+0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[deps.Scratch]]
deps = ["Dates"]
git-tree-sha1 = "0b4b7f1393cff97c33891da2a0bf69c6ed241fda"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.1.0"

[[deps.SentinelArrays]]
deps = ["Dates", "Random"]
git-tree-sha1 = "54f37736d8934a12a200edea2f9206b03bdf3159"
uuid = "91c51154-3ec4-41a3-a24f-3f23e20d615c"
version = "1.3.7"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[deps.Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "91eddf657aca81df9ae6ceb20b959ae5653ad1de"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "1.0.3"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "b3363d7460f7d098ca0912c69b082f75625d7508"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.0.1"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.SpecialFunctions]]
deps = ["ChainRulesCore", "IrrationalConstants", "LogExpFunctions", "OpenLibm_jll", "OpenSpecFun_jll"]
git-tree-sha1 = "793793f1df98e3d7d554b65a107e9c9a6399a6ed"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "1.7.0"

[[deps.StaticArrays]]
deps = ["LinearAlgebra", "Random", "Statistics"]
git-tree-sha1 = "3c76dde64d03699e074ac02eb2e8ba8254d428da"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.2.13"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.StatsAPI]]
git-tree-sha1 = "1958272568dc176a1d881acb797beb909c785510"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.0.0"

[[deps.StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "eb35dcc66558b2dda84079b9a1be17557d32091a"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.12"

[[deps.StatsFuns]]
deps = ["ChainRulesCore", "IrrationalConstants", "LogExpFunctions", "Reexport", "Rmath", "SpecialFunctions"]
git-tree-sha1 = "95072ef1a22b057b1e80f73c2a89ad238ae4cfff"
uuid = "4c63d2b9-4356-54db-8cca-17b64c39e42c"
version = "0.9.12"

[[deps.StatsPlots]]
deps = ["Clustering", "DataStructures", "DataValues", "Distributions", "Interpolations", "KernelDensity", "LinearAlgebra", "MultivariateStats", "Observables", "Plots", "RecipesBase", "RecipesPipeline", "Reexport", "StatsBase", "TableOperations", "Tables", "Widgets"]
git-tree-sha1 = "eb007bb78d8a46ab98cd14188e3cec139a4476cf"
uuid = "f3b207a7-027a-5e70-b257-86293d7955fd"
version = "0.14.28"

[[deps.StructArrays]]
deps = ["Adapt", "DataAPI", "StaticArrays", "Tables"]
git-tree-sha1 = "2ce41e0d042c60ecd131e9fb7154a3bfadbf50d3"
uuid = "09ab397b-f2b6-538f-b94a-2f83cf4a842a"
version = "0.6.3"

[[deps.SuiteSparse]]
deps = ["Libdl", "LinearAlgebra", "Serialization", "SparseArrays"]
uuid = "4607b0f0-06f3-5cda-b6b1-a6196a1729e9"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[deps.TableOperations]]
deps = ["SentinelArrays", "Tables", "Test"]
git-tree-sha1 = "019acfd5a4a6c5f0f38de69f2ff7ed527f1881da"
uuid = "ab02a1b2-a7df-11e8-156e-fb1833f50b87"
version = "1.1.0"

[[deps.TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[deps.Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "TableTraits", "Test"]
git-tree-sha1 = "fed34d0e71b91734bf0a7e10eb1bb05296ddbcd0"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.6.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Unitful]]
deps = ["ConstructionBase", "Dates", "LinearAlgebra", "Random"]
git-tree-sha1 = "a981a8ef8714cba2fd9780b22fd7a469e7aaf56d"
uuid = "1986cc42-f94f-5a68-af5c-568840ba703d"
version = "1.9.0"

[[deps.Wayland_jll]]
deps = ["Artifacts", "Expat_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "3e61f0b86f90dacb0bc0e73a0c5a83f6a8636e23"
uuid = "a2964d1f-97da-50d4-b82a-358c7fce9d89"
version = "1.19.0+0"

[[deps.Wayland_protocols_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Wayland_jll"]
git-tree-sha1 = "2839f1c1296940218e35df0bbb220f2a79686670"
uuid = "2381bf8a-dfd0-557d-9999-79630e7b1b91"
version = "1.18.0+4"

[[deps.Widgets]]
deps = ["Colors", "Dates", "Observables", "OrderedCollections"]
git-tree-sha1 = "80661f59d28714632132c73779f8becc19a113f2"
uuid = "cc8bc4a8-27d6-5769-a93b-9d913e69aa62"
version = "0.6.4"

[[deps.WoodburyMatrices]]
deps = ["LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "9398e8fefd83bde121d5127114bd3b6762c764a6"
uuid = "efce3f68-66dc-5838-9240-27a6d6f5f9b6"
version = "0.5.4"

[[deps.XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "1acf5bdf07aa0907e0a37d3718bb88d4b687b74a"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.9.12+0"

[[deps.XSLT_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgcrypt_jll", "Libgpg_error_jll", "Libiconv_jll", "Pkg", "XML2_jll", "Zlib_jll"]
git-tree-sha1 = "91844873c4085240b95e795f692c4cec4d805f8a"
uuid = "aed1982a-8fda-507f-9586-7b0439959a61"
version = "1.1.34+0"

[[deps.Xorg_libX11_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll", "Xorg_xtrans_jll"]
git-tree-sha1 = "5be649d550f3f4b95308bf0183b82e2582876527"
uuid = "4f6342f7-b3d2-589e-9d20-edeb45f2b2bc"
version = "1.6.9+4"

[[deps.Xorg_libXau_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4e490d5c960c314f33885790ed410ff3a94ce67e"
uuid = "0c0b7dd1-d40b-584c-a123-a41640f87eec"
version = "1.0.9+4"

[[deps.Xorg_libXcursor_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXfixes_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "12e0eb3bc634fa2080c1c37fccf56f7c22989afd"
uuid = "935fb764-8cf2-53bf-bb30-45bb1f8bf724"
version = "1.2.0+4"

[[deps.Xorg_libXdmcp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fe47bd2247248125c428978740e18a681372dd4"
uuid = "a3789734-cfe1-5b06-b2d0-1dd0d9d62d05"
version = "1.1.3+4"

[[deps.Xorg_libXext_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "b7c0aa8c376b31e4852b360222848637f481f8c3"
uuid = "1082639a-0dae-5f34-9b06-72781eeb8cb3"
version = "1.3.4+4"

[[deps.Xorg_libXfixes_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "0e0dc7431e7a0587559f9294aeec269471c991a4"
uuid = "d091e8ba-531a-589c-9de9-94069b037ed8"
version = "5.0.3+4"

[[deps.Xorg_libXi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXfixes_jll"]
git-tree-sha1 = "89b52bc2160aadc84d707093930ef0bffa641246"
uuid = "a51aa0fd-4e3c-5386-b890-e753decda492"
version = "1.7.10+4"

[[deps.Xorg_libXinerama_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll"]
git-tree-sha1 = "26be8b1c342929259317d8b9f7b53bf2bb73b123"
uuid = "d1454406-59df-5ea1-beac-c340f2130bc3"
version = "1.1.4+4"

[[deps.Xorg_libXrandr_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "34cea83cb726fb58f325887bf0612c6b3fb17631"
uuid = "ec84b674-ba8e-5d96-8ba1-2a689ba10484"
version = "1.5.2+4"

[[deps.Xorg_libXrender_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "19560f30fd49f4d4efbe7002a1037f8c43d43b96"
uuid = "ea2f1a96-1ddc-540d-b46f-429655e07cfa"
version = "0.9.10+4"

[[deps.Xorg_libpthread_stubs_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "6783737e45d3c59a4a4c4091f5f88cdcf0908cbb"
uuid = "14d82f49-176c-5ed1-bb49-ad3f5cbd8c74"
version = "0.1.0+3"

[[deps.Xorg_libxcb_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "XSLT_jll", "Xorg_libXau_jll", "Xorg_libXdmcp_jll", "Xorg_libpthread_stubs_jll"]
git-tree-sha1 = "daf17f441228e7a3833846cd048892861cff16d6"
uuid = "c7cfdc94-dc32-55de-ac96-5a1b8d977c5b"
version = "1.13.0+3"

[[deps.Xorg_libxkbfile_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "926af861744212db0eb001d9e40b5d16292080b2"
uuid = "cc61e674-0454-545c-8b26-ed2c68acab7a"
version = "1.1.0+4"

[[deps.Xorg_xcb_util_image_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "0fab0a40349ba1cba2c1da699243396ff8e94b97"
uuid = "12413925-8142-5f55-bb0e-6d7ca50bb09b"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll"]
git-tree-sha1 = "e7fd7b2881fa2eaa72717420894d3938177862d1"
uuid = "2def613f-5ad1-5310-b15b-b15d46f528f5"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_keysyms_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "d1151e2c45a544f32441a567d1690e701ec89b00"
uuid = "975044d2-76e6-5fbe-bf08-97ce7c6574c7"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_renderutil_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "dfd7a8f38d4613b6a575253b3174dd991ca6183e"
uuid = "0d47668e-0667-5a69-a72c-f761630bfb7e"
version = "0.3.9+1"

[[deps.Xorg_xcb_util_wm_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "e78d10aab01a4a154142c5006ed44fd9e8e31b67"
uuid = "c22f9ab0-d5fe-5066-847c-f4bb1cd4e361"
version = "0.4.1+1"

[[deps.Xorg_xkbcomp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxkbfile_jll"]
git-tree-sha1 = "4bcbf660f6c2e714f87e960a171b119d06ee163b"
uuid = "35661453-b289-5fab-8a00-3d9160c6a3a4"
version = "1.4.2+4"

[[deps.Xorg_xkeyboard_config_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xkbcomp_jll"]
git-tree-sha1 = "5c8424f8a67c3f2209646d4425f3d415fee5931d"
uuid = "33bec58e-1273-512f-9401-5d533626f822"
version = "2.27.0+4"

[[deps.Xorg_xtrans_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "79c31e7844f6ecf779705fbc12146eb190b7d845"
uuid = "c5fb5394-a638-5e4d-96e5-b29de1b5cf10"
version = "1.4.0+3"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[deps.Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "cc4bf3fdde8b7e3e9fa0351bdeedba1cf3b7f6e6"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.0+0"

[[deps.libass_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "5982a94fcba20f02f42ace44b9894ee2b140fe47"
uuid = "0ac62f75-1d6f-5e53-bd7c-93b484bb37c0"
version = "0.15.1+0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"

[[deps.libfdk_aac_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "daacc84a041563f965be61859a36e17c4e4fcd55"
uuid = "f638f0a6-7fb0-5443-88ba-1cc74229b280"
version = "2.0.2+0"

[[deps.libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "94d180a6d2b5e55e447e2d27a29ed04fe79eb30c"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.38+0"

[[deps.libvorbis_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Ogg_jll", "Pkg"]
git-tree-sha1 = "c45f4e40e7aafe9d086379e5578947ec8b95a8fb"
uuid = "f27f6e37-5d2b-51aa-960f-b287f2bc3b7a"
version = "1.3.7+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"

[[deps.x264_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fea590b89e6ec504593146bf8b988b2c00922b2"
uuid = "1270edf5-f2f9-52d2-97e9-ab00b5d0237a"
version = "2021.5.5+0"

[[deps.x265_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "ee567a171cce03570d77ad3a43e90218e38937a9"
uuid = "dfaa095f-4041-5dcd-9319-2fabd8486b76"
version = "3.5.0+0"

[[deps.xkbcommon_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Wayland_jll", "Wayland_protocols_jll", "Xorg_libxcb_jll", "Xorg_xkeyboard_config_jll"]
git-tree-sha1 = "ece2350174195bb31de1a63bea3a41ae1aa593b6"
uuid = "d8fb68d0-12a3-5cfd-a85a-d49703b185fd"
version = "0.9.1+5"
"""

# ╔═╡ Cell order:
# ╟─2c4ea052-e43e-4200-bc18-b44e2a605c97
# ╠═3a5820e4-6290-480b-a084-b0007b402fc5
# ╠═11e58702-720e-4d23-a9a6-32512e800b31
# ╠═377434da-3852-4802-8f35-8fcc20552b40
# ╠═279302fb-0656-4a7b-876f-1a4e571d16ac
# ╠═275ff4f1-eaa5-4c69-8ba8-d7f42bb43ca8
# ╠═07638144-8de1-4f59-9ba0-ec2eb60ddee5
# ╠═c0b617b3-b4b6-4b7f-9d86-b01bc9dfa2ef
# ╟─9e93896f-c94b-4ea2-9b5b-5228ca01bb68
# ╠═6023a230-e135-44b5-ad65-a093558c2ba5
# ╟─8d63a2eb-fd5e-4428-8542-15da4b600b82
# ╠═2d342f4d-b06e-44d3-8f7e-22b9f3becafc
# ╠═7c2cb818-4ab8-40c2-a9a6-7e5014fba77f
# ╠═f2dccb5c-54ba-4618-9035-0bf4e5f7453c
# ╠═5f0eca7d-95fc-4377-b3bc-ddcaec9e6a93
# ╟─6f053b72-029b-4cba-b5f1-fb3c9c258143
# ╠═8c47757d-0eb4-459e-b657-7a377d9275c5
# ╟─e9b49713-397e-48ad-8382-38dff98fa5a4
# ╟─a50841fe-3a25-452f-b1a3-f3267f89579c
# ╠═a5f84adb-5bca-4a17-8727-07f1e45810ab
# ╠═afa0e81e-f7bc-4581-91fe-04a608191488
# ╠═7c72c753-af60-49c4-b4f9-bd1d04025035
# ╠═99ab2f65-9f2f-4128-bae0-122e421a9f50
# ╟─18e3a98a-7c46-4c79-a28f-a756c62d982b
# ╠═c0b2f016-044a-4eb2-a046-aa584375fdc1
# ╟─e3585a43-e65f-4de8-be9d-39606c555155
# ╠═4609f6dd-08d1-4abb-ab83-9e0dc30a4e1c
# ╠═8609a4e0-fca7-40e6-9793-e64b19613f76
# ╠═1551d9d1-50bf-4d7d-9cf5-270ae4ebfca7
# ╠═9fd7b024-a9db-4927-823c-ac33924adf25
# ╠═7403bf4b-220c-4045-a276-a6c05974b0c6
# ╟─dbbc3006-a8b9-49c7-985a-a9503585c36b
# ╠═64159f40-e145-431d-bd8c-abf138e324c6
# ╟─83c8e663-24d7-4037-950e-796b6af8f2c6
# ╠═0b71e865-e549-43b7-9621-287311ee5ec0
# ╠═4191cfbd-c436-43e2-9ae7-3fead0fc8de6
# ╠═fefa24a4-467a-4fda-8739-719362c93b05
# ╟─b265841b-95f5-4c2f-a891-3fe97e76e232
# ╠═e19ec737-7ab3-4e65-9f6b-8b32631063d1
# ╠═a69b8dc5-de9b-455a-8958-574e160b4249
# ╟─680ea7e3-772b-4a7e-8b95-f1008bafbd5f
# ╠═6e588c60-2284-4de1-bf40-1799ff6eee2f
# ╟─cb81aa8f-9d4d-4981-b62a-dd02ac2d8a4f
# ╟─56e3024e-03ea-4d7b-a139-d7965636cc70
# ╠═6fde343a-f7fd-4c86-b070-5ffd623e413a
# ╠═6200b837-8fdd-43dc-8a08-1f84fa5c931e
# ╠═80abf9cb-604c-4e78-8d12-c80c6d6571cc
# ╠═ef607ef8-6fa1-4d27-ac61-3731ac98b41e
# ╠═975caab4-d607-4dfa-88b1-bc549f636f95
# ╠═31715fa4-bbc8-46e7-89dc-dfe73446c9ef
# ╠═1c677bb9-8ddc-414b-9854-9d7794ad3858
# ╠═6315ba57-e087-4361-81c4-2f742a9678b9
# ╟─a2990848-5297-48c2-b487-5792a992ce78
# ╠═38413ace-af71-42e7-a2c3-377ca41f8dda
# ╠═efef2a72-3046-4b75-9c7b-d5b932929b30
# ╟─f6817d36-665e-4433-bf9b-a738ee515a90
# ╟─39a3cde5-0726-4053-9a12-c2e1e376eaa2
# ╟─4a6d7b6a-f1c1-4c2f-9564-0f69c8a3bc34
# ╠═580c3c33-d496-42f5-8999-b956d8ddbf55
# ╠═9f04207a-9aff-494f-915e-21a39b1adaf0
# ╠═8afae57f-26c4-4454-84d1-81ce0338b31b
# ╠═3d49837d-d5b0-4c70-b224-0b0731e1bd14
# ╠═d2601987-d9d3-4179-a41d-257432a97dc9
# ╠═94469feb-b9e7-446e-b597-67b65c0a9e9b
# ╠═2c4220a9-aa81-4b30-9dd1-9b176fd48ad2
# ╠═26538df1-e990-4156-889b-635c58d56ebe
# ╠═408b61cb-e14d-4955-928f-c08f42540139
# ╟─2fdad04e-f330-407f-835c-0051158ea205
# ╠═f2d6278a-a1a2-4118-89b8-8b5c7d3ec72c
# ╠═0ba2517f-4b75-428c-9ce8-2a123cdb7896
# ╠═cf592bbf-c3e5-44ba-b8a2-abea926eff51
# ╠═c9698143-dedf-4206-b847-320535b50ed7
# ╟─874364c0-a284-4b34-a758-eadf9a95c9e3
# ╠═9735729b-49a3-4507-9c9b-d5aee3495595
# ╟─e24786f8-172a-42b2-bb70-128684ff2604
# ╠═8e927e6c-6621-4e4d-b745-84056812b2ba
# ╟─05c4a4a8-400d-4170-857b-712255fccee1
# ╟─85e6da05-453f-49c0-b811-aa81ed87b869
# ╠═347743cd-bf33-469f-b64e-d947fd4a6d0e
# ╟─02a135ff-eb5a-4c21-b579-a2387beff2e7
# ╠═85622700-6ceb-4849-a842-b257a093113f
# ╠═8ff0f105-bd17-4e8c-a5e0-84e12ef1873e
# ╟─1c597935-a171-4c4b-b059-425fc09d73c4
# ╠═ef2af08a-b282-4bfd-a17e-b1177c0d072b
# ╟─29df0242-c1f6-4844-8149-7ef4a1401225
# ╠═8c88567f-2098-456e-b240-92b6173d2d7c
# ╟─13333a78-af51-47c3-889a-2801f794c0d0
# ╠═c0202f3f-444e-4e78-99d0-ba192210e825
# ╠═ccccb385-e422-4a20-876f-1c57e41c0ebd
# ╠═ee3180cf-d41b-4bec-b538-83d76b971d9f
# ╠═ae8aaac9-915e-474a-b1e1-b35268b905ee
# ╟─45c03247-f235-47d0-8660-075f90327add
# ╠═9bf08f5b-a486-4240-a085-35422bdca8ab
# ╟─5bcb8b48-7795-4cb4-a324-ffee18d8bafd
# ╟─d3999f96-6cc9-42a7-b7a9-919b3a65c3c1
# ╠═d703431b-ca83-43e1-b366-139d87d2d8bd
# ╠═bd921e79-40bf-4a1c-aa52-8d5f430b5abc
# ╠═28b01ed5-63a8-436c-9bfc-cefaee9cf754
# ╟─4028710a-ee13-47da-a1e9-eea4af2bb445
# ╠═1273b670-c924-4aaf-bb1f-cc12290c1b8d
# ╠═fee27dda-16f8-4d05-92ca-bdbc7b3e6d99
# ╟─69fec420-dd1e-44e3-a053-08e213f3b914
# ╠═a712f0c0-ecfa-4426-b56b-34394a71b293
# ╟─7e50a3c6-64e3-433f-ba8e-56c6940c6444
# ╠═fad46628-096b-48a5-ac68-f2ee8706b22b
# ╠═f4cc6b91-4b29-4f20-8acf-1f9ad5a05d48
# ╟─ce9f2a15-a539-46a1-8ad7-b2a92b7e9c7d
# ╠═0fc7376f-2cb0-4cbd-ace3-e5e639ca7897
# ╠═72f57501-c3a4-4524-9c3d-f18f5b695a6d
# ╠═3fe9fdec-fdc4-4666-9355-01affc1a0b88
# ╠═bceb4df4-01ef-4c17-a898-767bccd74aab
# ╠═6f74dbe4-ef34-4f0a-a257-dd50f378694b
# ╠═3ba41fe0-a82a-4185-9eb1-fb558c050fd3
# ╟─2eefce35-e193-4659-99a3-760a73864fed
# ╠═1674c224-e6a7-4d3e-9e4e-cdebd36a5315
# ╠═da4ad281-262c-48af-89ff-8326a204ce09
# ╠═831e07be-c4c9-4e94-8dc3-696ffa93b7cb
# ╠═2189af2f-f48b-480e-bbe1-4a5c3bf216c9
# ╟─3cd401c0-626f-468d-9239-f226dce0ea65
# ╠═c796d961-c8df-46b2-a357-3e6c3183ae00
# ╟─de4573ff-4e8c-4009-882f-9580b2fc8be8
# ╠═28b3954c-028d-4ce5-a642-646387d44e26
# ╟─c399d84a-cc32-48e0-af8b-b77802a2f48d
# ╟─031689fb-f6db-45cb-b29d-0a8724a96392
# ╠═0a6bfb0f-703b-4323-b1c9-5228e95439fa
# ╠═49fc6b9f-0268-42e1-8799-5f9112daa94d
# ╠═ab6e2563-5cb8-40ef-8e4f-3b9196c2faf2
# ╟─274ed90a-40d1-4607-aae8-e4b8d5dffd27
# ╠═6bbb2b93-1d82-4657-baff-d65600df034e
# ╟─dd9f5841-51c9-4bfc-841c-f8332c32d300
# ╟─bbd56f2e-17ff-4e90-b566-ca4bcd0ec532
# ╠═dd5ec629-1ffc-42c5-9b92-75472224cdbc
# ╠═5a167dca-39cd-4499-8299-940c004ba63e
# ╟─3b61e90c-89fb-4d91-a110-3b9d4242cf2d
# ╠═f1fb478a-4421-44dc-948f-35cc06a3c40d
# ╟─4b07f8b2-0484-4555-b0cb-8caa4bb7404c
# ╠═921e3747-da80-4049-a127-810a443163d7
# ╠═702b9d63-dbc5-4780-897f-23169687ea07
# ╠═a9910256-2836-42a8-8c30-faea02cfadf2
# ╠═59d9a589-614e-4f13-81e9-799f6eac8112
# ╟─027f3a6e-19af-4858-9aae-69e25a24b5fa
# ╠═eae82cec-81bb-41ae-b8fb-0a024f86409a
# ╠═3c9cd0d8-5186-4946-986f-9daf20d70e80
# ╠═aeca76f9-4cc8-402c-9c8a-8f769ea53e2f
# ╠═ee7a28d7-ee35-4867-a54d-2e128cb41dce
# ╟─4823ca31-4552-4886-9f51-18937db0e992
# ╠═d1888134-f86d-446b-b586-6b19f7396ef4
# ╠═1a37b9fa-609c-4f90-9103-4ab32958f189
# ╟─15930f49-9168-43ba-8d0a-fe94106a0f64
# ╠═b4e7b378-afa4-4bfa-87da-05a13b3333fc
# ╟─4041297b-0e2f-4bc5-bed1-727f7ee50454
# ╠═30b789ac-6f8b-4e5b-bdd5-a68984363cf0
# ╟─eb7af092-86de-4731-b1de-a3c3f8c68761
# ╠═860aea6e-f84e-4b60-8ca4-3ebd2fc0e3eb
# ╟─ef244196-059e-4f29-80e2-7a08d13f3b03
# ╠═a34203c1-4670-4a16-81b4-7498f8b8ae2a
# ╠═4b1e44f1-d680-4dc8-b63c-827cc2a02eae
# ╠═fba1172f-7e7c-45a5-9f75-6dc557953ccc
# ╠═24fadc1b-a350-4ca6-8f14-6ea080528c95
# ╠═fab6e71f-ace5-48aa-9ed8-c6bc8e82db46
# ╠═19d06208-ad38-499a-92e0-02547c4c3b68
# ╠═3741c160-8b36-4fa1-a91c-ae8beaa2fda4
# ╠═5a0fe5cd-4ff3-499f-8064-fd8f0a4a3257
# ╟─4feb84ac-deea-4e51-93ca-30e4bb03e63e
# ╠═4007fa62-e24f-4acf-a160-c41df8facc86
# ╠═b8b3e789-9812-48f5-b7e3-dc52867d3896
# ╠═9cef4570-2a81-43ad-a726-08bec670a624
# ╠═2a9bc01f-b28d-43bc-9bef-5ef7cff6bd2e
# ╠═4c956af1-c895-4b2c-8bb6-72115fd68ad1
# ╠═b05a3ca6-c615-4ecf-9276-29e365f6e398
# ╠═74befd16-5f58-4730-946c-9f3360b1ea6d
# ╟─5fc3b26b-e2a6-438b-bbbf-c1b7c9a77cc5
# ╟─caa9ed10-91cb-4557-9460-04f82e411a55
# ╠═5bc4284d-1cfb-4573-9585-4e246dd8d915
# ╟─3298dc1b-786f-47b2-a38f-726aabb1f60e
# ╠═5291c800-fb5a-4d1f-847f-86a8130b4dfb
# ╠═f9c7fd0c-49df-4bd6-97ee-2107ffc53613
# ╠═4d5512a9-5f85-48ee-8e8d-3e4fa75043cc
# ╠═9e6526a2-41c2-4cc5-b6de-14fb20a38665
# ╟─95fe895e-3b63-44e2-98cc-0c91b1470fcf
# ╟─89621a82-b3ba-4a70-b095-d51fd90470ae
# ╠═66886c25-88c4-48a9-8a79-6468971738f2
# ╠═6f9c23ae-de27-417d-a824-b4c4e4792546
# ╠═9cb5bc58-a93a-4766-9f8f-55d13ca47a53
# ╠═9f82361e-2c5c-4a74-80d2-77161c7e59c4
# ╠═aa3dda74-9562-4a48-81ad-53d40939521e
# ╠═63c9c4d2-d480-4038-b6e1-c0cba187963e
# ╟─4effc2fd-ec8d-42ed-ab11-3db1901e0679
# ╠═5dea975a-7033-47c4-966e-43e4c97ab9e5
# ╟─f0e5ba5b-80f9-4b05-a8eb-9c29c79a1520
# ╠═9e2e8a77-9e39-4ec1-af16-f96b0b29990a
# ╠═342a368b-35be-4344-a2da-2e71f6cc769b
# ╠═ccece351-82ce-4646-85e8-40dbfb0b8d57
# ╠═e47424a6-7ac0-40a9-9fbb-4b22af660287
# ╠═98236fe2-8f25-4873-8de8-9d54ad4a583f
# ╠═d0a355d7-8f0b-4914-8c28-5193f46c8a81
# ╠═97bfe748-a8fe-4575-a5d5-93eaa6fead87
# ╠═4b302233-2ced-4ed7-8341-d0d9b88f0d8f
# ╠═b7073a0c-27f1-4a8d-819d-bc216524ef6a
# ╠═ec9aa50d-bbb4-43f6-9d42-7d0f94a49a78
# ╠═58641cbe-ec0a-47af-a624-55a737122482
# ╠═9902a886-ac5a-4bb9-88fb-e4630f94fdf1
# ╠═8827e5fc-1aef-46d4-bf4e-268243a8571d
# ╠═f5465eee-7c96-4d07-91c4-0dc8e902d491
# ╟─e19aed91-58fb-4bf4-94c2-90a60b4a0fea
# ╠═7eb7f057-1c6f-402a-8e6f-afc5c2414e27
# ╠═266d85f2-423b-4226-946c-622e5fccfa88
# ╠═664cb485-3bf6-4e87-9370-faf28acc4370
# ╠═93b82c6a-6801-47c4-8849-f1e0faced6ad
# ╠═c75ff8c9-36ea-41f2-ba51-8d3689de71cc
# ╟─f07dc093-2d02-4fd6-9dd4-c0b6d7131c5d
# ╠═5397b484-404b-4d66-b4e4-fa858ce8dbb5
# ╠═54916ce4-463f-4552-97c3-a3de4f437401
# ╟─bfae3c5d-3f28-48e5-b39c-d47a20d528bd
# ╟─6bc3a949-e060-4d1a-b57e-6f621821b12b
# ╠═c22199d2-6d8b-43e7-8a1d-03e44836ae48
# ╠═264d2f6c-dddd-441b-9222-2cf7a6ad00a4
# ╠═68f15c7b-9c9a-4766-9833-bf08e91cbf7a
# ╠═13b44a23-e32c-47eb-aa8a-d3e5100d51d1
# ╠═67f8aee8-8bb2-47da-acaf-c66a4d35a14f
# ╠═78e01ec5-e1e9-4a14-b7ac-c5b934edd141
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
