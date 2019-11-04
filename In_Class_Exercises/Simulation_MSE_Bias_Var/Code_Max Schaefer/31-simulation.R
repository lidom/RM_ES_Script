
# Research Module in Econometrics and Statistics
# Master Economics, Uni Bonn

# Author: Max
# Date: 23-Oct-2019
# Updated: 29-Oct-2019
# Notes: Simulation study: MSE, squared Bias, Variance
#        of the ML-Estimator of the Standard Deviation
rm(list=ls())

mu <- 3
sigma <- 1.5
n.vec <- seq(1,30,1)
M <- 10000

simulate_s <- function(mu, sigma, n){
    x.vec <- rnorm(n=n, mean=mu, sd=sigma)
    s <- sqrt((1/n)*(sum((x.vec-mean(x.vec))**2)))
    return(s)
}
simulate_s_unb <- function(mu, sigma, n){
    x.vec <- rnorm(n=n, mean=mu, sd=sigma)
    s_unb <- sqrt((1/(n-1))*(sum((x.vec-mean(x.vec))**2)))
    return(s_unb)
}

simulate_s <- Vectorize(FUN=simulate_s, vectorize.args="n")
simulate_s_unb <- Vectorize(FUN=simulate_s_unb, vectorize.args="n")

# call simulation function M times to avoid loop
s_simul <- t(sapply(rep(1,M), function(x) simulate_s(mu=mu, sigma=sigma, n=n.vec)))
s_unb_simul <- t(sapply(rep(1,M), function(x) simulate_s_unb(mu=mu, sigma=sigma, n=n.vec)))

mse.vec <- sapply(n.vec, function(n) mean((s_simul[,n]-sigma)**2))
bias2.vec <- sapply(n.vec, function(n) (mean(s_simul[,n])-sigma)**2)
var.vec <- sapply(n.vec, function(n) (1/M)*(sum((s_simul[,n]-mean(s_simul[,n]))**2)))
mse_unb.vec <- sapply(n.vec, function(n) mean((s_unb_simul[,n]-sigma)**2))
bias2_unb.vec <- sapply(n.vec, function(n) (mean(s_unb_simul[,n])-sigma)**2)
var_unb.vec <- sapply(n.vec, function(n) (1/M)*(sum((s_unb_simul[,n]-mean(s_unb_simul[,n]))**2)))

### Plotting
df <- data.frame(cbind(n.vec, mse.vec, bias2.vec, var.vec,
                       mse_unb.vec, bias2_unb.vec, var_unb.vec))
df <- df[2:length(n.vec),]
names(df)[1] <- "N"
names(df)[2] <- "mse"
names(df)[3] <- "bias2"
names(df)[4] <- "variance"
names(df)[5] <- "mse_unb"
names(df)[6] <- "bias2_unb"
names(df)[7] <- "variance_unb"

###
library("ggplot2")

p <- ggplot(df, aes(x=N)) +
    geom_line(aes(y=mse, color="mse"), alpha=.7, size=2) +
    geom_line(aes(y=bias2, color="bias2"), alpha=.7, size=2) +
    geom_line(aes(y=variance, color="variance"), alpha=.7, size=2) +
    geom_line(aes(y=mse_unb, color="mse"), alpha=.7, size=2, linetype=2) +
    geom_line(aes(y=bias2_unb, color="bias2"), alpha=.7, size=2, linetype=2) +
    geom_line(aes(y=variance_unb, color="variance"), alpha=.7, size=2, linetype=2) +
    labs(title = 'MSE, squared Bias, Variance of the ML-Estimator of the Standard Deviation',
         subtitle = "Monte Carlo simulation with 10,000 draws\nDashed lines indicate metrics based on adjusted empiric s.d.",
         x=expression(paste("N"), size=16),
         y=expression(paste(""), size=16)) +
    theme_bw()

show(p)
