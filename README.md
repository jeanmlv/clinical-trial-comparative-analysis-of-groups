# Clinical Trial — Comparative Analysis of Groups

> This project demonstrates how to simulate clinical trial data and perform a basic statistical analysis using R. It includes a descriptive summary (Table 1), a comparison of treatment efficacy, and a logistic regression model to assess adverse events.

## 🎯 Objective

To demonstrate the generation and analysis of simulated clinical data with common statistical methods used in clinical research:
- Descriptive analysis (Table 1)
- Efficacy comparison between treatment groups
- Logistic regression for adverse event risk factors

---

## 🧰 Technologies

- **Language**: R  
- **Main Packages**:  
  - `tidyverse` – Data manipulation  
  - `survival` – Survival analysis support  
  - `broom` – Model tidying  
  - `gtsummary` – Descriptive summary tables  
  - `cardx` – Visual enhancements for tables  
  - `gt` – Custom table formatting  

---

## 📊 Analysis Workflow

1. Simulate patient-level data
2. Create a formatted summary table (Table 1)
3. Perform a Welch's t-test to compare efficacy between groups
4. Run a logistic regression model to assess factors associated with adverse events
5. Calculate and interpret Odds Ratios (ORs)

---

## 📝 Example Output

### 📋 Table 1. Baseline Characteristics of Patients

| **Characteristic**      | **Control N = 43¹**     | **Treatment N = 57¹**    | **p-value²** |
|--------------------------|-------------------------|---------------------------|--------------|
| **Age (years)**          | 49.5 (10.2)             | 49.5 (9.3)                | 0.7          |
| **Sex**                  |                         |                           | 0.3          |
| - Female                 | 21 (48.8%)              | 22 (38.6%)                |              |
| - Male                   | 22 (51.2%)              | 35 (61.4%)                |              |
| **Efficacy Score**       | 64.8 (4.2)              | 71.2 (5.1)                | <0.001       |
| **Adverse Events**       | 13 (30.2%)              | 9 (15.8%)                 | 0.084        |

<sub>¹ Mean (SD) or n (%). ² Wilcoxon rank sum test; Pearson’s Chi-squared test.</sub>
