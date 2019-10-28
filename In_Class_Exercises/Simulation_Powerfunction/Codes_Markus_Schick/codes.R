set.seed(123)
# normal parameters
mu_0=0
sd=1
#calc quantile
alpha=0.05
quantil <- qnorm(p = 1-alpha/2, mean=mu_0,sd=sd)
# set shift range
shift_range=seq(from=-1.5, to=1.5, by=0.01)
myMCpower <- function(shift_range, n, B=2000, print_stuff=0){
  cat("We shift over a range of",length(shift_range),"values")
  Power_val=numeric(length(shift_range))
  Dvec=integer(B)
  for (shift_num in 1:length(shift_range)){
    mu=mu_0+shift_range[shift_num]
      my_df <- matrix(rnorm(n = n*B, mean=mu, sd=sd), nrow = n, ncol = B)
      new_mu=apply(my_df,2,mean) #loop over all columns
      Zstat <- sqrt(n) * (new_mu - mu_0)/sd
      # (1-alpha/2)-quantile of N(0,1):
      Dvec=abs(Zstat)>quantil
      Power_val[shift_num]=mean(Dvec)
      if(print_stuff == 1){print(Power_val[shift_num])}
    }
  return(Power_val)
}
#rm(list=ls()) # delete stuff

results_df1=myMCpower(shift_range,15,B=10000)
results_df1 <- data.frame("shift" = shift_range, "kraft" = results_df1)
results_df2=myMCpower(shift_range,25,B=10000)
results_df2 <- data.frame("shift" = shift_range, "kraft" = results_df2)
library(ggplot2)
ggplot(results_df1,aes(shift,kraft))+geom_line(aes(color="15 observations"), size=2)+
geom_line(data=results_df2,aes(color="25 observations"),size=2)+
labs(color="Sample Size ")+
geom_line() +
  geom_hline(yintercept = 0.05, lty=2)+
   geom_text(aes(x=0, y=1, label='alpha==0.05'),
            parse=TRUE, size=5)+
labs(title = expression( paste("Powerfunction of the two-sided Z-Test (",
                               alpha==0.05,")")), x = expression(paste(mu[0])),
     y = expression(paste(beta)), size=8)+
  theme_bw() +
  theme(axis.text = element_text(size=12), axis.title = element_text(size=14))
