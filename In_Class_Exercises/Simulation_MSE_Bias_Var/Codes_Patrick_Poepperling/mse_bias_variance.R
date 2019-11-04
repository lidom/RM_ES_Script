# Anastasiia Gordienko, Patrick Poepperling
# 03.11.2019
library(ggplot2)

#Set fixed values
mu <- 3
sigma <- 1.5
N <- seq(1, 30, by=1)
R <- 7000


#Setup empty marixes and vectors
s <- matrix(NA, nrow = R, ncol = length(N))
s_2 <- matrix(nrow = R, ncol = length(N))

mse <- integer(length(N))
bias <- integer(length(N))
var <- integer(length(N))
mse_2 <- integer(length(N))
bias_2 <- integer(length(N))
var_2 <- integer(length(N))

#fill both s matrixes with s_2 being the unbiased estimator.
for (r in 1:R){
  ind = 1
  for (n in 1:length(N)){
    x <- rnorm(n, mu, sigma)
    
    s[r, ind] <- sqrt(1/n * sum((x-mean(x))^2))
    
    s_2[r, ind] <- sqrt(1/(n-1) * sum((x-mean(x))^2))
    
    ind = ind+1
  }
}


# Calculate the values that we want to plot. 
for (n in 1:length(N)){
  mse[n] = 1/R * sum((s[, n] - sigma)^2)
  bias[n] = ((1/R * sum(s[,n]))-sigma)^2
  var[n] = 1/R * sum((s[,n] - (1/R * sum(s[,n])))^2)
  mse_2[n] = 1/R * sum((s_2[, n] - sigma)^2)
  bias_2[n] = ((1/R * sum(s_2[,n]))-sigma)^2
  var_2[n] = 1/R * sum((s_2[,n] - (1/R * sum(s_2[,n])))^2)
}



#Put those values together into a dataset to plot.
data <- data.frame("mse"=mse, "bias"=bias, "var"=var, "mse_2"=mse_2, "bias_2"=bias_2, "var_2"=var_2)

#Plot
ggplot(data=data, aes(x=N)) +
  ggtitle("MSE, Bias and Variance of the OLS Estimator of the Standard Deviation", 
          subtitle = "mu = 3, sigma =1.5 , n = {2, 4, ..., 30}")+
  geom_line(aes(y=data$mse , colour="MSE", linetype="biased")) +
  geom_line(aes(y=data$bias, colour="BIAS", linetype="biased")) +
  geom_line(aes(y=data$var, colour="VAR", linetype="biased")) + 
  geom_line(aes(y=data$mse_2, colour="MSE", linetype="unbiased")) + 
  geom_line(aes(y=data$bias_2, colour="BIAS", linetype="unbiased")) + 
  geom_line(aes(y=data$var_2, colour="VAR", linetype="unbiased")) + 
  scale_colour_manual(values = c("magenta", "cyan", "black"))+
  xlab("N") +
  ylab("")+
  coord_cartesian(ylim=c(0, 1)) +
  theme_bw() 
  