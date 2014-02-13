################### R code for residual analysis

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

# Transform the pressure to 100*log(presure)
forbes$hlpr<-100*log(forbes$pres)
forbes$boil<-forbes$bp
# Fit a linear regression model
fit<-lm(hlpr~boil, data=forbes)

#Is there evidence that the residuals do not follow a normal distribution?
qqnorm(fit$residuals)
qqline(fit$residuals)

# Make a residual plot. 
fit.stdres = rstandard(fit)
plot(fit$fitted, fit.stdres, xlab="Fitted values", ylab="Standardized residuals")
abline(h=0, col=2, lwd=2)

# identify the point with the largest residual and then click Esc
identify(fit$fitted, fit.stdres)
# index 12

# remove large residuals
indx<-which(fit.stdres>2)
forbes1<-forbes[-indx,]

# redo regression analysis with this outlier removed
fit1<-lm(hlpr~boil, data=forbes1)
summary(fit1) 
# The regression fit and coefficient of determination did not change much.

fit.stdres = rstandard(fit1)
plot(fit1$fitted, fit.stdres, xlab="Fitted values", ylab="Standardized residuals")
abline(h=0, col=2, lwd=2)
# There are no obvious outliers in this plot.



