# sequence and replicate functions
seq(1:10)
seq(10,1)
seq(-2,13,2)

rep(1, times=10)
rep(1:3, times=5)
rep(4:1, each = 4)

#Control structures -if
x <- -5
if(x > 0){
  print("This number is positive")
}

if(x == 5){
  print("This is number five")
}else{
  print("This number is not five")
}

if(x<0){
  print("This is a negative number")
}else if(x == 0){
  print("This is a zero")
}else{
  print("This number is positive")
}

ifelse(x>=0, "Positive", "negative")

#For loop
for(x in 1:10){
  print(x * 10)
}

#while loop
i <- 1
while(i < 5){
  print("Hello world")
  i <- i + 1
}

# Repeat loop
j <- 10
repeat{
  print("I am enjoying R")
  if( j <= 0) break
  j <- j - 1
}

# Functions
summation = function(a,b){
  return (a + b)
}
summation(10,20)

#Inline functions
myDif = function(x,y) x-y
myDif(100,40)

#Vectors
typeof(10)
typeof(T)

numbers <- c(1,2,3,4,5,6,7)
numbers

assign("names", c("John", "Peter", "James"))
names

truthTable <- vector("logical", length=10)
truthTable <- c(T,T,T,T,T,T,T,F,T,F,F)
truthTable

numbers[3]
numbers[-3]

f <- c(20,10,13,24,56)
j <- c(1,3,4,5,78)

f+j

sum(numbers)
prod(numbers)
sort(numbers, decreasing = T)
rev(numbers)
