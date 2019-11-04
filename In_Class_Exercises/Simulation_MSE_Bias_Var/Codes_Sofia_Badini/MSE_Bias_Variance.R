# Install packages
install.packages("tidyr")
install.packages("ggplot2")
install.packages("tidyverse")
library(ggplot2)
library(tidyr)
library(tidyverse)

# Fix values
mu = 3 
var = 1.5
R = 10000
n = seq(2, 30, by=2)

# Define s_biased and vectorize it
s_biased = function(mu, var, n){
  X = rnorm(n, mu, var)
  s = sqrt(1/n*sum((X-mean(X))^2))
  return(s)
}
s_biased = Vectorize(s_biased)

# Define s_unbiased and vectorize it
s_unbiased = function(mu, var, n){
  X = rnorm(n, mu, var)
  s = sqrt(1/(n-1)*sum((X-mean(X))^2))
  return(s)
} 
s_unbiased = Vectorize(s_unbiased)

# Repeat R times 
biased_list = list()
for(r in 1:R){
  biased_list[[r]] = s_biased(mu, var, n)
  }
result_biased = do.call(rbind, biased_list)

unbiased_list = list()
for(r in 1:R){
  unbiased_list[[r]] = s_unbiased(mu, var, n)
}
result_unbiased = do.call(rbind, unbiased_list)

# Define MSE, BIAS, VAR
MSE_biased = (colSums((result_biased-var)^2))/R
BIAS_biased = (colMeans(result_biased)-var)^2
VAR_biased = colMeans((result_biased - colMeans(result_biased))^2)
MSE_unbiased = (colSums((result_unbiased-var)^2))/R
BIAS_unbiased = (colMeans(result_unbiased)-var)^2
VAR_unbiased = colMeans((result_unbiased - colMeans(result_unbiased))^2)

# Create graph
### Plotting
df = data.frame(cbind(n, MSE_biased, BIAS_biased, VAR_biased, 
                       MSE_unbiased, BIAS_unbiased, VAR_unbiased))

p = ggplot(df, aes(x=n)) +
  geom_line(aes(y=MSE_biased, color="MSE",linetype="Biased"), size=1) +
  geom_line(aes(y=BIAS_biased, color="BIAS", linetype="Biased"), size=1) +
  geom_line(aes(y=VAR_biased, color="VAR", linetype="Biased"), size=1) +
  geom_line(aes(y=MSE_unbiased, color="MSE", linetype="Unbiased"), size=1) +
  geom_line(aes(y=BIAS_unbiased, color="BIAS",linetype="Unbiased"), size=1) +
  geom_line(aes(y=VAR_unbiased, color="VAR",linetype="Unbiased"), size=1) +
  labs(title = 'Simulation of MSE, squared Bias and Variance',
       subtitle = "Monte Carlo simulation with 10,000 draws") +
  xlab("Sample size (n)") + 
  theme_bw() +
  theme(legend.title=element_blank(), axis.title.y=element_blank())

show(p)
