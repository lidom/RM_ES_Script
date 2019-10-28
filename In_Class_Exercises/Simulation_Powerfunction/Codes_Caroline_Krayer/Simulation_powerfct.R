## Powerfunction simulation for the Z-test
library(ggplot2)
library(tidyr)
library(tidyverse)
rm(list = ls())

## fix parameters
sigma = 1
alpha = 0.05
mu_0 = 0
R = 10000

## write a function that gives the test decision 
simulate = function(N, mu, sigma, alpha, mu_0){
  # simulation of realisation
  X = rnorm(N, mu, sigma)
  
  # compute observed test statistic
  Z_obs = sqrt(N)*(mean(X) - mu_0)/sigma
  
  # save the test decision
  D = as.integer(abs(Z_obs) >= 1.96)  
  
  return(D)
}

## write function that computes power of the test
power_test = function(R, N, mu, sigma, alpha, mu_0){
  num_rejections = 0
  for (i in 1:R){
    num_rejections = num_rejections + simulate(N, mu, sigma, alpha, mu_0)
  }  
  D_R = num_rejections/R
  return(D_R)
}

## run a small simulation for different values of N and mu
N_values = c(15, 25, 50)
mu_values = seq(-2, 2, by = 0.1)

# create matrix where we store the power for different N and mu
M = matrix(NA, length(N_values), length(mu_values))

# compute power for different N and mu
index1 = 1
for (N in N_values){
  index2 = 1
  for (mu in mu_values){
    M[index1, index2] = power_test(R, N, mu, sigma, alpha, mu_0)
    index2 = index2 + 1
  }
  index1 = index1 + 1
}

# plot the power functions for the different values of N
M1 = M[1,]
M2 = M[2,]
M3 = M[3,]

powerplot = data.frame(mu_values, M1, M2, M3) %>%
  gather(N, value, M1, M2, M3) %>%
  ggplot(aes(x = mu_values, y = value, colour = N)) +
  geom_line(size = 1) + 
  geom_hline(yintercept = 0.05, lty = 2) +
  ggtitle("Simulated powerfunction of the two-sided Z-Test") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab(expression(mu)) +
  ylab(expression(beta)) +
  scale_color_hue(labels = c("N = 15", "N = 25", "N = 50")) + 
  theme(legend.title = element_blank())
powerplot 
