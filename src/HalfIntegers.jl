module HalfIntegers

#   This file is part of HalfIntegers.jl. It is licensed under the MIT license
#   HalfIntegers Copyright (C) 2021 Michael Reed

export Half, twice

struct Half{T} <: Real
    n::T
    Half(n::T) where T<:Integer = new{T}(n)
    Half{T}(n::T) where T<:Integer = new{T}(n)
end

Base.show(io::IO,n::Half) = print(io,Float64(n))

# access / conversion

twice(n::Half) = n.n
Base.Float64(n::Half) = twice(n)/2
Base.convert(::Type{Half{T}},n::T) where T<:Integer = Half{T}(2n)
Base.convert(::Type{Half},n::T) where T<:Integer = Half{T}(2n)

# algebra

for op ∈ (:+,:-,:*,:/)
    @eval begin
        Base.$op(a::Half,b::Half) = Half($op(twice(a),twice(b)))
        Base.$op(a::Half,b::T) where T<:Integer = Half($op(twice(a),2b))
        Base.$op(a::T,b::Half) where T<:Integer = Half($op(2a,twice(b)))
        Base.$op(a::Half,b::T) where T<:Number = $op(Float64(a),b)
        Base.$op(a::T,b::Half) where T<:Number = $op(a,Float64(b))
    end
end

for op ∈ (:(==),:isapprox)
    @eval begin
        Base.$op(a::Half,b::Half) = $op(twice(a),twice(b))
        Base.$op(a::Half,b::T) where T<:Integer = $op(twice(a),2b)
        Base.$op(a::T,b::Half) where T<:Integer = $op(2a,twice(b))
        Base.$op(a::Half,b::T) where T<:Number = $op(Float64(a),b)
        Base.$op(a::T,b::Half) where T<:Number = $op(a,Float64(b))
    end
end

end # module
