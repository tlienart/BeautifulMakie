# by lazarusA # HIDE
# using GLMakie # HIDE
using CairoMakie, Random
CairoMakie.activate!() # HIDE
let
    #### see also https://discourse.julialang.org/t/beautiful-makie-gallery/62523/31
    Random.seed!(123)
    n = 200
    x, y, color = randn(n)/2, randn(n), randn(n)
    fig = Figure(resolution = (700, 700))
    ax1 = Axis(fig,xgridstyle=:dash,ygridstyle=:dash,xtickalign=1, ytickalign=1)
    ax2 = Axis(fig,xgridstyle=:dash,ygridstyle=:dash,xtickalign=1, ytickalign=1)
    ax3 = Axis(fig,xgridstyle=:dash,ygridstyle=:dash,xtickalign=1, ytickalign=1)
    hist!(ax1, x, color = (:orange, 0.5), strokewidth = 0.5)
    density!(ax3,y,direction = :y,color = (:dodgerblue, 0.5),strokewidth = 0.5)
    scatter!(ax2, x, y, color = color, colormap=:plasma, markersize = 10,
        marker = :circle, strokewidth = 0)
    xlims!(ax1,-4,4)
    limits!(ax2,-4,4,-4,4)
    ylims!(ax3,-4,4)
    hideydecorations!(ax3, ticks = false, grid = false)
    hidexdecorations!(ax1, ticks = false, grid = false)
    fig[1,1] = ax2
    fig[1,2] = ax3
    fig[0,1] = ax1
    fig
    colsize!(fig.layout, 1, Relative(2/3))
    rowsize!(fig.layout, 1, Relative(1/3))
    colgap!(fig.layout, 10)
    rowgap!(fig.layout, 10)
    fig
    save(joinpath(@__DIR__, "output", "ScatterHistDensitySides.png"), fig, px_per_unit = 2) # HIDE
end
using Pkg # HIDE
Pkg.status(["CairoMakie","Random"]) # HIDE
