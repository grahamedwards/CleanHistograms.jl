using CleanHistograms
using Test

@testset "CleanHistograms.jl" begin
    
    @test CleanHistograms.interleave([1,2,3]) == [1,1,2,2,3,3]
    @test CleanHistograms.binweave([1,2,3]) == [1,2,2,3]
    @test CleanHistograms.quickhist([.5, 1.5, 3.5, 2.0], 1:4) == [1,1,1]

end
