##################################  R code Bootstrap ########################

### The purpose is the estimate a 95% confidence interval for the median of a population

# An experiment measures the reaction time as follows. You see a red screen and then need 
# to click immediately when the screen turns green. On the webpage Human Benchmarks 
# http://www.humanbenchmark.com/tests/reactiontime/stats.php
# the median reaction time is listed as 215 milliseconds. 
# Large literature exists on reaction times with simple experiments show a mean of 220 
# milliseconds The distribution of reaction times (Laming, D. R. J. 1968. Information Theory of 
# Choice-Reaction Times. Academic Press, London.). Older age slows reaction times. The 
# difference in reaction times between college degrees and lower education levels was roughly 
# equivalent to a 10 year age difference. (Tun PA, Lachman ME. Age Differences in Reaction time 
# and Attention in a National Telephone Sample of Adults: Education, Sex, and Task Complexity 
# Matter. Dev Psychol 2008. 44(5): 1421-1429.)
 




# For repeatability set the random seed
set.seed(123456);
 
# generate a random sample of size n from a population representing reaction times 
# in a simple reaction time experiment
n<-50
x <- rnorm(n, mean=220, sd=50)



#### First method: Step-by-step calculation
# Calculate the median for each of the 1000 bootstrap samples
B<-1000
bootEst <- rep(NA,B)
for(i in 1:B){bootEst[i]<- median(sample(x, size=n, replace=T))}

# average estimate of the median
mean(bootEst)

# standard error of the estimate
sd(bootEst)

# Calculate a 95% bootstrap confidence interval
quantile(bootEst, c(0.025, 0.975))

# for comparison calculate  medians for 1000 samples drawn from the population
sampledEst <- rep(NA,1000)
for(i in 1:1000){sampledEst[i] <- median(rnorm(n, 220,50))}
# average estimate of the median
mean(sampledEst) 

#### Second method: Use the the power of matrices in R
# it is not efficient to write loops in R (e.g for-loop)
# instead it is better to use the matrix capabilities of R

# Create a matrix where rows represent bootstrap samples
bootsamples<-matrix(sample(x, size=n*B, replace=T), nrow=B,ncol=n)

# calculate the median (or other estimate for each bootstrap sample)
bootEst<-apply(bootsamples, 1, median)
 
# average estimate of the median
mean(bootEst)

# standard error of the estimate
sd(bootEst)

# 95% bootstrap confidence interval
quantile(bootEst, c(0.025, 0.975))

# Compare the distribution of the sample means for the population and the bootstrap means
# from the observed sample
plot(density(bootEst), main=""); 
lines(density(sampledEst),col="red")
legend("topright", lty=1, col=1:2, c("bootstrap estimates","sample estimates"))




#### Third method: Use the boot package in R
library(boot)
# define a function for which we wish to calculate a bootstrap estimate
# the "index" in this function refers to sampling with replacement the indices 1 to n from
# x[1],..., x[n] of the original sample

fn <- function(x,index){median(x[index])}
# calculate the bootstrap estimate and standard error

bootresult <- boot(x,fn,B)
bootresult
# get 95% bootstrap confidence interval
boot.ci(bootresult)


### Optional: Width of the confidence intervals

cis=function(results,K=25){ 
  lower=rep(0,K) 
  upper=rep(0,K) 
  plot(c(results[1,1],results[1,2]),c(0,K+1), type="n",xlim=c(100,1500), 
       ylab="number of   confidence intervals",
       xlab=paste("Each CI created from ", B, "Bootstrap samples from a sample of size", n) )
  title(paste("95% Bootstrap confidence intervals"))
  for ( i in (1:K)){ 
    lower[i]=results[i,1] 
    upper[i]=results[i,2] 
    lines(c(lower[i],upper[i]),c(i,i)) }
  abline(v=qexp(0.5, rate=0.001), col="red", lwd=2) 
} 


n=30
K=50
results<-matrix(NA, nrow=K, ncol=2)
for (i in 1:K){
  x <- rexp(n, rate=0.001)
  bootsamples<-matrix(sample(x, size=n*B, replace=T), nrow=B,ncol=n)
  bootEst<-apply(bootsamples, 1, median) 
  results[i,]<-quantile(bootEst, c(0.025, 0.975))  
}
cis(results,K)








