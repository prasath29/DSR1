#pie chart
x <- c(21, 62, 10, 53)
labels <- c("London", "New York", "Singapore", "Mumbai")
pie(x,labels)
#histogram
v <- c(19, 23, 11, 5, 16, 21, 32, 14, 19, 27, 39)
hist(v, xlab = "No.of Articles ",col = "green", border = "black")
#scatterplot
# Get the input values.
input <- mtcars[, c('wt', 'mpg')]
plot(x = input$wt, y = input$mpg,
     xlab = "Weight",
     ylab = "Milage",
     xlim = c(1.5, 4),
     ylim = c(10, 25),	
     main = "Weight vs Milage"
)
#Box plot
boxplot(mpg ~ cyl, data = mtcars,xlab = "Number of Cylinders",ylab = "Miles Per Gallon",main = "Mileage Data")

