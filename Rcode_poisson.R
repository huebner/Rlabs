###################  R code Poisson distribution

# The university police department writes, on average, five tickets per day 
# Suppose the number of tickets written per day follows a Poisson distribution with 
# a mean of  8.8 tickets per day. Find the probability that less than 
# six tickets are written on a randomly selected day from this distribution.
# Note: these numbers are all made up.

# Cumulative distribution function.
ppois(5, lambda=8.8)

# What is the probability of writing seven or more tickets?
1-ppois(6, lambda=8.8)

# probability density function.
dpois(6, lambda=8.8)


# Calculate the probability of writing two or fewer tickets  with the probability density function.
dpois(0, lambda=8.8) +dpois(1, lambda=8.8)+dpois(2, lambda=8.8)

# or
sum(dpois(0:2,8.8))

# Calculate P(5< X <10) for X ~ Poisson(lambda=8.8)
sum(dpois(6:9, 8.8))

# Inverse cumulative distribution function
qpois(0.2,lambda=8.8)
# There is at least a 20% chance that the police department issued 6 or fewer tickets.
# Check
ppois(6, lambda=8.8)
ppois(5, lambda=8.8)

