using Plots

function p(a, b, c, theta)
  return a .* cos.(b .* theta) .+ c
end

theta = range(0, 31.4, length=1000)

# plot(theta, p(theta), q(theta), label="pq(θ)", lw=1, legend=:topleft)

# r(theta) = 3.0
# rs = r.(theta)
# plot(theta, rs, proj=:polar, label="r(θ)", lw=1, legend=:topleft)

a = 1.5
b = 6.4
c = 2
plot(theta, p.(a, b, c, theta), proj=:polar, label="r(θ)", lw=1, legend=:topleft)
