# Example for constructing a streamplot in Julia for phase portraits
# CHEME5440/7770 - Spring 2021
# The example makes use of Makie.jl and AbstractPlotting.jl for plotting
# To install the packages, use the following commands inside the Julia REPL:
# using Pkg
# Pkg.add("Makie")
# Pkg.add("AbstractPlotting")

using Makie
using AbstractPlotting.MakieLayout
using AbstractPlotting


AbstractPlotting.inline!(true)


# Model for precise adaptation
# u = conc. of repressor 1
# v = conc. of repressor 2
function precise_adapt(u, v)

    alpha = 10  #max synthesis rate
    n = 2       #cooperativity

    du = alpha/(1+v^n)-u       #du/dt
    dv = alpha/(1+u^n)-v       #dv/dt
    
    return Point(du,dv)
end

# Construct the streamplot
plt1, layout = layoutscene(resolution = (1000,800))

ax = layout[1, 1] = Axis(plt1, xlabel = "u", ylabel = "v",
    title = "Streamplot of u vs. v for n = 2 in bistable toggle switch system")

streamplot!(ax,precise_adapt, 0..15, 0..15, colormap = :plasma, 
    gridsize= (32,32), arrow_size = 0.1)

# Plotting nullclines for dD1/dtau* = 0 and dD2/dtau* = 0
n = 2
alpha = 10

u = LinRange(0,15,150)
v = alpha ./ ( 1 .+ u .^n)
lines!(ax,u,v, linestyle = "-", label  = "dv/dt = 0", linewidth = 5)

v = LinRange(0,15,150)
u = alpha ./ ( 1 .+ v .^n)
lines!(ax,u,v, color = :red, linestyle = "-", label  = "du/dt = 0", linewidth = 5)

layout[1, 2] = Legend(plt1, ax, "Nullclines", framevisible = false)

# Display the plot
display(plt1)

# Save the plot
save("odeField_1b.png")