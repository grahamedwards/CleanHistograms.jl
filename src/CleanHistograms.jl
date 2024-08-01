module CleanHistograms

export cleanhist

"""

    interleave(a)

Interleave the sequential values of a vector `a` so that each value occurs twice in a vector of `length(a)*2`

### Example

    julia> interleave([1,2,3])
    6-element Vector{Int64}:
    1
    1
    2
    2
    3
    3

"""
function interleave(a::AbstractVector{T}) where T
    c = Vector{T}(undef, 2*(length(a)))
    interleave!(c,a)
    return c
end

"""

    interleave!(c,a)

In-place version of [`interleave`](@ref), that fills `c` with pairs of each index in `a`.

"""
function interleave!(c::Vector{T}, a::AbstractVector{T}) where T
    @assert length(c) == 2*length(a)
    i = 0
    @inbounds for x in 1:length(a)
        c[i += 1] = a[x]
        c[i += 1] = a[x]
    end
    return c
end


"""

    binweave(a)


Interleave the sequential values of `a` (`<:AbstractVector`) using the first and last values only once. To be used with [`interleave`](@ref) to make plotting-ready histograms.

### Example

    julia> binweave([1,2,3])
    4-element Vector{Int64}:
    1
    2
    2
    3


"""
function binweave(a::AbstractVector{T}) where T
    c = Vector{T}(undef, 2*(length(a)-1))
    binweave!(c,a)
    return c
end


"""

    binweave!(c,a)

In-place version of [`binweave`](@ref), that overwrites `c` with woven bin edges.

"""
function binweave!(c::Vector{T}, a::AbstractVector{T}) where T
    @assert length(c) == 2*(length(a)-1)
    i = 0
    @inbounds for x in 1:length(a)-1
        c[i += 1] = a[x]
        c[i += 1] = a[x+1]
    end
    c 
end


"""

    quickhist(x, binedges)

Quickly calculate histogram counts from collection `x` from an Abstract Range of `binedges`. Note that any values in `x` that fall outside of `binedges` will not be counted. Use at your own risk!

"""
quickhist(x::AbstractArray, binedges::AbstractRange) = quickhist!(Vector{Integer}(undef,length(binedges)-1),x,binedges)


"""

    quickhist!(A, x, binedges)

In-place form of [`quickhist`](@ref) that overwrites `A`, which must have a length equal `binedges`-1.

"""
function quickhist!(A::AbstractArray{Integer}, x::AbstractArray{T}, binedges::AbstractRange) where T<:Number
    @assert length(A) === length(binedges)-1 
    A .= 0
    binmin, binstep, binmax = first(binedges), step(binedges), last(binedges)
    @inbounds for i in eachindex(x)
        xi = x[i]
        binmin < xi <= binmax  || continue
        A[1+floor(Int, (xi - binmin)/binstep)] += 1
    end
    A
end

"""

    cleanhist(x; nbins=32, scooch_nbins=2)

Calculates a histogram with extra (0 count) bins to buffer the edges and make it look nice and clean. 🧼

Optionally specify the number of histogram `bins` (default: `2⁵` bins) and the number of buffering bins `scooch`. (Total bins = `nbins + scoochbins`)

Returns a `NamedTuple` with `x` and `y` values of histogram.

"""
function cleanhist(x::AbstractArray{T}; bins::Int=32, scooch::Int=2) where T<: Number
    xmin,xmax = extrema(x)
    x_scooch = scooch*(xmax-xmin)/(bins)
    binedges = LinRange(xmin-x_scooch, xmax+x_scooch, bins+2*scooch+1)
    y = quickhist(x, binedges) ./ (length(x)*step(binedges))
    return (x=SolarChem.binweave(binedges), y=SolarChem.interleave(y))
end

end
