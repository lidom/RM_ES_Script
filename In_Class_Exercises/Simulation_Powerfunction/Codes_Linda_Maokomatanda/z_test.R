## Power function simulation for the z-Test

library(MonteCarlo)
library(tidyverse)


# 1. Simulate a realisation from iid sample

z_test<-function(n, alpha, mu, mu_zero, sigma){
  
  # generate sample:
  set.seed(123)
  
  # (1-alpha/2)-quantile of N(0,1):
  z_upper <- qnorm(p = 1-alpha/2)
  # location shift under H_1:
  z_stat <- sqrt(n) * (mu - mu_zero)/sigma
  # compute power
  power <- 1 - pnorm( z_upper - z_stat) +
    pnorm(-z_upper - z_stat)
  return(power)

}

z_test <- Vectorize(FUN = z_test, vectorize.args = "mu_zero")
muzero_grid <- seq(from = -2, to = 2, len = 50)
beta_vec <- z_test(n = 10,
                    alpha = 0.05,
                    sigma = 1,
                    mu = 0,
                    mu_zero = muzero_grid)


#iterate_beta <- lapply(beta_vec, FUN = z_test, n=10000)

iterate_beta <- replicate(n=100000, beta_vec, simplify=TRUE)
beta_matrix <- rowMeans(iterate_beta)

beta_df <- data.frame("mu_0" = muzero_grid, "Beta" = beta_matrix)

#Plot the power function

ggplot(data = beta_df, aes(x=mu_0, y=Beta)) +
  geom_line(color="red") +
  geom_hline(yintercept = 0.05, lty=2) +
  geom_text(aes(x=2, y=1, label='alpha==0.05'), parse=TRUE, size=5) +
  labs(title = expression(
    paste("Power function of the two-sided Z-Test (n=10 and ",alpha==0.05,")")),
    x = expression(paste(mu[0])),
    y = expression(paste(beta)), size=8) +
  theme_bw() +
  theme(axis.text = element_text(size=12),
        axis.title = element_text(size=14))

# Save image

jpeg(file="power_function.jpeg")
