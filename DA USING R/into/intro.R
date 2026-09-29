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


median_age <- median(
  df$Customer_Age,
  na.rm = TRUE
)
median_age
# -----------------------------------------------------------------------------

df$Customer_Age[
  is.na(df$Customer_Age)
] <- median_age



sum(is.na(df$Region))


payment_mode <- names(
  sort(
    table(df$Payment_Mode),
    decreasing = TRUE
  )
)[1]


payment_mode

df$Payment_Mode[
  is.na(df$Payment_Mode)
] <- payment_mode


median_discount <- median(
  df$Discount,
  na.rm = TRUE
)
median_discount


df$Discount[
  is.na(df$Discount)
] <- median_discount


sum(is.na(df$Discount))

# -------------------------------------------------------------------------
# count duplicate

sum(
  duplicated(df)
)

# display duplicated rows 

df[
  duplicated(df),
]

# ----------------------------------------------------------------------------------
# remove duplicate
#------------------------------------------------------------------------------------

df <- df[
  !duplicated(df),
]
# check  duplicate again

sum(
  duplicated(df)
)

# ---------------------------------------------------------------------------------------
# load dplyr- For data manipulation. tidyvese, data reshaping

library(dplyr)

# ----------------------------------------------------------------------------------------
df_selected <- df%>%
  select(
    Order_ID,
    Customer_ID,
    Region,
    Category,
    Sales,
    Profit
  )
df_selected


# select a range of column 

df %>%
  select(
    Customer_ID:Profit
  )
# --------------------------------------------------------------------------------------------------
# Remove a column 
# --------------------------------------------------------------------------------------------------

df%>%
  select(
    -Customer_Name
  )

# --------------------------------------------------------------------------------------------------
# 75 Filter profit above 5000

 df %>%
  filter(
    Region == "North"
  )


# --------------------------------------------------------------------------------------------------------
# OR CONDITION
# ---------------------------------------------------------------------------------------------------------

df %>%
  filter(
    Region == "North" |
      Region =="South"
    
  )

# ___________________________________--------------------------------------------------------------------------
# sort sales high to low
# ------------------------------------------------------------------------------------------------------------

df %>%
  arrange(
    desc(Sales)
  )

# -----------------------------------------------------------------------------------------------------------
# 84 Rename a column 

df <- df %>%
  rename(
    Total_Sales = Sales
  )
df

# -----------------------------------------------------------------------------------------------------------------
# create profit margin 
# -----------------------------------------------------------------------------------------------------------------

df <- df %>%
  mutate(
    Profit_Margin =
      (Profit /Total_Sales)*100
  )


# -------------------------------------------------------------------------------------------------------------------
# 
# ------------------------------------------------------------------------------------------------------------------