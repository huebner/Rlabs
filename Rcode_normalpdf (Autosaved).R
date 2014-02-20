###################  R code draw a density of a normal distribution with shading

# The fill weight of baby food jars follows a normal distibution with mean 137.6 grams
# and standard deviation of 1.6 grams. The label weight  on the jars is 135.0 grams. 
# Reference: J. Fisher. Computer assisted net weight control. Quality Progress, June 1983.

mean=137.6; sd=1.6
lb=100; ub=135

# draw a density curve for this normal distribution
x <- seq(-4,4,length=100)*sd + mean
px <- dnorm(x,mean,sd)

plot(x, px, type="n", xlab="fill weight of jars", ylab="", axes=FALSE)

# shade the area for which the probability is calculated
i <- x >= lb & x <= ub
lines(x, px)
polygon(c(lb,x[i],ub), c(0,px[i],0), col="gray") 

# calculate the probability P(W<135) and paste it into the figure
area <- pnorm(ub, mean, sd)
result <- paste("P(W <",ub,") =",
   signif(area, digits=3))
mtext(result,3)
# add axes ticks and labels
axis(1, at=seq(130, 145, 2), pos=0)


# create a figure and shade it for the probability P(134< W<136) 
lb=134; ub=136

plot(x, px, type="n", xlab="fill weight of jars", ylab="", axes=FALSE)

# shade the area for which the probability is calculated
i <- x >= lb & x <= ub
lines(x, px)
polygon(c(lb,x[i],ub), c(0,px[i],0), col="gray") 


area <- pnorm(ub, mean, sd) - pnorm(lb, mean, sd)
result <- paste("P(",lb,"< W <",ub,") =",
   signif(area, digits=3))
mtext(result,3)
# add axes ticks and labels
axis(1, at=seq(130, 145, 2), pos=0)


# unknown mean: create a figure and shade it for the probability P(W<135) = 0.01
sd=1.6
mean=135-qnorm(0.01)*sd
lb=100; ub=135

plot(x, px, type="n", xlab="fill weight of jars", ylab="", axes=FALSE)

# shade the area for which the probability is calculated
i <- x >= lb & x <= ub
lines(x, px)
polygon(c(lb,x[i],ub), c(0,px[i],0), col="gray") 


area <- pnorm(ub, mean, sd) 
result <- paste("P(W <",ub,") =",  signif(area, digits=3), "for mean=", round(mean,2))
mtext(result,3)
# add axes ticks and labels
axis(1, at=seq(130, 145, 5), pos=0)



