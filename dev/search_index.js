var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = CleanHistograms","category":"page"},{"location":"#CleanHistograms","page":"Home","title":"CleanHistograms","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for CleanHistograms.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [CleanHistograms]","category":"page"},{"location":"#CleanHistograms.binweave!-Union{Tuple{T}, Tuple{Vector{T}, AbstractVector{T}}} where T","page":"Home","title":"CleanHistograms.binweave!","text":"binweave!(c,a)\n\nIn-place version of binweave, that overwrites c with woven bin edges.\n\n\n\n\n\n","category":"method"},{"location":"#CleanHistograms.binweave-Union{Tuple{AbstractVector{T}}, Tuple{T}} where T","page":"Home","title":"CleanHistograms.binweave","text":"binweave(a)\n\nInterleave the sequential values of a (<:AbstractVector) using the first and last values only once. To be used with interleave to make plotting-ready histograms.\n\nExample\n\njulia> binweave([1,2,3])\n4-element Vector{Int64}:\n1\n2\n2\n3\n\n\n\n\n\n","category":"method"},{"location":"#CleanHistograms.cleanhist-Union{Tuple{AbstractArray{T}}, Tuple{T}} where T<:Number","page":"Home","title":"CleanHistograms.cleanhist","text":"cleanhist(x; nbins=32, scooch_nbins=2)\n\nCalculates a histogram with extra (0 count) bins to buffer the edges and make it look nice and clean. 🧼\n\nOptionally specify the number of histogram bins (default: 2⁵ bins) and the number of buffering bins scooch. (Total bins = nbins + scoochbins)\n\nReturns a NamedTuple with x and y values of histogram.\n\n\n\n\n\n","category":"method"},{"location":"#CleanHistograms.interleave!-Union{Tuple{T}, Tuple{Vector{T}, AbstractVector{T}}} where T","page":"Home","title":"CleanHistograms.interleave!","text":"interleave!(c,a)\n\nIn-place version of interleave, that fills c with pairs of each index in a.\n\n\n\n\n\n","category":"method"},{"location":"#CleanHistograms.interleave-Union{Tuple{AbstractVector{T}}, Tuple{T}} where T","page":"Home","title":"CleanHistograms.interleave","text":"interleave(a)\n\nInterleave the sequential values of a vector a so that each value occurs twice in a vector of length(a)*2\n\nExample\n\njulia> interleave([1,2,3])\n6-element Vector{Int64}:\n1\n1\n2\n2\n3\n3\n\n\n\n\n\n","category":"method"},{"location":"#CleanHistograms.quickhist!-Union{Tuple{T}, Tuple{AbstractArray{Integer}, AbstractArray{T}, AbstractRange}} where T<:Number","page":"Home","title":"CleanHistograms.quickhist!","text":"quickhist!(A, x, binedges)\n\nIn-place form of quickhist that overwrites A, which must have a length equal binedges-1.\n\n\n\n\n\n","category":"method"},{"location":"#CleanHistograms.quickhist-Tuple{AbstractArray, AbstractRange}","page":"Home","title":"CleanHistograms.quickhist","text":"quickhist(x, binedges)\n\nQuickly calculate histogram counts from collection x from an Abstract Range of binedges. Note that any values in x that fall outside of binedges will not be counted. Use at your own risk!\n\n\n\n\n\n","category":"method"}]
}
