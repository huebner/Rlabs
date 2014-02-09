######################### R code relation between two quantitative variables

# upload crime data form 50 states
data(USArrests)
crime<-USArrests
# check what is in this dataset
?USAarrests
# Murder arrests per 100,000
# Assualt arrests per 100,000
# Percent urban population
# Rape arrests per 100,000

# Do scatterplot of % urban versus murder arrests
# Note first do without xlim and ylim and then decide whether you want to change the automatically chosen ranges
plot(Murder~UrbanPop, data=crime, xlim=c(15,100), ylim=c(0,20), pch=19, col="blue")
# label the points with the state
with(crime, text(Murder~UrbanPop, labels = row.names(crime), pos = 4, cex=0.5))

# Which states have higher arrests for murder and assault
plot(Murder~Assault, data=crime, xlim=c(40,400),  ylim=c(0,20), xlab="Assault per 100,000", ylab="Murder per 100,000")
with(crime, text(Murder~Assault, labels = row.names(crime), pos = 4, cex=0.5))

# What is it in Michigan?
crime$state<-rownames(crime)
crime[crime$state=="Michigan",]

# Label Michigan in the figure
indx<-which(crime$state=="Michigan")
points(crime$Assault[indx], crime$Murder[indx], pch=19, col="red")






