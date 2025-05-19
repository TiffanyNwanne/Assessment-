# Clinical Drug Trial Report: Drug Safety Analysis

**Author:** Tiffany Nwanne  
**Date:** 2025-05-16

---

## Executive Summary

This report presents an analysis of a clinical drug trial aimed at evaluating the safety profile of a candidate drug compared to a placebo. Key endpoints include the incidence of adverse effects and their severity.

---

## I. Introduction

### Background

Understanding the safety profile of new pharmaceuticals is essential before clinical approval. This study examines adverse events reported by participants in a randomized trial.

### Objective

To compare the incidence and severity of adverse effects between participants who received the trial drug and those who received a placebo.

---

## II. Methods

### Study Design

This is a two-arm randomized controlled trial comparing a candidate drug with a placebo.

### Participants

Participant-level data includes demographic variables (e.g., sex), treatment group assignment, and outcomes such as number and presence of adverse effects.

### Endpoints

- **Primary:** Incidence of adverse effects (binary)
- **Secondary:** Number of reported adverse effects

### Statistical Methods

- Descriptive statistics and visualization
- Chi-squared test for comparing proportions
- Mann-Whitney U test for severity comparisons

---

## III. Results

### 1. Data Import

Data was imported using R's `readr::read_csv()` from `drug_safety.csv`.

### 2. Baseline Data Exploration

- Structural and summary statistics were assessed.
- Missing data was checked using `colSums(is.na(df))`.

### 3. Data Cleaning

- Unused columns (`wbc`, `rbc`) were dropped.
- Binary outcome `adverse_binary` was created from `adverse_effects`.

### 4. Primary Endpoint: Adverse Effect Rate

- Overall adverse rate was computed using `mean(df$adverse_binary)`.
- Group-specific rates were summarized using `group_by(trx)`.

**Figure 1: Adverse Effect Rate by Treatment Group**  
Bar plot created with `ggplot2`, using `stat_summary(fun = mean)`.

### 5. Secondary Endpoint: Severity of Adverse Effects

**Figure 2: Number of Adverse Effects by Group**  
Boxplot comparison of `num_effects` by treatment group.

### 6. Statistical Testing

#### Chi-squared Test

Tested independence between treatment and adverse effect occurrence.

```r
table1 <- table(df$trx, df$adverse_binary)
chisq.test(table1)
```

#### Mann-Whitney U Test

Compared severity (number of effects) between treatment arms.

```r
wilcox.test(drug, placebo)
```

---

## IV. Discussion

The drug group showed a *[insert interpretation]* difference in adverse effect rate compared to placebo. The Mann-Whitney test results further indicate *[insert direction]* severity.

---

## V. Conclusion

This analysis suggests that the drug is associated with *[insert conclusion: higher/lower/similar]* adverse effects compared to placebo. Further trials with larger samples and longer follow-up are recommended.

---

