#Access the dataset from the link: https://github.com/owid/covid-19-data?tab=readme-ov-file
#We will be analysing COVID-19 data.I advise you do not download as it is a big dataset.
#Instead read directly from https://catalog.ourworldindata.org/garden/covid/latest/compact/compact.csv

#Download the packages, if you do not have them installed like below
install.packages('plotly')

#Loading Packages
library(tidyverse)
library(dplyr)
library(lubridate)
library(forecast)
library(ggplot2)
library(scales)
library(tseries)

#Accessing our dataset
covid_data <- read.table('https://catalog.ourworldindata.org/garden/covid/latest/compact/compact.csv', sep=',', head=T)

#Exploring the dataset
head(covid_data,5)
tail(covid_data,5)
dim(covid_data)
names(covid_data)
glimpse(covid_data)

#Data Cleaning
covid_data$date <- as.Date(covid_data$date, format = "%Y-%m-%d")
complete_covid_data <- covid_data[!is.na(covid_data$total_cases),]
head(complete_covid_data,5)
filter(complete_covid_data, complete_covid_data$country == "Kenya")

