###################  R code Exponential distribution

# Sixty-watt light bulbs have an average life of 1000 hours.
# The probability sitribution of the lifetime of such a light bulb is exponential with rate=0.001 


# Cumulative distribution function: probability that the lifetime is less than 100 hours.
pexp(100, rate=1/1000)

# What is the probability that the lightbulb lasts at least 900 hours?
1-pexp(900, 0.001)


# Calculate P(900< T <1200) for T ~ Exp(0.001)
pexp(1200, rate=0.001)-pexp(900, rate=0.001)


# Inverse cumulative distribution function
qexp(0.5,rate=0.001)
# The median lifetime of such  a bulb is 693.1 hours.


#  The top 20% of the lightbulbs last at least how many hours?
qexp(0.8,rate=0.001)



