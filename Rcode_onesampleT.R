################### Rcode for inference for means (t-interval or t-test)

# The production of a nationally marketed detergent results in certain workers receiving 
# prolonged exposure to the bacillus subtilis enzyme. Nineteen workers were tested to 
# determine the effects of these exposures on various respiratory functions. 
# The airflow rate, FEV1, is the ratio of a person’s forced expiratory volume to the 
# vital capacity, VC (max. volume of air a person can exhale after taking a  deep breath). 
# If the enzyme has an effect, it will be to reduce the FEV1/VC ratio. The norm is 0.80 in 
# persons with no lung dysfunction.

ratio<-c(0.61, 0.70, 0.63, 0.76, 0.67, 0.72, 0.64, 0.82, 0.88, 
         0.82, 0.78, 0.84, 0.83, 0.82, 0.74, 0.85, 0.73, 0.85, 0.87)

# check summary statistics
summary(ratio)
sd(ratio)

# are the data symmetric or approximately normsl?
qqnorm(ratio)
qqline(ratio)

# t interval and t test is the same function
# use ?t.test  to check what options are available
# A 90% confidence interval can be obtained with
t.test(ratio, mu=0.80, conf.level=0.90)

#save the output:
temp<-t.test(ratio, mu=0.80, conf.level=0.90)

# check what you can read from the output
names(temp)

# confidence interval
temp$conf.int

# mean
temp$estimate

# degrees of freedom used in calculating the pvalue or the confidence interval
temp$parameter

# or everything at once
temp

# Answer: A 90% confidence interval for the FEV1/VC ratio is (0.73, 0.80). This includes 
# the normal value of 0.80. 


# However the research question is whether the ratio is lower than normal. This is a one sided
# hypothesis test, namely the alternative is HA: mu < 0.80.
t.test(ratio, mu=0.80, alternative="less")

# The pvalue is 0.052. The data provide evidence that exposure to B. subtilis may reduce 
# the FEV1/VC ratio, but are inconclusive at the 5% significance level.


