################### Rcode for inference for one sample proportions 

# Simulate 100 coin tosses
heads <- rbinom(1, size = 100, prob = .5)

# Test whether about 50% heads came up in these coin tosses. This uses the normal approximation 
# to the binomial distribution with or without the continuity correction
prop.test(heads, 100)          # continuity correction TRUE by default
prop.test(heads, 100, correct = FALSE)
prop.test(heads, 100,conf.level=0.95)   # confidence level of 0.95 is the default

# the exact test is based on binomial probabilities
binom.test(heads,100)

# Save the output 
temp<-prop.test(heads, 100) 
# names(temp) shows us what output values are available

#confidence interval for the proportion of heads
temp$conf.int

# estimated proportion
temp$estimate

# pvalue of the hypothesis test H0: p=0.5 versus H1: p != 0.5
temp$p.value