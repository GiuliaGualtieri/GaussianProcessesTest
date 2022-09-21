# This script aim to take trace about all the issues 
# I founded so far on Julia's Tutorial.

# The file is composed as following:
# 1) identification number of the issubset
# 2) source file (or link of the web page) of the Tutorial
# 3) row of the file where the error comes outer 
# 4) suggested solution

# ---------------------------------------------------------------
# N.1
# https://juliagaussianprocesses.github.io/AbstractGPs.jl/dev/examples/0-intro-1d/#Markov-Chain-Monte-Carlo
# 256
# 
# samples =
#     mcmc_with_warmup(
#         Random.GLOBAL_RNG,
#         ADgradient(:ForwardDiff, loglik_train),
#         n_samples;
#         reporter=NoProgressReport(),
#     ).chain

# samples = mcmc_with_warmup(
#         Random.GLOBAL_RNG,
#         ADgradient(Val(:ForwardDiff), loglik_train),
#         n_samples;
#         reporter=NoProgressReport(),
#     ).posterior_matrix


# ---------------------------------------------------------------
# N.2
# https://juliagaussianprocesses.github.io/AbstractGPs.jl/dev/examples/0-intro-1d/#Markov-Chain-Monte-Carlo
# 274
# 
# histogram(
#     reduce(hcat, samples_constrained)';
#     xlabel="sample",
#     ylabel="counts",
#     layout=2,
#     title=["variance" "inverse length scale"],
#     legend=false,
# )
# vline!(mean_samples'; linewidth=2)

# histogram(
#     samples_constrained',
#     xlabel="sample",
#     ylabel="counts",
#     layout=2,
#     title=["variance" "inverse length scale"],
#     legend=false,
# )
# vline!(mean_samples'; linewidth=2)

# ---------------------------------------------------------------
# N.3
# https://juliagaussianprocesses.github.io/AbstractGPs.jl/dev/examples/0-intro-1d/#Markov-Chain-Monte-Carlo
# 288
# 
# mean(logpdf(gp_posterior(x_train, y_train, p)(x_test), y_test) for p in samples)
#
# mean(logpdf(gp_posterior(x_train, y_train, samples[:,p])(x_test), y_test) for p in 1:2000)
# 


# ---------------------------------------------------------------
# N.4
# https://juliagaussianprocesses.github.io/AbstractGPs.jl/dev/examples/0-intro-1d/#Markov-Chain-Monte-Carlo
# 296
# 

# plt = plot(; xlim=(0, 1), xlabel="x", ylabel="y", title="posterior (DynamicHMC)")
# scatter!(plt, x_train, y_train; label="Train Data")
# scatter!(plt, x_test, y_test; label="Test Data")
# for p in samples[(end - 100):end]
#     sampleplot!(plt, 0:0.02:1, gp_posterior(x_train, y_train, p); seriescolor="red")
# end
# plt

# plt = plot(; xlim=(0, 1), xlabel="x", ylabel="y", title="posterior (DynamicHMC)")
# scatter!(plt, x_train, y_train; label="Train Data")
# scatter!(plt, x_test, y_test; label="Test Data")
# for p in 1:100
#     sampleplot!(plt, 0:0.02:1, gp_posterior(x_train, y_train, samples[:,(end - p):end]); seriescolor="red")
# end
# plt
