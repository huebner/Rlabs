###################  R code Binomial distribution

# Suppose there are 10 multiple choice questions. Each question has 5 choices, 
# and only one of these is correct. What is the probability getting two or fewer correct answers, 
# if you guess each answer at random.
pbinom(2, size=10, prob=0.2)
# This is the cumulative distribution function.

# What is the probability of getting seven or more correct?
1-pbinom(6, size=10, prob=0.2)

# What is the probability of getting exactly two answers correct?
dbinom(2, size=10, prob=0.2)
# This is the probability density function.

# Calculate the probability of getting two or fewer answers correct with the probability denisty function.
dbinom(0,10,0.2) +dbinom(1,10,0.2)+dbinom(2,10,0.2)

# or
sum(dbinom(0:2,10,0.2))

# Calculate P(5< X <10) for X ~ Binomial(30, 0.5)
sum(dbinom(6:9, 30, 0.5))

# Inverse cumulative distribution function
qbinom(0.5,size=15, prob=0.2)

# There is at least a 50% chance of getting 3 or fewer successes in 15 trials with success probability 0.2. 
# Check
pbinom(3, size=15, prob=0.2)
pbinom(2, size=15, prob=0.2)



