##################################  R code Bootstrap ########################

### The purpose is the estimate a 95% confidence interval for the median of a population

# Sixty-watt light bulbs have an average life of 1000 hours.
# The probability sitribution of the lifetime of such a light bulb is exponential with rate=0.001 
# The median lifetime of such light bulbs is 693 hours
qexp(0.5,rate=0.001)


# For repeatability set the random seed
set.seed(123456); 

#### First method: Step-by-step calculation
# generate a random sample of size n from a population
n<-50
x <- rexp(n, rate=0.001)

# Calculate the median for each of the 1000 bootstrap samples
B<-1000
bootEst <- rep(NA,B);
 for(i in 1:B){bootEst[i] <- median(sample(x,size=n, replace=TRUE))}

# for comparison calculate  medians for 1000 samples drawn from the population
sampledEst <- rep(NA,1000)
for(i in 1:1000){sampledEst[i] <- median(rexp(30, rate=0.001))} 

# Compare the distribution of the sample medians for the population and the bootstrap medians
# from the observed sample
plot(density(bootEst)); 
lines(density(sampledEst),col="red")

# Calculate a 95% bootstrap confidence interval
quantile(bootEst, c(0.025, 0.975))

#### Second method: Use the boot package in R
library(boot)
# define a function for which we wish to calculate a bootstrap estimate
fn <- function(x,i){median(x[i])}
# calculate the bootstrap estimate and standard error
 bootresult <- boot(x,fn,B)
bootresult
# plot densities
plot(density(bootresult$t)); 
lines(density(sampledEst),col="red")
# get 95% bootstrap confidence interval
boot.ci(bootresult)

#### Third method: Use the the power of matrices in R
# it is not efficient to do loops in R (e.g for-loop)
# instead it is better to use the matrix capabilities of R

# Create a matrix where rows represent bootstrap samples
bootsamples<-matrix(sample(x, size=n*B, replace=T), nrow=B,ncol=n)
# calculate the median (or other estiamte for each bootstrap sample)
bootEst<-apply(bootsamples, 1, median)
sd(bootEst)
# 95% bootstrap confidence interval
quantile(bootEst, c(0.025, 0.975))

plot(density(bootEst)); 
lines(density(sampledEst),col="red")









