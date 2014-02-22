##################################  R code Bootstrap ########################

### The purpose is to estimate a 95% confidence interval for the mean of a population

# Sixty-watt light bulbs have an average life of 1000 hours.
# The probability distribution of the lifetime of such a light bulb \
# is exponential with rate=0.001 
# The median lifetime of such light bulbs is 693 hours.
qexp(0.5,rate=0.001)


# For repeatability set the random seed
set.seed(123456); 

################     Draw a random sample of size n from this population
n<-30
x <- rexp(n, rate=1/mu)

#### t-interval for the mean

t.int<-t.test(x, conf.level=0.95)$conf.int
t.int


#### Bootstrap interval for the mean

# Create a matrix where columns represent bootstrap samples
bootsamples<-matrix(sample(x, size=n*B, replace=T), nrow=n,ncol=B)
# calculate the mean for each bootstrap sample
bootEst<-apply(bootsamples, 2, mean)
# 95% bootstrap confidence interval using the percentile method
boot.int<-quantile(bootEst, c(0.025, 0.975))
boot.int



################  Repeated sampling to calculate a t interval for the mean

#   Create K samples from a population with a skewed distribution (mean=mu)
#   Calculate confidence intervals for the mean
#   How many of the 95% confidence intervals contain the true mean?

K=1000
mu=1000
xx<-replicate(K, rexp(n, rate=1/mu))

results<-matrix(FALSE, K,2)
t.int<-matrix(FALSE, K, 2)
for(i in 1:K){
t.int[i,]<-t.test(xx[,i], conf.level=0.95)$conf.int
results[i,1]<-t.int[i,1]<mu & t.int[i,2]>mu
}
apply(results,2,sum)

# This is less than 95% coverage (skewed distribution)


### What would the coverage be if the population had a symmetric distribution?
#   Create K samples from a population with a symmetric distribution (mean=mu)
#   Calculate confidence intervals for the mean
#   How many of the 95% confidence intervals contain the true mean?

K=1000
mu=0
xx<-replicate(K, rnorm(n, mean=mu, sd=1))

results<-matrix(FALSE, K,2)
t.int<-matrix(FALSE, K, 2)
for(i in 1:K){
t.int[i,]<-t.test(xx[,i], conf.level=0.95)$conf.int
results[i,1]<-t.int[i,1]<mu & t.int[i,2]>mu
}
apply(results,2,sum)

# This is about 95% coverage (symmetric distribution)





#########  Compare methods to calculate confidence intervals from a skewed distribution
## t interval conf.t
## bootstrap percentile method  conf.boot
## bootstrap method with centering  conf.boot.adj

compare.ci <- function(samp, reps = 1000){
    # "samp" is the actual original observed sample

    n <- length(samp)

    boot.int <- numeric(reps)
    boot.adj <- numeric(reps)

    for(i in 1:reps){
        s <- sample(samp, replace=TRUE)  # bootstrap sample
        boot.int[i] <- mean(s)
        boot.adj[i] <- (mean(s)-mean(samp)) / (sd(s)/sqrt(n))  # centered bootstrap estimate
    }

    # conf.t <- mean(samp)-qt(c(0.975,0.025), df=n-1)*sd(samp)/sqrt(n)
    conf.t<- t.test(samp)$conf.int
    conf.boot <- quantile(boot.int, probs=c(0.025, 0.975))
    conf.boot.adj<- mean(samp)-quantile(boot.adj, probs=c(0.975,0.025))*sd(samp)/sqrt(n)

    return(rbind(conf.t, conf.boot, conf.boot.adj))
}

# small sample size
n=20

### check the difference between these methods
pop<-rexp(1000,rate=1/mu)
x<-sample(pop,n)
mean(pop)
compare.ci(x)


# simulation study: which methods contains more of the true mean at a 95% confidence level
sims <- 1000
n<-15  # small sample

results <- matrix(FALSE, sims,3)
colnames(results) <- c("t-interval", "Bootstrap percentile", "Bootstrap centered")


# Be patient. This can take a while (about 1 minute). Wait until the prompt appears.
for(i in 1:sims){
    pop <- rexp(10000, rate=1/mu)
    x <- sample(pop,n)
    mu <- mean(pop)
    y <- compare.ci(x)
    for(j in 1:3){
        results[i,j] <- y[j,1] < mu & y[j,2] > mu
    }
}

apply(results,2,sum)

# it looks like the centered bootstrap has the best coverage




