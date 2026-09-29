# install and load Packages 

# 1. INSTALL AND LOAD PACKAGES

# Install these packages only once
install.packages("ggplot2")      # Builds static plots and charts
install.packages("plotly")       # Turns static ggplot2 figures into interactive plots
install.packages("dplyr")        # Data manipulation
install.packages("lubridate")    # Works with dates and times

# Load packages
library(ggplot2)
library(plotly)
library(dplyr)
library(lubridate)

getwd()
setwd('C:/Users/HP/OneDrive/Desktop/KPMG sem3/DA USING R/visualization')
getwd()

df <- read.csv("employee-workforce.csv")
df

tail(df)
head(df)

ncol(df)
dim(df)
colnames(df)

# convert data column into dataformat
df$Joining_Date <- as.Date(df$Joining_Date)

# convert categorical colun into factors 

df$Department <- as.factor(df$Department)
df$Gender    <- as.factor(df$Gender)
df$Location   <- as.factor(df$Location)
df$Work_Mode   <- as.factor(df$Work_Mode)
df$Attrition  <-  as.factor(df$Attrition)

head(df)
str(df)
summary(df)

#=========================================================================================================
# Basic emloyee using ggplot

ggplot(df, aes(x=Experience_Years , y = Monthly_Salary_INR)) + 
  geom_point()

# add colour 

ggplot(df, aes(x=Experience_Years, y=Monthly_Salary_INR, colour = Department))+
  geom_point(size = 2)

# ===========================================================================================================

# count employee joining activity by month
joining_date <- df %>%
  mutate(Joining_Month = floor_date(Joining_Date, "month")) %>%
  count(Joining_Month)

# plot monthly employee joining count

# Plot monthly employee joining counts

ggplot(joining_date,
       aes(x = Joining_Month, y = n)) +
  geom_line(color = "steelblue", linewidth = 1) +
  geom_point(size = 2) +
  labs(
    title = "Monthly Employee Joining Trend",
    x = "Joining Month",
    y = "Number of Employees")+
   
 theme_minimal()


# Bar chart: Department vs Number of Employees

ggplot(df, aes(x = Department)) +
  geom_bar() +
  labs(
    title = "Number of Employees by Department",
    x = "Department",
    y = "Number of Employees"
  ) +
  theme_minimal()

ggplot(df, aes(x = Department, fill = Attrition)) +
  geom_bar(position = "dodge") +
  labs(
    title = "Department-wise Employee Attrition",
    x = "Department",
    y = "Number of Employees",
    fill = "Attrition"
  ) +
  theme_minimal()


# Engagemnet score distribution with density curve
# Engagement Score distribution with a density curve,
ggplot(df, aes(x = Engagement_Score)) +
  geom_histogram(
    aes(y = after_stat(density)),
    bins = 20,
    fill = "lightgreen",
    color = "white",
    alpha = 0.7
  ) +
  geom_density(
    color = "red",
    linewidth = 1
  ) +
  labs(
    title = "Employee Engagement Score Distribution",
    x = "Engagement Score",
    y = "Density"
  ) +
  theme_minimal()
# distribution of employee salary 

ggplot(df, aes(x = Monthly_Salary_INR)) +
  geom_histogram(
    bins = 30,
    fill = "steelblue",
    color = "white"
  ) +
  labs(
    title = "Monthly Salary Distribution",
    x = "Monthly Salary (INR)",
    y = "Frequency"
  ) +
  theme_minimal



# relation ship between experience and salary 
ggplot(df, aes(x = Experience_Years, y = Monthly_Salary_INR)) +
  geom_point(
    color = "steelblue",
    size = 2,
    alpha = 0.7
  ) +
  labs(
    title = "Relationship Between Experience and Monthly Salary",
    x = "Experience (Years)",
    y = "Monthly Salary (INR)"
  ) +
  theme_minimal()

# cplors points by department 

ggplot(df, aes(
  x = Training_Hours,
  y = Performance_Rating,
  color = Department
)) +
  geom_point(size = 3, alpha = 0.7) +
  labs(
    title = "Training Hours vs Performance Rating",
    x = "Training Hours",
    y = "Performance Rating",
    color = "Department"
  ) +
  theme_minimal()


# add a trend line to examine the relationship 

# Add a trend line to examine the relationship
 


