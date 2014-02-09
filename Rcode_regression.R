################### R code for regression analysis

# In the 1840s and 1850s a Scottish physicist, James D. Forbes, wanted to be able to estimate 
# altitude above sea level from measurement of the boiling point of the water. 
# He studied the relationship between boiling point and pressure. Forbes’ theory suggested 
# that over the range of observed values the graph of boiling point versus the logarithm of 
# pressure yields a straight line. Since the logs of the presures do not vary much, all 
# values of log(press) are multiplied by 100. This avoids studying very small numbers, 
# without changing the major features of the analysis 
# Reference: S. Weisberg. Applied Linear Regression. Wiley 2005.


# load the data and attcah the dataset
library(MASS)
data(forbes)

# Transform the pressure to 100*log(presure) useing a base 10 logarithm
forbes$hlpr<-100*log10(forbes$pres)
forbes$boil<-forbes$bp


# Create a scatterplot of the predictor versus the response, create summary statistics, 
# and calculate the correlation coefficient
plot(hlpr~pres, data=forbes)
summary(forbes$boil)
summary(forbes$hlpr)
cor(forbes$boil,forbes$hlpr)

# Fit a linear regression model and look at the regression output
fit<-lm(hlpr~boil, data=forbes)
summary(fit)  

# Draw a scatter plot with regression line
plot(hlpr~pres, data=forbes)
abline(fit)

# slope
fit$coefficients[2]
# The estimated regression line is hlpr=fit$coefficients[1]+fit$coefficients[2]*boil

# R square and adjusted R square
summary(fit)$r.squared
summary(fit)$adj.r.squared

# How scattered are the points around the line?
summary(fit)$sigma


# Calculate a 95% CI for the slope
slopemean<-tble[2,1]
slopese<-tble[2,2]
df<-fit$df.residual
critval<-abs(qt(0.025,df))

CIlow<-slopemean-critval*slopese
CIup<-slopemean+critval*slopese
# A 95% CI for the slope is (CIlow, CIup)

# Is the boiling point statistically significantly associated with HLPR?
tble<-summary(fit)$coefficients
pval<-tble[2,4]  # pvalue for testing H0: slope=0 vs H1: slope != 0



