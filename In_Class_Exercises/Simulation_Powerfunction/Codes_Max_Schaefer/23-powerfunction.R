
# Research Module in Econometrics and Statistics
# Master Economics, Uni Bonn

# Author: Max
# Date: 16-Oct-2019
# Updated: 21-Oct-2019
# Notes:


rm(list=ls())

### Powerfunction Simulation for the z-Test

# Define functions
power_fct <- function(M,N,mu,mu_0,sigma,alpha){
    D.vec <- integer(M)
    for (i in 1:M){
        X <- rnorm(N, mean=mu, sd=sigma)
        z_obs <- sqrt(N)*(mean(X)-mu_0)/sigma
        D.vec[i] <- as.integer(abs(z_obs)>abs(qnorm(alpha/2)))
    }
    return(mean(D.vec))
}

# Flexible function
power_fct_flexible <- function(M,N.vec,mu,mu_0,sigma,alpha){
    power_fct_vect <- Vectorize(FUN=power_fct, vectorize.args="mu")
    matrix <- matrix(mu.vec)
    for (k in 1:length(N.vec)){
        power.vec <- power_fct_vect(M=M,N=N.vec[k],mu=mu.vec,mu_0=mu_0,sigma=sigma,alpha=alpha)
        matrix <- cbind(matrix, power.vec)
    }
    df <- data.frame(matrix)
    return(df)
}

# Simulation parameters
N <- 50
N.vec <- c(15,25,100)
M <- 10000
mu <- 0
mu.vec <- c(seq(mu-1.5,mu+1.5,.05))
sigma <- 1
alpha <- 0.05
mu_0 <- 0

df <- power_fct_flexible(M=M,N.vec=N.vec,mu=mu.vec,mu_0=mu_0,sigma=sigma,alpha=alpha)

names(df)[1] <- "mu"
names(df)[2] <- "power_n_15"
names(df)[3] <- "power_n_25"
names(df)[4] <- "power_n_100"


### Plotting
library("ggplot2")
p <- ggplot(df, aes(x=mu)) +
    geom_line(aes(y=power_n_15, color="N = 15"), alpha=.5, size=1.4) +
    geom_line(aes(y=power_n_25, color="N = 25"), alpha=1, size=1.4) +
    geom_line(aes(y=power_n_100, color="N = 100"), alpha=.7,  size=1.4) +
    geom_hline(yintercept = 0.05, lty=2) +
    geom_text(aes(x=-1.3, y=0.1, label='alpha==0.05'), parse=TRUE, size=4) +
    labs(title = 'Powerfunction of the two-sided Z-Test',
         subtitle = "Monte Carlo simulation with 10,000 draws",
         x=expression(paste(mu[0]), size=16),
         y=expression(paste(beta), size=16)) +
    theme_bw() +
    scale_color_discrete(name = "Sample size", labels = c("N = 100", "N = 15", "N = 25"))

show(p)

#dev.copy(png,'powerfunction_plot.png')
#dev.off()
# wide format was selected by hand in RStudio
