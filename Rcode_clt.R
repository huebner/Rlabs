################### R code to illustrate the  central limit theorem

# Generate 2 random numbers from a uniform distribution in the interval 1 to 3. 
# And repeat this 1000 times. This is repeated sampling when the sample  size is 2 each time. 
x1<-replicate(1000,runif(2,1,3))
# Generate 5 random numbers from a uniform distribution in the interval 1 to 3.  
# And repeat this 1000 times. This is repeated sampling when the sample  size is 5 each time.
x2<-replicate(1000,runif(5,1,3))
# Generate 30 random numbers from a uniform distribution in the interval 1 to 3.  
# And repeat this 1000 times. This is repeated sampling when the sample  size is 30 each time.
x3<-replicate(1000,runif(30,1,3))

# Note that the data are organized in a matrix with 30 rows and 1000 columns
dim(x3)
# Each column represents one sample. The rows are the values of the sample.

# Check the distribution of one of first sample of size 30.
hist(x3[,1], nclass=10, col="grey")


# Now calculate the sample means for each sample.
# This results in 1000 sample means, one for each sample (size 2)
x1bar<-apply(x1,2,mean)
# And again for the other sample sizes
x2bar<-apply(x2,2,mean)
x3bar<-apply(x3,2,mean)

# Let's make a figure of the distribution of the sample means noting the sample sizes.
par(mfrow=c(2,2))
hist(x1[1,], main="1000 U(1,3)random numbers")
hist(x1bar, main="xbar, n=2")
hist(x2bar, main="xbar, n=5")
hist(x3bar, main="xbar, n=30")
par(mfrow=c(1,1))

## And how does it look like when the underlying distribuion is exponential?

# Generate 2 random numbers from an exponential distribution with rate 1. 
# And repeat this 1000 times. This is repeated sampling when the sample  size is 2 each time. 
y1<-replicate(1000,rexp(2,rate=1))
# Generate 5 random numbers from an exponential distribution with rate 1.   
# And repeat this 1000 times. This is repeated sampling when the sample  size is 5 each time.
y2<-replicate(1000,rexp(5,rate=1))
# Generate 30 random numbers from an exponential distribution with rate 1.   
# And repeat this 1000 times. This is repeated sampling when the sample  size is 30 each time.
y3<-replicate(1000,rexp(30,rate=1))

# Note that the data are organized in a matrix with 30 rows and 1000 columns
dim(y3)
# Each column represents one sample. The rows are the values of the sample.

# Now calculate the sample means for each sample.
# This results in 1000 sample means, one for each sample (size 2)
y1bar<-apply(y1,2,mean)
# And again for the other sample sizes
y2bar<-apply(y2,2,mean)
y3bar<-apply(y3,2,mean)

# Let's make a figure of the distribution of the sample means noting the sample sizes.
par(mfrow=c(2,2))
hist(y1[1,], main="1000 Exp(1))random numbers")
hist(y1bar, main="ybar, n=2")
hist(y2bar, main="ybar, n=5")
hist(y3bar, main="ybar, n=30")
par(mfrow=c(1,1))

