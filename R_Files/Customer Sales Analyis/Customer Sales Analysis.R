# Loading necessary libraries
library(ggplot2)
library(tidyverse)
library(readr)
sales_data <- read_csv("D:Documents/train.csv")

# Data Exploration
dim(sales_data)
head(sales_data)
names(sales_data)
glimpse(sales_data)

# Data cleaning
missingValues <- !complete.cases(sales_data)
missingValues
sales_data[missingValues,]
sales_data <- na.omit(sales_data)

# Row ID -2235 has missing data - confirm it was deleted
sales_data[2235,1]
# Converting dates from char to dates
date_columns <- grep("Date", names(sales_data), value = T , ignore.case = T)
date_columns
class(sales_data$`Order Date`)
sales_data$`Order Date`<- as.Date(sales_data$`Order Date`,format="%d/%m/%Y")
class(sales_data$`Ship Date`)
sales_data$`Ship Date`<- as.Date(sales_data$`Ship Date`,format="%d/%m/%Y")
glimpse(sales_data)

#Exploratory Data Analysis
summary(sales_data$Sales)
