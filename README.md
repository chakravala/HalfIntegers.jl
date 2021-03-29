# HalfIntegers.jl

Number type for `Half{<:Integer}` values:

```Julia
julia> Half(3) == 1.5
true

julia> Half(3) + Half(1)
2.0

julia> Half(3) + 1
2.5
```
