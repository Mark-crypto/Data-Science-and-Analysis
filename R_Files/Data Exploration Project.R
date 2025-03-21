# Data exploration and visualization

#Installing markdown for proper documentation
install.packages("rmarkdown")
install.packages("shiny")


#Loading necessary packages
library(ggplot2)
library(tidyverse)

#Loading my data
library("gapminder")

#Exploring Data
View(gapminder)
head(gapminder)
tail(gapminder)
glimpse(gapminder)
unique(gapminder$country)
summary(gapminder)
class(gapminder$pop)

#Data cleaning
na.omit(gapminder)
noMissingData <- drop_na(gapminder)
noMissingData
missingData <- !complete.cases(gapminder)
gapminder[missingData,]

gapminder %>% 
  select(country,pop,year) %>% 
  rename("population" = "pop") %>% 
  filter(year > 2000 & population > 10000000) %>%
  arrange(year) %>% 
  head()

sampleData <- select(gapminder, country, pop, year)
  yearly_data <- sampleData %>% 
  pivot_wider(names_from = year, values_from = pop)
  
View(yearly_data)

# Descriptive statistics on population
population <- gapminder$pop
summary(population)
population = population/1000000
summary(population) 

unique(gapminder$continent)
continents = gapminder$continent 
plot(population, continents)

#Visualizations
#Bar chart
ggplot(data=gapminder, mapping = aes(x=continent)) + geom_bar(fill = "steelblue")  + 
  labs(title = "Continents", x="Habitable Continents")

#Scatter plot
gapminder %>% 
  filter(year > 2006 & continent == "Africa" & pop > 40000000) %>% 
  ggplot(mapping= aes(x = country, y = pop/1000000)) + 
  geom_point(size=5, alpha = 0.5) +
  labs(title = "Population of African countries", y="population (millions)")

#T-test
gapminder %>% 
  filter(continent %in% c("Americas", "Oceania")) %>%  
  t.test(lifeExp ~ continent, data= ., )

#ANOVA
gapminder %>% 
  filter(year == 2007) %>% 
  filter(continent %in% c("Asia", "Africa", "Americas")) %>% 
  aov(lifeExp ~ continent, data = .) 
  #summary
