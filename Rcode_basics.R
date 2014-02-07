########################## Rcode basics


##### math operations
2 + 3 * 5     # Note the order of operations.
log(10)       # Natural logarithm with base e=2.718282
4^2           # 4 raised to the second power
3/2           # Division
sqrt(16)      # Square root
abs(3-7)      # Absolute value of 3-7
exp(2)        # exponential   function
15 %/%4      # This is the integer divide operation
# This is a comment line

### reading and writing files from the current directory
read.table("filename.txt", header=T)   # reads a data text file called "filename"
read.csv("filename.csv", header=T)     # reads a data csv file
load(".rdata")                         # reads R data
ls()                                   # lists the names of all objects
rm(object1)    # removes the object named object1 from the current environment

write.table(mydata, file="c:/mydata.txt", sep=" ")  # saves a data to a file
Other options: (sep=",") or (sep="\t")
write.csv(mydata, file="mydata.csv")


### basics with data vectors
x<-c(1,3,2,10,5)
x
sum(x)
summary(x)
sort(x, decreasing=T)

y<-1:5
y+2
y*2
y^2

length(x)
length(y)

x+y
z<-cbind(x,y)
z<-rbind(x,y)

ls()
rm(x,y)
ls()

### basics with data matrices
 A<-matrix(c(1,2,3,4), nrow=2, ncol=2); A
 rownames(A)<-c("row1", "row2")
 colnames(A)<-c("col1", "col2")
 dim(A)
A<-matrix(c(1,2,3,4),byrow=TRUE);A

sqrt(A)
A^2


# Indexing Data

 x<-c(1,2,4,10, NA, 5,3)
 x[3:5]    # the third to fifth element of x, inclusive
 x[x>3]    # list of elements in x greater than 3
 is.na(x)
  x[-2]  # deleting the second element
 (1:length(x))[x<=3] # indices of x whose components <=3
 na.omit(x)
 a<-mean(x[!is.na(x)]);a  #average;
 x3<-x; 
 x3[is.na(x)]<-a; x3  #impute with average value


B<-matrix(c(1,2,3,4,5,6),nrow=2,ncol=3, byrow=T);B
B[order(B[,1], decreasing=T),]
B[1,2]
B[2,]  # second row
t(B)   # transpose of B
B[-1,] # remove first row
B[,-c(1,3)]  # remove first and third column


# dataframes in R
library(SemiPar)
data(fuel.frame)
car<-fuel.frame
names(car)
dim(car)
car[1:3,]
unique(car$car.name)[1:3]
mean(car$Mileage)
table(car$Type)




