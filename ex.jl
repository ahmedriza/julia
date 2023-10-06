using Arrow
using DataFrames
using StatsPlots:bar
using DifferentialEquations
using Plots

function mandelbrot(a)
    z = 0
    for i=1:50
        z = z^2 + a
    end
    return z
end

function test_manddelbrot()
    for y=1.0:-0.05:-1.0
        for x=-2.0:0.0315:0.5
            abs(mandelbrot(complex(x, y))) < 2 ? print("*") : print(" ")
        end
        println()
    end
end

function test() 
    # z1 = Complex(-1)
    # z2 = Complex(2 - 3im)
    m = randn(5, 3) # 5 x 3 random N(0,1) matrix
    display(m)
    display(m[1,]) # index are 1 based (and not 0)
end

function arrow_test()
    table = Arrow.Table("/tmp/arrow.ipc")
    # display(table[1])
    # create a DataFrame from the table
    df = DataFrame(table)
    display(df)
end

# https://probability4datascience.com/python01.html
function geometric_series()
    p = 0.5
    n = 1:10
    X = p .^ n
    display(bar(n, X, legend = false))
end

# https://discourse.julialang.org/t/emacs-based-workflow/19400/87?page=5
function de()
    exp_growth(u,p,t) = 0.95u
    solution = solve(
        ODEProblem(
            exp_growth, 1.0,
            (0.0,1.0)
        )
    )
    display(plot(solution))
end

# --------------------------------------------------------------------------------------------------

# test_manddelbrot()
# test()
# arrow_test()
# de()
geometric_series()

