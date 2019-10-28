## Simulation study: 
## MSE, Bias and Variance of the ML-Estimator of the Standard Deviation
rm(list = ls())

# fix values
mu = 3
sigma = 1.5
n_values = c(seq(2, 30, by = 1))
R = 10000

# matrices to store estimators of std for different values of n
s = matrix(NA, R, length(n_values))
s_tilde = matrix(NA, R, length(n_values))

for(i in 1:R){
  index = 1
  for (n in n_values){
    #sample a realisation from the iid random sample
    X = rnorm(n, mu, sigma)
    
    # compute biased estimator for standard deviation 
    s[i, index] = sqrt(1/n * sum((X - mean(X))^2))
    
    s_tilde[i, index] = sqrt(1/(n-1) * sum((X - mean(X))^2))
    
    index = index + 1
  }
}

# approximate MSE, squared bias and variance for each value of n
MSE_s = matrix(NA, 1, length(n_values))
Bias_s = matrix(NA, 1, length(n_values))
Var_s = matrix(NA, 1, length(n_values))
MSE_s_tilde = matrix(NA, 1, length(n_values))
Bias_s_tilde = matrix(NA, 1, length(n_values))
Var_s_tilde = matrix(NA, 1, length(n_values))

for (j in 1:length(n_values)){
  MSE_s[1, j] = 1/R * sum((s[ ,j] - sigma)^2)
  Bias_s[1, j] = ((1/R * sum(s[ ,j])) - sigma)^2
  Var_s[1, j] = 1/R * sum((s[ ,j] - (1/R * sum(s[ ,j])))^2)
  MSE_s_tilde[1, j] = 1/R * sum((s_tilde[ ,j] - sigma)^2)
  Bias_s_tilde[1, j] = ((1/R * sum(s_tilde[ ,j])) - sigma)^2
  Var_s_tilde[1, j] = 1/R * sum((s_tilde[ ,j] - (1/R * sum(s_tilde[ ,j])))^2)
}

# plot MSE, squared Bias and Variance as a function of n
plot(n_values, MSE_s, col = "2", "l", lty = 1, main = "MSE, squared bias and variance as a function of n", xlab = "n", ylab = NA)
points(n_values, Bias_s, col = "3", "l", lty = 1)
points(n_values, Var_s, col = "4", "l", lty = 1)
points(n_values, MSE_s_tilde, col = "2", "l", lty = 2)
points(n_values, Bias_s_tilde, col = "3", "l", lty = 2)
points(n_values, Var_s_tilde, col = "4", "l", lty = 2)
legend("topright", c("MSE of biased estimator", "Squared Bias of biased estimator", "Variance of biased estimator", "MSE of unbiased estimator", "Squared Bias of unbiased estimator", "Variance of unbiased estimator"), col = c("2", "3", "4", "2", "3", "4"), lty = c(1,1,1,2,2,2))
