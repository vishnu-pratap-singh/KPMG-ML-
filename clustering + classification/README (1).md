# Telecom Customer Churn Analysis

## 1. Project Overview

This project analyzes telecom customer data to understand customer churn, identify factors associated with customers leaving the service, and find opportunities to improve customer retention.

The dataset contains **12,000 customer records** and includes information about customer tenure, contract type, internet service, payment method, charges, support tickets, late payments, data usage, complaints, discounts, satisfaction, and churn status.

> **Target variable:** `churn` — whether a customer has churned (`Yes`) or not (`No`).

## 2. Problem Statement

Customer churn can reduce recurring revenue and increase the cost of acquiring replacement customers. A telecom company needs to understand which customer characteristics and experiences are associated with customers leaving so it can take targeted retention actions.

The problem is to analyze customer, service, billing, usage, and support data to determine **which factors are associated with churn, which customer groups appear more at risk, and what practical actions may help improve retention**. The analysis should use evidence from the dataset rather than assume that any single factor causes churn.

## 3. Project Objectives

1. **Measure churn:** Calculate the overall churn rate and compare churned versus retained customers.
2. **Analyze customer profiles:** Examine churn by tenure, contract type, region, internet service, payment method, and family-plan status.
3. **Investigate billing factors:** Explore whether monthly charges, total charges, discounts, late payments, and autopay status differ between churned and retained customers.
4. **Evaluate service experience:** Study the relationship between support tickets, complaints, and satisfaction scores and customer churn.
5. **Understand usage patterns:** Examine monthly data usage and data overage frequency in relation to churn.
6. **Identify high-risk segments:** Find customer groups with comparatively high churn rates that may benefit from further investigation or retention efforts.
7. **Recommend actions:** Translate the findings into practical, data-supported recommendations for customer retention.
8. **Optional predictive extension:** Build and evaluate a churn classification model to estimate churn risk for individual customers, using appropriate validation and performance metrics.

## 4. Research Questions to Answer

### A. Overall churn

1. What percentage of customers have churned?
2. How many customers have churned compared with those who have stayed?
3. Is the target variable imbalanced, and how should that affect analysis or predictive modelling?

### B. Customer and contract characteristics

4. Which contract type has the highest churn rate: month-to-month, one-year, or two-year?
5. How does customer tenure relate to churn?
6. Do churn rates vary across regions?
7. Does churn differ by internet service type?
8. Are customers on family plans more or less likely to churn?

### C. Billing and payment behaviour

9. Is churn associated with higher or lower monthly charges?
10. How do total charges differ between churned and retained customers, taking tenure into account where appropriate?
11. Which payment methods are associated with the highest churn rates?
12. Are customers without autopay more likely to churn?
13. Is the frequency of late payments associated with churn?
14. Do discount levels appear to differ between churned and retained customers?

### D. Service experience and satisfaction

15. Do customers with more support tickets in the last 90 days have higher churn rates?
16. Is the number of complaints in the last six months associated with churn?
17. How does the satisfaction score relate to churn?
18. Which service-experience indicators show the strongest association with churn?

### E. Usage and overages

19. Does monthly data usage differ between churned and retained customers?
20. Are customers with more data overages in the last six months more likely to churn?
21. Do usage and overage patterns vary by internet service type?

### F. Business recommendations and prediction

22. Which customer segments should the company investigate first for retention opportunities?
23. What actions could the company test—for example, contract options, support follow-ups, billing assistance, or service-experience improvements?
24. If a predictive model is developed, how accurately can it identify customers at risk of churn?
25. Which evaluation metrics are most useful for this problem, such as precision, recall, F1-score, ROC-AUC, and the confusion matrix?
26. How could the company use churn-risk predictions responsibly without treating predictions as proof that a customer will leave?

## 5. Dataset Dictionary

| Column | Description |
|---|---|
| `customer_id` | Unique customer identifier |
| `tenure_months` | Length of time as a customer, in months |
| `contract_type` | Contract duration/type |
| `internet_service` | Internet service category |
| `payment_method` | Customer payment method |
| `region` | Customer region |
| `monthly_charges_inr` | Monthly charges in INR |
| `total_charges_inr` | Total charges in INR |
| `support_tickets_90d` | Support tickets in the last 90 days |
| `late_payments_6m` | Late payments in the last six months |
| `monthly_usage_gb` | Monthly data usage in GB |
| `data_overage_count_6m` | Data overage count in the last six months |
| `complaints_6m` | Complaints in the last six months |
| `discount_pct` | Discount percentage |
| `satisfaction_score_1_10` | Customer satisfaction score on a 1–10 scale |
| `autopay_enabled` | Whether automatic payment is enabled |
| `family_plan` | Whether the customer has a family plan |
| `churn` | Whether the customer has churned (`Yes`/`No`) |

## 6. Suggested Analysis Workflow

1. **Load and inspect the data:** Check shape, data types, duplicates, missing values, and category values.
2. **Clean the data:** Handle missing or inconsistent values and verify numeric ranges.
3. **Perform exploratory data analysis (EDA):** Calculate churn rate and create charts for the questions above.
4. **Compare churn segments:** Use churn rates and descriptive statistics; avoid relying only on raw counts when group sizes differ.
5. **Test relevant relationships:** Where appropriate, use statistical tests such as chi-square tests for categorical variables and suitable tests for numeric variables. Check assumptions and report effect sizes where possible.
6. **Summarize findings:** Identify the strongest observed associations and any limitations.
7. **Make recommendations:** Suggest actions that could be tested and measured.
8. **Optional modelling:** Split data into training and test sets, prevent data leakage, compare a baseline with suitable models, and evaluate recall, precision, F1-score, ROC-AUC, and the confusion matrix.

## 7. Expected Deliverables

- A cleaned dataset or reproducible data-cleaning notebook.
- An exploratory analysis with charts and summary tables.
- Answers to the research questions, supported by evidence.
- A short list of actionable customer-retention recommendations.
- Optional: a validated churn prediction model and a clear explanation of its limitations.

## 8. Important Notes and Limitations

- This dataset shows associations; observational analysis alone cannot prove that a factor causes churn.
- Check missing values before analysis, especially in `payment_method`.
- Compare **churn rates** rather than only customer counts when evaluating categories of different sizes.
- `total_charges_inr` is likely related to tenure, so interpret it alongside `tenure_months`.
- If building a model, exclude `customer_id` as a predictive feature unless there is a justified, non-leaking reason to use it.
- Treat any risk score as a decision-support signal, not a certainty. Validate retention strategies with controlled tests where feasible.

## 9. Tools

Suggested tools: **Python, Pandas, NumPy, Matplotlib/Seaborn, and scikit-learn**. The project can also be extended into a Power BI or Tableau dashboard.
