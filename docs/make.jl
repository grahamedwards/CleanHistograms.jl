using CleanHistograms
using Documenter

DocMeta.setdocmeta!(CleanHistograms, :DocTestSetup, :(using CleanHistograms); recursive=true)

makedocs(;
    modules=[CleanHistograms],
    authors="Graham Harper Edwards",
    sitename="CleanHistograms.jl",
    format=Documenter.HTML(;
        canonical="https://grahamedwards.github.io/CleanHistograms.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/grahamedwards/CleanHistograms.jl",
    devbranch="main",
)
