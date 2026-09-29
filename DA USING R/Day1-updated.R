


# ------------------------------------------------------------
# 1. CHECK R VERSION
# ------------------------------------------------------------

R.version.string

sessionInfo()


# ------------------------------------------------------------
# 2. INSTALL PACKAGES
# Run install.packages() only once if packages are not installed
# ------------------------------------------------------------

install.packages("tidyverse")
install.packages("readxl")
install.packages("writexl")

library(tidyverse)
library(readxl)
library(writexl)


# ------------------------------------------------------------
# 3. CHECK WORKING DIRECTORY
# ------------------------------------------------------------

getwd()

list.files()


# ------------------------------------------------------------
# 4. SET WORKING DIRECTORY
# Change this path according to your computer
# ------------------------------------------------------------

# setwd("C:/Users/Tanaya/Documents")

getwd()


# ------------------------------------------------------------
# 5. CREATE SIMPLE OBJECTS
# ------------------------------------------------------------

sales_amount <- 50000

cost <- 35000

profit <- sales_amount - cost

sales_amount
cost
profit


# ------------------------------------------------------------
# 6. BASIC CALCULATIONS
# ------------------------------------------------------------

sales_amount + cost

sales_amount - cost

sales_amount * 2

sales_amount / 2


# ------------------------------------------------------------
# 7. CREATE A NUMERIC VECTOR
# ------------------------------------------------------------

sales <- c(
  1000,
  1500,
  1200,
  1800,
  2000
)

sales


# ------------------------------------------------------------
# 8. VECTOR CALCULATIONS
# ------------------------------------------------------------

mean(sales)

sum(sales)

min(sales)

max(sales)

sd(sales)


# ------------------------------------------------------------
# 9. CHARACTER VECTOR
# ------------------------------------------------------------

regions <- c(
  "North",
  "South",
  "East",
  "West"
)

regions


# ------------------------------------------------------------
# 10. ACCESS VECTOR ELEMENTS
# ------------------------------------------------------------

regions[1]

regions[2]

regions[2:3]

regions[c(1,4)]


# ------------------------------------------------------------
# 11. LOGICAL FILTERING OF VECTOR
# ------------------------------------------------------------

sales > 1500

sales[sales > 1500]


# ------------------------------------------------------------
# 12. MATRIX
# ------------------------------------------------------------

sales_matrix <- matrix(
  c(
    1000,
    1500,
    1200,
    1800,
    2000,
    2500
  ),
  nrow = 2,
  byrow = TRUE
)

sales_matrix


# ------------------------------------------------------------
# 13. ACCESS MATRIX
# ------------------------------------------------------------
sales_matrix[2,2]

sales_matrix[1,1]

sales_matrix[1,]

sales_matrix[,2]


# ------------------------------------------------------------
# 14. MATRIX CALCULATIONS
# ------------------------------------------------------------

rowSums(sales_matrix)

colSums(sales_matrix)


# ------------------------------------------------------------
# 15. CREATE A DATA FRAME
# ------------------------------------------------------------

small_sales <- data.frame(
  Customer = c(
    "A",
    "B",
    "C",
    "D"
  ),
  
  Region = c(
    "North",
    "South",
    "North",
    "West"
  ),
  
  Sales = c(
    1000,
    1500,
    1200,
    2000
  ),
  
  Profit = c(
    200,
    300,
    250,
    450
  )
)

small_sales


# ------------------------------------------------------------
# 16. CHECK DATA FRAME TYPE
# ------------------------------------------------------------

class(small_sales)

str(small_sales)


# ------------------------------------------------------------
# 17. ACCESS DATA FRAME COLUMNS
# ------------------------------------------------------------

small_sales$Sales

small_sales$Region

small_sales["Sales"]

small_sales[["Sales"]]


# ------------------------------------------------------------
# 18. ACCESS ROWS
# ------------------------------------------------------------

small_sales[1,]

small_sales[1:3,]


# ------------------------------------------------------------
# 19. ACCESS A SPECIFIC CELL
# ------------------------------------------------------------

small_sales[2,3]


# ------------------------------------------------------------
# 20. MODIFY DATA
# ------------------------------------------------------------

small_sales$Sales[1] <- 1200

small_sales


# ------------------------------------------------------------
# 21. CREATE A NEW COLUMN
# ------------------------------------------------------------

small_sales$Profit_Margin <-
  small_sales$Profit /
  small_sales$Sales

small_sales


# ============================================================
# HOUR 2
# IMPORTING AND INSPECTING THE REAL SALES DATASET
# ============================================================


# ------------------------------------------------------------
# 22. IMPORT CSV
# ------------------------------------------------------------
getwd()

setwd("C:/Users/Tanaya/Desktop/KPMG/Study Material/September 2026/Parul University/DA using R & Python/Datasets")

getwd()

df <- read_xlsx(
  "Sales_Data.xlsx"
)


# ------------------------------------------------------------
# 23. VIEW DATA
# ------------------------------------------------------------

df

# ------------------------------------------------------------
# 24. FIRST 6 ROWS
# ------------------------------------------------------------

head(df)


# ------------------------------------------------------------
# 25. FIRST 10 ROWS
# ------------------------------------------------------------

head(df, 10)


# ------------------------------------------------------------
# 26. LAST 6 ROWS
# ------------------------------------------------------------

tail(df)


# ------------------------------------------------------------
# 27. NUMBER OF ROWS
# ------------------------------------------------------------

nrow(df)


# ------------------------------------------------------------
# 28. NUMBER OF COLUMNS
# ------------------------------------------------------------
ncol(df)
# ------------------------------------------------------------
# 29. ROWS AND COLUMNS TOGETHER
# ------------------------------------------------------------

dim(df)


# ------------------------------------------------------------
# 30. COLUMN NAMES
# ------------------------------------------------------------

names(df)
colnames(df)


# ------------------------------------------------------------
# 31. STRUCTURE OF DATASET
# ------------------------------------------------------------

str(df)

# ------------------------------------------------------------
# 32. SUMMARY STATISTICS
# ------------------------------------------------------------

summary(df)


# ------------------------------------------------------------
# 33. GLIMPSE
# ------------------------------------------------------------

glimpse(df)


# ------------------------------------------------------------
# 34. CHECK DATA TYPES
# ------------------------------------------------------------

class(df$Sales)

class(df$Region)

class(df$Customer_Name)

class(df$Customer_Age)

class(df$Order_Date)


# ------------------------------------------------------------
# 35. UNIQUE REGIONS
# ------------------------------------------------------------

unique(df$Region)
unique(df$Product)

# ------------------------------------------------------------
# 36. UNIQUE CATEGORIES
# ------------------------------------------------------------
unique(df$Category)
# ------------------------------------------------------------
# 37. UNIQUE PRODUCTS
# ------------------------------------------------------------
unique(df$Product)
# ------------------------------------------------------------
# 38. NUMBER OF UNIQUE CUSTOMERS
# ------------------------------------------------------------
length(
  unique(df$Customer_ID)
)
# ------------------------------------------------------------
# 39. FREQUENCY TABLE
# ------------------------------------------------------------

table(df$Region)

table(df$Category)

table(df$Payment_Mode)


# ------------------------------------------------------------
# 40. IMPORT EXCEL
# This is optional if students also want to practice Excel
# ------------------------------------------------------------

# excel_df <- read_excel(
#   "Sales_Data_1200_R_Practical.xlsx"
# )

# head(excel_df)

# str(excel_df)


# ------------------------------------------------------------
# 41. LIST SHEETS IN EXCEL FILE
# ------------------------------------------------------------

# excel_sheets(
#   "Sales_Data_1200_R_Practical.xlsx"
# )


# ------------------------------------------------------------
# 42. EXPORT CURRENT DATASET TO CSV
# ------------------------------------------------------------

write.csv(
  df,
  "Sales_Data_Export.csv",
  row.names = FALSE
)


# ------------------------------------------------------------
# 43. EXPORT CURRENT DATASET TO EXCEL
# ------------------------------------------------------------

write_xlsx(
  df,
  "Sales_Data_Export.xlsx"
)


# ============================================================
# HOUR 3
# DATA TYPES, FACTORS, MISSING VALUES & DUPLICATES
# ============================================================


# ------------------------------------------------------------
# 44. BASIC DATA TYPES
# ------------------------------------------------------------

x <- 100
class(x)



name <- "Tanaya"
class(name)


status <- TRUE
class(status)


# ------------------------------------------------------------
# 45. FACTOR
# ------------------------------------------------------------

region_factor <- factor(
  c(
    "North",
    "South",
    "North",
    "West"
  )
)

region_factor

class(region_factor)

levels(region_factor)

nlevels(region_factor)


# ------------------------------------------------------------
# 46. CONVERT REGION TO FACTOR
# ------------------------------------------------------------

class(df$Region)
df$Region <- as.factor(
  df$Region
)

class(df$Region)

levels(df$Region)


# ------------------------------------------------------------
# 47. CONVERT FACTOR TO CHARACTER
# ------------------------------------------------------------

df$Region <- as.character(
  df$Region
)

class(df$Region)


# ------------------------------------------------------------
# 48. NUMERIC CONVERSION
# ------------------------------------------------------------

numbers <- c(
  "100",
  "200",
  "300"
)

class(numbers)

numbers <- as.numeric(
  numbers
)

numbers

class(numbers)


# ------------------------------------------------------------
# 49. CONVERT ORDER DATE
# ------------------------------------------------------------

df$Order_Date <- as.Date(
  df$Order_Date
)

class(df$Order_Date)


# ------------------------------------------------------------
# 50. CHECK FOR MISSING VALUES
# ------------------------------------------------------------

is.na(df)


# ------------------------------------------------------------
# 51. TOTAL NUMBER OF MISSING VALUES
# ------------------------------------------------------------

sum(
  is.na(df)
)
getwd()
setwd("C:/Users/Tanaya/Desktop/KPMG/Study Material/September 2026/Parul University/DA using R & Python/Datasets")
# ------------------------------------------------------------
# 52. MISSING VALUES BY COLUMN
# ------------------------------------------------------------

colSums(
  is.na(df)
)


# ------------------------------------------------------------
# 53. PERCENTAGE OF MISSING VALUES
# ------------------------------------------------------------

colMeans(
  is.na(df)
) * 100


# ------------------------------------------------------------
# 55. COUNT COMPLETE ROWS
# ------------------------------------------------------------

sum(
  complete.cases(df)
)


# ------------------------------------------------------------
# 57. IMPUTE MISSING CUSTOMER AGE WITH MEDIAN
# ------------------------------------------------------------

median_age <- median(
  df$Customer_Age,
  na.rm = TRUE
)

median_age


df$Customer_Age[
  is.na(df$Customer_Age)
] <- median_age


# ------------------------------------------------------------
# 58. CHECK CUSTOMER AGE AGAIN
# ------------------------------------------------------------

sum(
  is.na(df$Customer_Age)
)


# ------------------------------------------------------------
# 59. FIND MOST COMMON REGION
# ------------------------------------------------------------

region_mode <- names(
  sort(
    table(df$Region),
    decreasing = TRUE
  )
)[1]

region_mode


# ------------------------------------------------------------
# 60. REPLACE MISSING REGION
# ------------------------------------------------------------

df$Region[
  is.na(df$Region)
] <- region_mode


# ------------------------------------------------------------
# 61. FIND MOST COMMON PAYMENT MODE
# ------------------------------------------------------------

payment_mode <- names(
  sort(
    table(df$Payment_Mode),
    decreasing = TRUE
  )
)[1]

payment_mode


# ------------------------------------------------------------
# 62. REPLACE MISSING PAYMENT MODE
# ------------------------------------------------------------

df$Payment_Mode[
  is.na(df$Payment_Mode)
] <- payment_mode


# ------------------------------------------------------------
# 63. REPLACE MISSING DISCOUNT WITH MEDIAN
# ------------------------------------------------------------

median_discount <- median(
  df$Discount,
  na.rm = TRUE
)

df$Discount[
  is.na(df$Discount)
] <- median_discount


# ------------------------------------------------------------
# 64. CHECK MISSING VALUES AFTER CLEANING
# ------------------------------------------------------------

colSums(
  is.na(df)
)


# ------------------------------------------------------------
# 65. CHECK DUPLICATES
# ------------------------------------------------------------

duplicated(df)


# ------------------------------------------------------------
# 66. COUNT DUPLICATES
# ------------------------------------------------------------

sum(
  duplicated(df)
)


# ------------------------------------------------------------
# 67. DISPLAY DUPLICATE ROWS
# ------------------------------------------------------------

df[
  duplicated(df),
]


# ------------------------------------------------------------
# 68. REMOVE DUPLICATES
# ------------------------------------------------------------

df <- df[
  !duplicated(df),
]


# ------------------------------------------------------------
# 69. CHECK DUPLICATES AGAIN
# ------------------------------------------------------------

sum(
  duplicated(df)
)

# ------------------------------------------------------------
# 70. LOAD dplyr -  For data manipulation , tidyverse -Data Reshaping
# ------------------------------------------------------------

library(dplyr)


# ------------------------------------------------------------
# 71. SELECT COLUMNS
# ------------------------------------------------------------

df_selected <- df %>%
  select(
    Order_ID,
    Customer_ID,
    Region,
    Category,
    Sales,
    Profit
  )

df_selected


# ------------------------------------------------------------
# 72. SELECT A RANGE OF COLUMNS
# ------------------------------------------------------------

df %>%
  select(
    Customer_ID:Profit
  )


# ------------------------------------------------------------
# 73. REMOVE A COLUMN
# ------------------------------------------------------------

df %>%
  select(
    -Customer_Name
  )


# ------------------------------------------------------------
# 74. FILTER SALES ABOVE 10,000
# ------------------------------------------------------------

df %>%
  filter(
    Sales > 10000
  )


# ------------------------------------------------------------
# 75. FILTER PROFIT ABOVE 5,000
# ------------------------------------------------------------

df %>%
  filter(
    Profit > 5000
  )


# ------------------------------------------------------------
# 76. FILTER NORTH REGION
# ------------------------------------------------------------

df %>%
  filter(
    Region == "North"
  )


# ------------------------------------------------------------
# 77. FILTER ELECTRONICS
# ------------------------------------------------------------

df %>%
  filter(
    Category == "Electronics"
  )


# ------------------------------------------------------------
# 78. MULTIPLE CONDITIONS
# AND CONDITION
# ------------------------------------------------------------

df %>%
  filter(
    Sales > 10000,
    Profit > 3000
  )


# ------------------------------------------------------------
# 79. OR CONDITION
# ------------------------------------------------------------

df %>%
  filter(
    Region == "North" |
      Region == "South"
  )


# ------------------------------------------------------------
# 80. HIGH-VALUE TRANSACTIONS
# ------------------------------------------------------------

df %>%
  filter(
    Sales > 50000
  )


# ------------------------------------------------------------
# 81. SORT SALES
# LOW TO HIGH
# ------------------------------------------------------------

df %>%
  arrange(
    Sales
  )


# ------------------------------------------------------------
# 82. SORT SALES
# HIGH TO LOW
# ------------------------------------------------------------

df %>%
  arrange(
    desc(Sales)
  )


# ------------------------------------------------------------
# 83. SORT BY REGION AND SALES
# ------------------------------------------------------------

df %>%
  arrange(
    Region,
    desc(Sales)
  )


# ------------------------------------------------------------
# 84. RENAME A COLUMN
# ------------------------------------------------------------

df <- df %>%
  rename(
    Total_Sales = Sales
  )


# ------------------------------------------------------------
# 85. RENAME IT BACK
# This keeps the remaining exercises consistent
# ------------------------------------------------------------

df <- df %>%
  rename(
    Sales = Total_Sales
  )


# ------------------------------------------------------------
# 86. DISTINCT CUSTOMERS
# ------------------------------------------------------------

df %>%
  distinct(
    Customer_ID
  )



# ------------------------------------------------------------
# 88. DISTINCT CUSTOMER + REGION
# ------------------------------------------------------------

df %>%
  distinct(
    Customer_ID,
    Region
  )


# ------------------------------------------------------------
# 89. CREATE PROFIT MARGIN
# ------------------------------------------------------------

df <- df %>%
  mutate(
    Profit_Margin =
      (Profit / Sales) * 100
  )


# ------------------------------------------------------------
# 90. VIEW PROFIT MARGIN
# ------------------------------------------------------------

df %>%
  select(
    Order_ID,
    Sales,
    Profit,
    Profit_Margin
  ) %>%
  head(10)


# ------------------------------------------------------------
# 91. REVENUE PER UNIT
# ------------------------------------------------------------

df <- df %>%
  mutate(
    Revenue_Per_Unit =
      Sales / Quantity
  )


# ------------------------------------------------------------
# 92. DISCOUNT AMOUNT
# ------------------------------------------------------------

df <- df %>%
  mutate(
    Discount_Amount =
      Sales * Discount
  )


# ------------------------------------------------------------
# 93. CREATE CUSTOMER SEGMENTS
# ------------------------------------------------------------

df <- df %>%
  mutate(
    Customer_Segment = case_when(
      
      Sales >= 50000 ~
        "High Value",
      
      Sales >= 20000 ~
        "Medium Value",
      
      TRUE ~
        "Low Value"
    )
  )


# ------------------------------------------------------------
# 94. CHECK CUSTOMER SEGMENTS
# ------------------------------------------------------------

table(
  df$Customer_Segment
)


# ------------------------------------------------------------
# 95. CREATE PROFIT CATEGORY
# ------------------------------------------------------------

df <- df %>%
  mutate(
    Profit_Category = case_when(
      
      Profit < 0 ~
        "Loss",
      
      Profit < 5000 ~
        "Low Profit",
      
      Profit < 10000 ~
        "Medium Profit",
      
      TRUE ~
        "High Profit"
    )
  )


# ------------------------------------------------------------
# 96. CHECK PROFIT CATEGORY
# ------------------------------------------------------------

table(
  df$Profit_Category
)


# ------------------------------------------------------------
# 97. CREATE MONTH
# ------------------------------------------------------------

df <- df %>%
  mutate(
    Month =
      format(
        Order_Date,
        "%B"
      )
  )


# ------------------------------------------------------------
# 98. CREATE YEAR
# ------------------------------------------------------------

df <- df %>%
  mutate(
    Year =
      format(
        Order_Date,
        "%Y"
      )
  )


# ------------------------------------------------------------
# 99. CREATE QUARTER
# ------------------------------------------------------------

df <- df %>%
  mutate(
    Quarter =
      paste0(
        "Q",
        ceiling(
          as.numeric(
            format(
              Order_Date,
              "%m"
            )
          ) / 3
        )
      )
  )


# ------------------------------------------------------------
# 100. VIEW NEW FEATURES
# ------------------------------------------------------------

df %>%
  select(
    Order_ID,
    Order_Date,
    Sales,
    Profit,
    Profit_Margin,
    Revenue_Per_Unit,
    Customer_Segment,
    Profit_Category,
    Month,
    Quarter
  ) %>%
  head(10)


# ------------------------------------------------------------
# 101. COMBINE FILTER + MUTATE + SELECT
# ------------------------------------------------------------

high_value_orders <- df %>%
  
  filter(
    Sales > 20000
  ) %>%
  
  mutate(
    Profit_Percentage =
      (Profit / Sales) * 100
  ) %>%
  
  select(
    Order_ID,
    Customer_ID,
    Sales,
    Profit,
    Profit_Percentage
  )

high_value_orders



# ------------------------------------------------------------
# 106. MULTIPLE BUSINESS KPIs
# ------------------------------------------------------------

df %>%
  summarise(
    
    Total_Sales =
      sum(
        Sales,
        na.rm = TRUE
      ),
    
    Average_Sales =
      mean(
        Sales,
        na.rm = TRUE
      ),
    
    Total_Profit =
      sum(
        Profit,
        na.rm = TRUE
      ),
    
    Average_Profit =
      mean(
        Profit,
        na.rm = TRUE
      ),
    
    Total_Quantity =
      sum(
        Quantity,
        na.rm = TRUE
      ),
    
    Number_of_Orders =
      n()
  )


# ------------------------------------------------------------
# 107. SALES BY REGION
# ------------------------------------------------------------

region_analysis <- df %>%
  group_by(
    Region
  ) %>%
  summarise(
    Total_Sales =
      sum(
        Sales,
        na.rm = TRUE
      )
  )

region_analysis


# ------------------------------------------------------------
# 108. PROFIT BY REGION
# ------------------------------------------------------------

df %>%
  group_by(
    Region
  ) %>%
  summarise(
    Total_Profit =
      sum(
        Profit,
        na.rm = TRUE
      )
  )


# ------------------------------------------------------------
# 109. REGION-WISE BUSINESS ANALYSIS
# ------------------------------------------------------------

region_analysis <- df %>%
  
  group_by(
    Region
  ) %>%
  
  summarise(
    
    Total_Sales =
      sum(
        Sales,
        na.rm = TRUE
      ),
    
    Average_Sales =
      mean(
        Sales,
        na.rm = TRUE
      ),
    
    Total_Profit =
      sum(
        Profit,
        na.rm = TRUE
      ),
    
    Average_Profit =
      mean(
        Profit,
        na.rm = TRUE
      ),
    
    Transactions =
      n(),
    
    .groups = "drop"
  )

region_analysis


# ------------------------------------------------------------
# 110. CATEGORY ANALYSIS
# ------------------------------------------------------------

category_analysis <- df %>%
  
  group_by(
    Category
  ) %>%
  
  summarise(
    
    Total_Sales =
      sum(
        Sales,
        na.rm = TRUE
      ),
    
    Total_Profit =
      sum(
        Profit,
        na.rm = TRUE
      ),
    
    Quantity_Sold =
      sum(
        Quantity,
        na.rm = TRUE
      ),
    
    Transactions =
      n(),
    
    .groups = "drop"
  )

category_analysis


# ------------------------------------------------------------
# 111. CATEGORY PROFIT MARGIN
# ------------------------------------------------------------

category_analysis <- category_analysis %>%
  
  mutate(
    Profit_Margin =
      (Total_Profit /
         Total_Sales) * 100
  )

category_analysis


# ------------------------------------------------------------
# 112. REGION + CATEGORY ANALYSIS
# ------------------------------------------------------------

df %>%
  
  group_by(
    Region,
    Category
  ) %>%
  
  summarise(
    
    Total_Sales =
      sum(
        Sales,
        na.rm = TRUE
      ),
    
    Total_Profit =
      sum(
        Profit,
        na.rm = TRUE
      ),
    
    Transactions =
      n(),
    
    .groups = "drop"
  )


# ------------------------------------------------------------
# 113. TOP 10 PRODUCTS BY SALES
# ------------------------------------------------------------

top_products <- df %>%
  
  group_by(
    Product
  ) %>%
  
  summarise(
    Total_Sales =
      sum(
        Sales,
        na.rm = TRUE
      ),
    
    .groups = "drop"
  ) %>%
  
  arrange(
    desc(Total_Sales)
  ) %>%
  
  slice_head(
    n = 10
  )

top_products


# ------------------------------------------------------------
# 114. TOP 10 CUSTOMERS
# ------------------------------------------------------------

top_customers <- df %>%
  
  group_by(
    Customer_ID
  ) %>%
  
  summarise(
    
    Total_Sales =
      sum(
        Sales,
        na.rm = TRUE
      ),
    
    Total_Profit =
      sum(
        Profit,
        na.rm = TRUE
      ),
    
    Orders =
      n(),
    
    .groups = "drop"
  ) %>%
  
  arrange(
    desc(Total_Sales)
  ) %>%
  
  slice_head(
    n = 10
  )

top_customers


# ------------------------------------------------------------
# 115. LOSS-MAKING CUSTOMERS
# ------------------------------------------------------------

loss_customers <- df %>%
  
  group_by(
    Customer_ID
  ) %>%
  
  summarise(
    
    Total_Sales =
      sum(
        Sales,
        na.rm = TRUE
      ),
    
    Total_Profit =
      sum(
        Profit,
        na.rm = TRUE
      ),
    
    .groups = "drop"
  ) %>%
  
  filter(
    Total_Profit < 0
  ) %>%
  
  arrange(
    Total_Profit
  )

loss_customers


# ------------------------------------------------------------
# 116. AVERAGE DISCOUNT BY CATEGORY
# ------------------------------------------------------------

df %>%
  
  group_by(
    Category
  ) %>%
  
  summarise(
    Average_Discount =
      mean(
        Discount,
        na.rm = TRUE
      )
  ) %>%
  
  arrange(
    desc(Average_Discount)
  )


# ------------------------------------------------------------
# 117. PROFIT BY PAYMENT MODE
# ------------------------------------------------------------

df %>%
  
  group_by(
    Payment_Mode
  ) %>%
  
  summarise(
    
    Total_Sales =
      sum(
        Sales,
        na.rm = TRUE
      ),
    
    Total_Profit =
      sum(
        Profit,
        na.rm = TRUE
      ),
    
    Orders =
      n(),
    
    .groups = "drop"
  ) %>%
  
  arrange(
    desc(Total_Profit)
  )


# ------------------------------------------------------------
# 118. MONTHLY SALES
# ------------------------------------------------------------

monthly_sales <- df %>%
  
  group_by(
    Year,
    Month
  ) %>%
  
  summarise(
    
    Total_Sales =
      sum(
        Sales,
        na.rm = TRUE
      ),
    
    Total_Profit =
      sum(
        Profit,
        na.rm = TRUE
      ),
    
    .groups = "drop"
  )

monthly_sales


# ------------------------------------------------------------
# 119. QUARTERLY ANALYSIS
# ------------------------------------------------------------

df %>%
  
  group_by(
    Quarter
  ) %>%
  
  summarise(
    
    Total_Sales =
      sum(
        Sales,
        na.rm = TRUE
      ),
    
    Total_Profit =
      sum(
        Profit,
        na.rm = TRUE
      ),
    
    .groups = "drop"
  ) %>%
  
  arrange(
    Quarter
  )


# ------------------------------------------------------------
# 120. AVERAGE ORDER VALUE
# ------------------------------------------------------------

df %>%
  summarise(
    Average_Order_Value =
      mean(
        Sales,
        na.rm = TRUE
      )
  )


# ------------------------------------------------------------
# 121. NUMBER OF ORDERS BY REGION
# ------------------------------------------------------------

df %>%
  
  group_by(
    Region
  ) %>%
  
  summarise(
    Number_of_Orders =
      n()
  ) %>%
  
  arrange(
    desc(Number_of_Orders)
  )


# ------------------------------------------------------------
# 122. CATEGORY WITH HIGH SALES BUT LOW PROFIT MARGIN
# ------------------------------------------------------------

category_analysis %>%
  
  filter(
    Total_Sales >
      median(
        Total_Sales
      ),
    
    Profit_Margin <
      median(
        Profit_Margin
      )
  )


# ------------------------------------------------------------
# 123. REGION WITH HIGHEST PROFIT
# ------------------------------------------------------------

region_analysis %>%
  
  arrange(
    desc(Total_Profit)
  )


# ------------------------------------------------------------
# 124. TOP REGION BY SALES
# ------------------------------------------------------------

region_analysis %>%
  
  arrange(
    desc(Total_Sales)
  ) %>%
  
  slice_head(
    n = 1
  )


# ------------------------------------------------------------
# 125. HIGH DISCOUNT AND LOW PROFIT ORDERS
# ------------------------------------------------------------

df %>%
  
  filter(
    Discount >= 0.20,
    Profit < 5000
  ) %>%
  
  select(
    Order_ID,
    Category,
    Product,
    Sales,
    Discount,
    Profit
  )


# ------------------------------------------------------------
# 126. CREATE FINAL BUSINESS ANALYSIS
# ------------------------------------------------------------

final_analysis <- df %>%
  
  filter(
    Sales > 0
  ) %>%
  
  mutate(
    
    Profit_Margin =
      (Profit / Sales) * 100,
    
    Revenue_Per_Unit =
      Sales / Quantity
  ) %>%
  
  group_by(
    Category
  ) %>%
  
  summarise(
    
    Total_Sales =
      sum(
        Sales,
        na.rm = TRUE
      ),
    
    Total_Profit =
      sum(
        Profit,
        na.rm = TRUE
      ),
    
    Average_Sales =
      mean(
        Sales,
        na.rm = TRUE
      ),
    
    Average_Profit_Margin =
      mean(
        Profit_Margin,
        na.rm = TRUE
      ),
    
    Total_Quantity =
      sum(
        Quantity,
        na.rm = TRUE
      ),
    
    Number_of_Orders =
      n(),
    
    .groups = "drop"
  ) %>%
  
  arrange(
    desc(Total_Profit)
  )


# ------------------------------------------------------------
# 127. VIEW FINAL ANALYSIS
# ------------------------------------------------------------

final_analysis


# ------------------------------------------------------------
# 128. EXPORT FINAL ANALYSIS TO EXCEL
# ------------------------------------------------------------

write_xlsx(
  final_analysis,
  "Final_Business_Analysis.xlsx"
)


