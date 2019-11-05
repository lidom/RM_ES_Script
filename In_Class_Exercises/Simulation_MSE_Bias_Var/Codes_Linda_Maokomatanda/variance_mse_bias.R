
library("tidyverse", quietly = TRUE)
library(ggplot2)

set.seed(123)

n_seq <- seq(from = 2, to = 30, by = 2)
R <- 10000
sd <- 1.5
s_biased <- vector(mode = "numeric", length = R)
s_unbiased <- vector(mode = "numeric", length = R)

MSE_biased <- vector(mode = "numeric", length = length(n_seq))
MSE_unbiased <- vector(mode = "numeric", length = length(n_seq))


Bias_biased <- vector(mode = "numeric", length = length(n_seq))
Bias_unbiased <- vector(mode = "numeric", length = length(n_seq))

Variance_biased <- vector(mode = "numeric", length = length(n_seq))
Variance_unbiased <- vector(mode = "numeric", length = length(n_seq))



i <- 1

for(n in n_seq){
for(r in 1:R){
  # Simulate realization from iid random sample
  X_vec <- rnorm(n = n, mean = 3, sd = 1.5)
  X_bar <- mean(X_vec)
  # Compute standard deviation 
  s_biased[r] <- sqrt(sum((X_vec - X_bar)^2)/n)
  s_unbiased[r] <- sqrt(sum((X_vec - X_bar)^2)/(n-1))
  
}
  
MSE_biased[i]      <- mean((s_biased - sd)^2)
MSE_unbiased[i]      <- mean((s_unbiased - sd)^2)


Bias_biased[i]     <- (mean(s_biased) - sd)^2
Bias_unbiased[i]     <- (mean(s_unbiased) - sd)^2


Variance_biased[i] <- mean(((s_biased - mean(s_biased))^2)) 
Variance_unbiased[i] <- mean(((s_unbiased - mean(s_biased))^2)) 

i <- i+1
}

# combine vectors for plot
df <- data.frame(n_seq, MSE_biased,Bias_biased, Variance_biased)
df_unbiased <- data.frame(n_seq, MSE_unbiased,Bias_unbiased, Variance_unbiased)


colnames(df) <- c("n_seq", "MSE_biased", "Bias_biased", "Variance_biased")
colnames(df_unbiased) <- c("n_seq", "MSE_unbiased", "Bias_unbiased", "Variance_unbiased")


# comibne dataframes
df_combined <- merge (df,df_unbiased,by="n_seq")


#plot

plot_combined <- ggplot(df_combined, aes(x=n_seq)) +
  geom_line(aes(y=MSE_biased, color="MSE_biased"), alpha=.7, size=2) +
  geom_line(aes(y=Bias_biased, color="Bias_biased"), alpha=.7, size=2) +
  geom_line(aes(y=Variance_biased, color="Variance_biased"), alpha=.7, size=2) +
  geom_line(aes(y=MSE_unbiased, color="MSE_biased"), alpha=.7, size=2, linetype=2) +
  geom_line(aes(y=Bias_unbiased, color="Bias_biased"), alpha=.7, size=2, linetype=2) +
  geom_line(aes(y=Variance_unbiased, color="Variance_biased"), alpha=.7, size=2, linetype=2) +
  labs(title = 'MSE, squared Bias, Variance Comparison',
       subtitle = "Dashed lines differentiate between biased and unbiased results",
       x=expression(paste("n_seq"), size=16),
       y=expression(paste(""), size=16)) +
  theme_bw()

show(plot_combined)
