library(rstan)

set.seed(57)

data <- list(N = 10,
             X1 = rnorm(10),
             X2 = rnorm(10, 1, 10),
             Y = rnorm(10, 2, 1))

model_demo <- stan_model("demo.stan")
fit <- sampling(model_demo, data = data,
                chains = 4, iter = 1000, warmup = 500)
