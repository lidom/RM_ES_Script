library(ggplot2)

## Define arguments:
mu<-seq(from = -2,to = 2, length.out = 100)
mu_0<-0
sigma<-1
R<-10000
D_mat <- matrix(NA, nrow = length(mu), ncol = R)

## Define function "D_MAT" in order to obtain full D_mat:
D_MAT <- function(n, mu, mu_0, sigma, R, D_mat) {
  for(j in 1:length(mu)){
    for (r in 1:R){
      #step 1
      Xvec <- rnorm (n, mu[j], sigma)
      #step 2
      Zobs<-sqrt(n)*mean(Xvec)-mu_0/sigma
      #step 3
      D_mat[j,r] <- as.integer(abs(Zobs)>1.96)
    }
  }
return(D_mat)
}
  
## Power Function for n=15:
D_mat_1 <- D_MAT(n=15, mu, mu_0, sigma, R, D_mat)
beta_1 <- apply(D_mat_1, 1, mean)

## Power Function for n=25:
D_mat_2 <- D_MAT(n=25, mu, mu_0, sigma, R, D_mat)
beta_2 <- apply(D_mat_2, 1, mean)

beta_df <- data.frame("mu"  = mu, "Beta1"  = beta_1, "Beta2"  = beta_2 )



P=ggplot(data = beta_df, aes(x=mu))+
  geom_line(aes(y=Beta1, color = "n=15")) +
  geom_line(aes(y=Beta2, color = "n=25")) + 
  scale_colour_manual("", 
                      breaks = c("n=15", "n=25"),
                      values = c("red", "blue"))+            
  geom_hline(yintercept = 0.05, lty=2) +
  geom_text(aes(x=-2, y=0.07, label='alpha==0.05'), parse=TRUE, size=5) +
  labs(title = expression(
    paste("Powerfunction of the two-sided Z-Test (",alpha==0.05,")")), 
    x = expression(paste(mu[0])),
    y = expression(paste(beta)), size=8)    +
  theme_bw() +
  theme(axis.text  = element_text(size=12),
        axis.title = element_text(size=14))
print(P)
