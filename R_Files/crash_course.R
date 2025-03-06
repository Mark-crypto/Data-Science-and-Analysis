data()
View(WorldPhones)

install.packages("tidyverse")
library("tidyverse")

View(starwars)
starwars %>% 
  filter(height > 150 & mass < 200) %>% 
  mutate(height_in_meters = height/100) %>% 
  select(height_in_meters, mass) %>% 
  arrange(mass) %>% 
  #View() %>% 
  plot() 

#Importing data
View(msleep)
glimpse(msleep)
head(msleep)
class(msleep$name)
length(msleep)
length(msleep$name)
names(msleep)
unique(msleep$vore)
missing <- !complete.cases(msleep)
msleep[missing, ]

#Cleaning data
starwars %>% 
  select(name,height,mass)
starwars %>% 
  select(1:3)
starwars %>% 
  select(ends_with("color")) 

# change variable order
starwars %>% 
  select(name,mass, height, everything())
starwars %>% 
  rename("characters" = "name") %>% 
  head()
class(starwars$hair_color)
starwars$hair_color <- as.factor(starwars$hair_color)
class(starwars$hair_color)

starwars %>% 
  mutate(hair_color = as.character(hair_color)) %>% 
  glimpse()

# Changing factor levels
df <- starwars
df$sex <- as.factor(df$sex)
levels(df$sex)

df <- df %>%
  mutate(sex=factor(sex, levels=c("male", "female", "hermaphroditic", "none")))

levels(df$sex)

# Filter rows
starwars %>%
  select(mass,sex) %>% 
  filter(mass<55 & sex=="male")

# Recode data
starwars %>% 
  select(sex) %>% 
  mutate(sex=recode(sex, "male"="man", "female"="woman"))

#Missing data
mean(starwars$height, na.rm = TRUE)

# Duplicates
Names <- c("Peter", "James", "John", "Peter")
Ages <- c(22, 17, 31, 22)

friends <- data.frame(Names,Ages)
friends  

friends %>%  
  distinct()
  
distinct(friends)


# Manipulate
starwars %>% 
  mutate(height_m = height/100) %>% 
  select(name, height, height_m) %>% 
  mutate(tallness= if_else(height_m < 1, "short", "tall"))

# Reshape your data with pivot wider
install.packages("gapminder")
library(gapminder)
View(gapminder)

data<- select(gapminder, country, year, lifeExp)

View(data)
wide_data <- data %>% 
  pivot_wider(names_from = year, values_from = lifeExp)

View(wide_data)

#Pivot longer
long_data <- wide_data %>% 
  pivot_longer(2:13, names_to = "year", values_to = "lifeExp")
   
View(long_data)

#Describing your variables
min(msleep$awake)
max(msleep$awake)
range(msleep$awake)
IQR(msleep$awake)

mean(msleep$awake)
median(msleep$awake)
mode(msleep$awake)
var(msleep$awake)

summary(msleep$awake)

msleep %>% 
  select(awake, sleep_total) %>% 
  summary()

# Summarize your data
msleep %>% 
  drop_na(vore) %>% 
  group_by(vore) %>% 
  summarise(Lower = min(sleep_total), Average = mean(sleep_total), Upper = max(sleep_total, Difference = max(sleep_total) - min(sleep_total))) %>% 
arrange(Average) %>% 
  View()

# Tables
table(msleep$vore)

msleep %>% 
select(vore, order) %>% 
  filter(order %in% c("Rodentia", "Primates")) %>% 
table()

# Visualize 
plot(pressure)

# Bar plot
ggplot(data= starwars, mapping = aes(x = gender)) + geom_bar()
#Histogram
starwars %>% 
  drop_na(height) %>% 
  ggplot(mapping = aes(x = height)) + 
  geom_histogram()

#Box plot
starwars %>% 
  drop_na(height) %>% 
  ggplot(mapping = aes( x= height)) +
  geom_boxplot(fill = "steelblue") +
  theme_bw()+
  labs(title = "Box plot of heights", x = "height of characters")
# Density plot
starwars %>% 
  drop_na(height) %>% 
  filter(sex %in% c("male", "female")) %>% 
  ggplot(mapping = aes(x = height, colour = sex, fill = sex)) + 
  geom_density(alpha = 0.2) + 
  theme_bw()
#Scatter plot
starwars %>% 
  filter(mass < 200) %>% 
  ggplot(mapping = aes(x = height, y = mass, colour = sex)) +
  geom_point(size = 5, alpha = 0.5) +
  theme_minimal()+
  labs(title="Height and mass by sex")
#Smoothed model
starwars %>% 
  filter(mass < 200) %>% 
  ggplot(mapping = aes(x= height, y = mass , colour = sex)) +
  geom_point(size = 3, alpha =0.8)+
  geom_smooth()+
  facet_wrap(~sex)+
  theme_bw()+
  labs(title="Height and mass by sex")

#Analyze your data - Hypothesis testing(t-test)
library(gapminder)
View(gapminder)
#t_test_plot

gapminder %>% 
  filter(continent %in% c("Africa", "Europe")) %>% 
  t.test(lifeExp ~ continent, data= ., )

#ANOVA
gapminder %>% 
  filter(year == 2007) %>% 
  filter(continent %in% c("Americas", "Europe", "Asia")) %>% 
  aov(lifeExp ~ continent, data = .) %>% 
  summary()

gapminder %>% 
  filter(year == 2007) %>% 
  filter(continent %in% c("Americas", "Europe", "Asia")) %>% 
  aov(lifeExp ~ continent, data = .) %>% 
  TukeyHSD()

gapminder %>% 
  filter(year == 2007) %>% 
  filter(continent %in% c("Americas", "Europe", "Asia")) %>% 
  aov(lifeExp ~ continent, data = .) %>% 
  TukeyHSD() %>% 
  plot()

#Chi-squared 
head(iris)
flowers <- iris %>% 
  mutate(Size = cut(Sepal.Length, breaks = 3, labels= c("Small", "Medium", "Large")))%>% 
  select(Species, Size)

#Goodness of fit test
flowers %>% 
  select(Size) %>% 
  table() %>% 
  chisq.test()

#Test of independent
flowers %>% 
  table() %>%
  chisq.test()

#Linear model
head(cars, 10)

cars %>% 
  lm(dist ~ speed, data = .) %>% 
  summary()
  