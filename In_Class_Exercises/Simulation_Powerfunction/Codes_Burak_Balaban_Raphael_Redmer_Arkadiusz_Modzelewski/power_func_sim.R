rm(list = ls())
main_func = function(n, mu = 0, sigma = 1,
                     mu_0, alpha = 0.05)
{
  #Function for calculating D_r
  #Draws sample from normal dist
  X = rnorm(n, mean = mu, sd = sigma)
  #Calculation of z-score
  z_score = sqrt(n)*(mean(X) - mu_0)/sigma
  #Critical z value for comparison purpose
  z_critical = qnorm(1-alpha/2)
  #Returns 0 or 1 depending on the rule
  return(abs(z_score) > z_critical)*1
}
loop_func = function(mu_0_loop, n_loop)
{
  #Monte-carlo specification
  R = 10000
  #Vector for storing D values for different simulations
  D_vec = vector()
  for (i in 1:R)
  {
    #Getting D values for different runs
    D_vec[i] = main_func(n = n_loop, mu_0 = mu_0_loop)
  }
  #Returns beta
  return(mean(D_vec))
}
#Different values for mu
mu_seq = as.matrix(seq(-1.5, 1.5, 0.001))
#Takes every mu in sequence and applies 
#loop_func to get beta values
power_10 = sapply(mu_seq, loop_func, n_loop = 10)
power_15 = sapply(mu_seq, loop_func, n_loop = 15)
power_25 = sapply(mu_seq, loop_func, n_loop = 25)
power_50 = sapply(mu_seq, loop_func, n_loop = 50)
power_100 = sapply(mu_seq, loop_func, n_loop = 100)
df = data.frame("mu"  = mu_seq, "Beta_10" = power_10, "Beta_15" = power_15,
                "Beta_25" = power_25, "Beta_50" = power_50,
                "Beta_100" = power_100)
plot(df[,1],df[,2], type = "l", col = "yellow", xlab = "µ", ylab = "ß",
     ylim = c(0,1.1), yaxt = 'none')
lines(df[,1],df[,3], type = "l", col = "blue")
lines(df[,1],df[,4], type = "l", col = "green")
lines(df[,1],df[,5], type = "l", col = "purple")
lines(df[,1],df[,6], type = "l", col = "red")
lines(df[,1], rep(0.05,length(df[,1])), type = 'l', lty = 2)
axis(2, seq(0,1,by = 0.1),las = 2)
grid()
title("Power Function Monte Carlo Simulation")
text(-1.3,0.09, "α = 0.05", cex = 0.75)
legend(1.1,0.6,legend = c('10', '15', '25', '50', '100'),
       col=c('yellow', 'blue', 'green', 'purple', 'red'),
       title = 'N' ,lty=1, cex=0.6)