###################  R code Normal distribution

# Average height of US males are approximately normal distributed with mean 69.1 inches 
# and standard deviation 2.9 inches. 


# Cumulative distribution function: probability that a man is less than 70 inches tall.
pnorm(70, mean=69.1, sd=2.9)

# What is the probability of a man being taller than 70 inches?
1-pnorm(70, mean=69.1, sd=2.9)


# Calculate P(66< X <72) for X ~ Normal(69.9, 2.9)
pnorm(72, mean=69.1, sd=2.9)-pnorm(66, mean=69.1, sd=2.9)

# Inverse cumulative distribution function
qnorm(0.9,mean=69.1, sd=2.9)
# There is a 90% chance that a man is 72.8 inches tall or less.

# Do the data come from a normal probability distribution?
# generate normally distributed data
z<-rnorm(50)
# generate random numbers from a skewed distribution
y<-rexp(50, rate=1/3)

qqnorm(z)
qqline(z)

qqnorm(y)
qqline(y)


