#vector1
vec1<-c(1,2,3)
vec2<-c("A","B","C")
print(vec1)
print(vec2)
typeof(vec1)
typeof(vec2)
vec1<-NULL
vec2<-NULL

#vector2
x<-c("April","May","JUne","July")
y<-x[c(2,4)]
print(y)

#vector3
x<-c(1,2,3,4)
result=rev(x)
cat("original vector:",x,"\n")
cat("Reversed vector:",result)

#Datatypes
x=5.6
print(class(x))
print(typeof(x))

y=5L
print(class(x))
print(typeof(x))

x=5
y=3
z=(x>y)
print(z)
print(class(z))
print(typeof(x))

x=4+3i
print(class(x))
print(typeof(x))

c=("Messi")
print(class(c))
print(typeof(C))

# data frame.
emp.data <- data.frame(
  emp_id = c (1:5), 
  emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
  salary = c(623.3,515.2,611.0,729.0,843.25), 
  
  start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11",
                         "2015-03-27")),
  stringsAsFactors = FALSE
)
print(emp.data) 

#vectors
# Create two vectors of different lengths.
vector1 <- c(5,9,3)
vector2 <- c(10,11,12,13,14,15)

# Take these vectors as input to the array.
result <- array(c(vector1,vector2),dim = c(3,3,2))
print(result)
#Factors
v <- gl(3, 4, labels = c("Tampa", "Seattle","Boston"))
print(v)
#LISTS
list_data <- list("Red", "Green", c(21,32,11), TRUE, 51.23, 119.1)
print(list_data)
print(list_data[1])
print(list_data[3])
list_data[4]<- 50L
print(list_data[4])
list_data[4]<- NULL
print(list_data[4])

#matrix
# Elements are arranged sequentially by row.
M <- matrix(c(3:14), nrow = 4, byrow = TRUE)
print(M)

# Elements are arranged sequentially by column.
N <- matrix(c(3:14), nrow = 4, byrow = FALSE)
print(N)

# Define the column and row names.
rownames = c("row1", "row2", "row3", "row4")
colnames = c("col1", "col2", "col3")

P <- matrix(c(3:14), nrow = 4, byrow = TRUE, dimnames = list(rownames, colnames))
print(P)
#Access elements
print(P[1,3])
print(P[4,2])
#data frames
emp.data <- data.frame(
  emp_id = c (1:4), 
  emp_name = c("Raj","Rohit","Ram","shri"),
  salary = c(63003,61002,4440,51502),
  stringsAsFactors = FALSE
)
print(emp.data)
print(summary(emp.data)) 
emp.data$dept <- c("H/W","S/W","Mobile","Web")
v <- emp.data
print(v)
#arrays
a <- array(c(1,2,3))
b <- array(c(4,5,6))
c <- array(c(7,8,9))
d <- c(a,b,c)
print(d)
# Create two vectors 
vector1 <- c(1,3,4,5)
vector2 <- c(10,11,12,13,14,15)

#vectors as input to the array.
result <- array(c(vector1,vector2),dim = c(3,3,2))
print(result)

#Plots
plot(1, 3)
plot(c(1, 2, 3, 4, 5), c(3, 7, 8, 9, 12))
plot(1:10, type="l")
plot(1:10, main="Basic Graph", xlab="x-axis", ylab="y-axis")
plot(1:10,pch = 19)
