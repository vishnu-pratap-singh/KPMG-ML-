install.packages("tidyverse")
installed.packages("readxl")
install.packages("writexl")

library(tidyverse)
library(readxl)
library(readxl)

getwd()

sales_amount <-50000
cost<-35000
profit <- sales_amount-cost
sales_amount
cost
profit


# Basic calculation

sales_amount+cost
sales_amount-cost
sales_amount*2
sales_amount/2

sales <-c(
1000,
1500,
1200,
1800,
2000
)
sales
mean(sales)
sum(sales)
min(sales)
max(sales)
sd(sales)




regions <- c(
  "North",
  "South",
  "East",
  "West"
)
regions
# accesing vectoe element 

regions[1]
regions[2]


# 11 Logical filtering of vector 
sales >1500
sales[sales >1500]
#----------------------------------------------------------------
# 12 matrix 

#----------------------------------------------------------------


sales_matrix <- matrix(
  c(
    1000,
    1500, 1200,1800,2000,2500
  ),
nrow = 2,
byrow = TRUE
)
sales_matrix
  

sales_matrix[2,2]
sales_matrix[1,3]


# ----------------------------------------------------------------------------
# 14. MATRIX CAlculation
# _____________________________----------------------------------------------

rowSums(sales_matrix)

# ___________________________________________________________________________________________________

# creatng  dataframe

# ------------------------------------------------------------------------------------

small_slaes <- data.frame(
  customer =c(
    "A", "B", "C", "D"
  ),
  
  Region =c(
    "North", "South", "North", "West"
  ),
  
  Sales =c(
    1000,1500, 1200,2000
  ),
  Profit =c(200,300,250,450)
)
small_slaes

# ----------------------------------------------------------------------------
# 16 check Data Frame Type 
# _----------------------------------------------------------------

class(small_slaes)
str(small_slaes)

# ---------------------------------------------------------------------------
# 17. Access DATA Frame columns 
# --------------------------------------------------------------------------

small_slaes$Sales
small_slaes$Region
small_slaes["Sales"]

small_slaes[["Sales"]]

# ----------------------------------------------------------------------------
# 18 Access Rows 
# ------------------------------------------------------------------------------

small_slaes[1,]
small_slaes[1:3]


# ---------------------------------------------------------------------------
# Modify data 
# ---------------------------------------------------------------------------

small_slaes$Sales[1] <- 1200
small_slaes


# -------------------------------------------------------------------------------
# 21 creating a new column
# --------------------------------------------------------------------------------

small_slaes$Profit_Margin <-
  
  small_slaes$Profit/small_slaes$Sales


small_slaes

#---------------------------------------------------------------------------------
# IMporting excel
# -----------------------------------------------------------------------------

getwd()
setwd("C:/Users/HP/OneDrive/Desktop/KPMG sem3/DA USING R/DATA MANIPULATION")
getwd()

df <- read_xlsx(
  "Sales-Data.xlsx"
)

df

tail(df)
# no of rows
nrow(df)
# no of columns
ncol(df)
# dimensions
dim(df)

# columns name 
colnames(df)

# structure f dtatatype 

str(df)


# SUMMARY STATISTICS 

summary((df))

# glimps 

glimpse(df)


# ----------------------------------------------------------------------------------------------

unique(df$Region)
unique(df$Product)


# -------------------------------------- Unique category_-----------------------------------------
unique(df$Category)
unique(df$Product)



# number of unique custumer 

length(
  unique(df$Customer_ID)
)


# ----------------------------------------
# Frequency table 
#-------------------------------

table(df$Region)
table(df$Category)
table(df$Payment_Mode)

name <- "Tanya"
class(name)

status <- TRUE
class(TRUE)

region_factor <- factor(
  c(
    "North", "South","West", "East"
  )
)
region_factor
class(region_factor)

levels(region_factor)
nlevels(region_factor)
#----------------------------------------------------------------------------------------

# convert region to factor 

df$Region <- as.factor(
  df$Region
)
class(df$Region)
levels(df$Region)

# -----------------------------------------------------------------------
# -------------------------------------------------------------------------------------------

# convert factor to characters

df$Region <- as.character(
  df$Region
)
class(df$Region)
# -----------------------------------------------------------------------------------------------

numbers <- c(
  "111","200", "150"
)
numbers

numbers <-as.numeric(
  numbers
)
class(numbers)

# --------------------------------------------------------------------------------------------------

# convert order date

df$Order_date <- as.Date(
  df$Order_Date
)
class(df$Order_Date)

# ------------------------------------------------------------------------------------------------------
# check for missing 
colSums(
  is.na(df)
)
