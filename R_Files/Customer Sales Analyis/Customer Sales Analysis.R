install.packages("forecast")
# Loading necessary libraries
library(ggplot2)
library(tidyverse)
library(readr)
library(forecast)
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
# Checking for outliers in sales
ggplot(data = sales_data, mapping = aes(x= Category, y= Sales )) +
  geom_boxplot(fill="steelblue", width=0.8, notch=TRUE, outlier.colour="red", outlier.shape=8) +
  labs(title = "Sales per Product Category", xlab ="Categories", ylab ="Sales")+ 
  theme_minimal()

# Total Sales over time
ggplot(data= sales_data, mapping = aes(x=`Order Date`, y = Sales)) +
  geom_line(color="steelblue")+
  labs(title = "Total Sales Over Time", x="Date",Y= "Sales")
# Top selling categories
ggplot(data = sales_data, mapping = aes(x= Category, y= Sales, fill = Category)) +
  geom_bar(stat="identity", width=0.5) +
  scale_fill_manual(values=c("red", "blue", "green"))+
  labs(title="Top Selling Categories", x="Categories", Ylab= "Sales") + 
  theme_minimal()
# Sales by region
ggplot(data = sales_data, mapping = aes(x= Region, y= Sales, fill=Region)) +
  geom_bar(stat="identity", width=0.5, fill="steelblue") +
  labs(title="Sales By Regions", x="Regions", Ylab= "Sales") +
  coord_flip() +
  theme_minimal()
# Customer Purchase frequency
ggplot(data= sales_data, mapping = aes( x = `Customer ID`, y = Sales)) +
  geom_line(color="steelblue") +
  labs(title ="Customer Purchase Frequency", xlab= "Customer ID", y= "Sales") +
  theme_classic()

# Forecasting and prediction
# Convert data to time series
sales_ts <- ts(sales_data$Sales, start=c(2020,1), frequency=12)

# Fit ARIMA model
arima_model <- auto.arima(sales_ts)
forecasted_sales <- forecast(arima_model, h=12)

# Plot forecast
autoplot(forecasted_sales) + labs(title="Sales Forecast for Next 12 Months")

write_csv(sales_data,"cleaned_customer_sales.csv")




