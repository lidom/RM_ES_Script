rm(list = ls())

#Variables
mu = 3
sigma = 1.5
n_seq = seq(2,30,2)

main = function(n, mu, sigma){
  #Function for finding standard error
  X = rnorm(n, mu ,sigma)
  x_bar = (1/n)*sum(X)
  s_n = sqrt((1/n)*sum((X-x_bar)^2))
  return(s_n)
}
R = 10000
###
loop_fnc = function(n, mu, sigma){
  #Function for looping main function
  #and storing the s_n_r values in a list
  s_n_list = vector()
  for (i in 1:R){s_n_list[i] = main(n,mu,sigma)}
  return(s_n_list)
}
##For unbiased estimator
main_unb = function(n, mu, sigma){
  X = rnorm(n, mu ,sigma)
  x_bar = (1/n)*sum(X)
  s_n = sqrt((1/(n-1))*sum((X-x_bar)^2))
  return(s_n)
}
loop_fnc_unb = function(n, mu, sigma)
{
  s_n_list = vector()
  for (i in 1:R){s_n_list[i] = main_unb(n,mu,sigma)}
  return(s_n_list)
}

#S_n is one column of df
mse_func = function(s_n, sigma = 1.5){
  return(sum((s_n - sigma)^2)/R)
}
bias_fnc = function(s_n, sigma = 1.5){
  return((mean(s_n)-sigma)^2)
}
var_fnc = function(s_n, sigma = 1.5){
  var_vec = vector()
  for (i in 1:length(s_n)){
    var_vec[i] = (s_n[i]-mean(s_n))^2
  }
  return(mean(var_vec))
}


#Biased
#Creates a Rxn dimensional matrix with different s_n_r values
df = sapply(n_seq, loop_fnc, mu = 3, sigma = 1.5)
mse = apply(df, 2, mse_func)
bias = apply(df,2,bias_fnc)
var = apply(df, 2, var_fnc)
#Unbiased
df_unb = sapply(n_seq, loop_fnc_unb, mu = 3, sigma = 1.5)
mse_unb = apply(df_unb, 2, mse_func)
bias_unb = apply(df_unb,2,bias_fnc)
var_unb = apply(df_unb, 2, var_fnc)

plot(n_seq, mse, type = 'l', col = 'green', xlab = 'N',
     ylab = 'Values for MSE, Bias², Var', lty = 2)
lines(n_seq, bias, type = 'l', col = 'blue', lty = 2)
lines(n_seq, var, type = 'l', col = 'red', lty = 2)
lines(n_seq, mse_unb, type = 'l', col = 'green')
lines(n_seq, bias_unb, type = 'l', col = 'blue')
lines(n_seq, var_unb, type = 'l', col = 'red')
title("MSE, Bias² & Variance for Different N",
      sub='Biased and Unbiased estimators for standard error',
      cex.sub = 0.7)
legend(25,0.7,legend = c('MSE', 'Variance', 'Bias²'),
       col=c('green', 'red', 'blue'),
      title='Biased' ,lty=2, cex=0.6)
legend(25,0.4,legend = c('MSE', 'Variance', 'Bias²'),
       col=c('green', 'red', 'blue'),
       title='Unbiased' ,lty=1, cex=0.6)