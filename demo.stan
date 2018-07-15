data {
  int N;
  vector[N] X1;
  vector[N] X2;
  vector[N] Y;
}

parameters {
  real b_const;
  real b_x1;
  real b_x2;
  real<lower = 0> s_Y;
}

transformed parameters{
  vector[N] mu_Y;
  for (i in 1:N) {
    mu_Y[i] = b_const + b_x1 * X1[i] + b_x2 * X2[i];
  }
}

model {
  s_Y ~ cauchy(0, 2.5);
  for (n in 1:N) {
    Y[n] ~ normal(mu_Y[n], s_Y);
  }
}


