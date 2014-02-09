################################### Rcode for data examples

## set directory to folder with data. Change according to your folder organization
setwd("~/Desktop/Teaching/Rlab")

## For this exercise we generate data, so that you don't 
## have to look for uploading data in some of your folders.

# generate 50 random data 
x<-rnorm(50)

#data summaries
summary(x)
sd(x)

# frequency histogram
hist(x)
hist(x, nclass=20, col="grey")

# relative frequency histogram
library(lattice)
histogram(x)

# if you get an error, use first install.packages('lattice') and then proceed with library(lattice)


#boxplot
boxplot(x)
boxplot(x, col="grey")

# generate heights of 20 men and 20 women [inches]
men<-rnorm(20, mean=69.1, sd=2.9)  
women<-rnorm(20, mean=63.7, sd=2.7) 
#combine these heights
ht<-c(men,women)
# indicator function for gender
gender<-c(rep("male", 20), rep("female", 20))

#side-by-side boxplot
boxplot(ht~gender)
boxplot(ht~gender, xlab="gender", ylab="height", col=c("blue", "green"))

# scatter plots
x<-rnorm(20)
y<-rnorm(20)

# The LHS of y~x is the vertical axis, the RHS is the horizontal axis
plot(y~x)   # Note length(x) must be the same as length(y)
plot(y~x, xlab="x-axis label", ylab="y-axis label", pch=19, col="blue")

# plotting number of occurrences as a scatterplot
x.list<-c(rep(1,3), rep(2, 4), 3, 4, 5)
x.count<-table(x); x.count

x<-unique(x.list)
y<-x.count

plot(y) # this is a  line graph
y<-as.numeric(y)
plot(y) # this is a scatter plot 
plot(y~x, pch=19, col=1, ylim=c(0,5)) # this is alos a scatter plot


