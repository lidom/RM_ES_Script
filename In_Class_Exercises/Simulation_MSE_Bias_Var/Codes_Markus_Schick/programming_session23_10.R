rm(list=ls()) # delete stuff


return_kpi <-function(sd_sample){
  MSE=mean((sd_sample-sd)^2)
  Bias2=(mean(sd_sample)-sd)^2
  Vari=mean((sd_sample-mean(sd_sample))^2)
  return(c(MSE,Bias2,Vari))
}

mu=2
sd=2

n_range=seq(from=5, to=15, by=1)
B=10000
iter=1
KPI=matrix(data=NA,nrow=length(n_range),ncol=6)
for (n in n_range){
  my_df <- matrix(rnorm(n = n*B, mean=mu, sd=sd), nrow = n, ncol = B)
  mu_vec=apply(my_df,2,mean) #loop over all columns
  mu_mat=matrix(rep(mu_vec,each=n),nrow=n, ncol=B)
  sd_biased=sqrt(colSums((my_df-mu_mat)^2)/n)
  sd_unbiased=sqrt(colSums((my_df-mu_mat)^2)/(n-1))
  KPI[iter,1:3]=return_kpi(sd_biased)
  KPI[iter,4:6]=return_kpi(sd_unbiased)
  iter=iter+1
}

results_df1 <- data.frame("value" = KPI[,1],"sample_size"=n_range)
results_df2 <- data.frame("value" = KPI[,2],"sample_size"=n_range)
results_df3 <- data.frame("value" = KPI[,3],"sample_size"=n_range)
results_df4 <- data.frame("value" = KPI[,4],"sample_size"=n_range)
results_df5 <- data.frame("value" = KPI[,5],"sample_size"=n_range)
results_df6 <- data.frame("value" = KPI[,6],"sample_size"=n_range)

library(ggplot2)
ggplot(results_df1,aes(n_range,value))+
geom_line(data = results_df1, aes(color="MSE"))+
geom_line(data = results_df2, aes(color="Bias squared"))+
geom_line(data = results_df3, aes(color="Variance"))+
geom_line(data = results_df4, aes(color="MSE adj."))+
geom_line(data = results_df5, aes(color="Bias squared adj."))+
geom_line(data = results_df6, aes(color="Variance adj"))+
xlab('sample size') +
ylab('value')



