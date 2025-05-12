# Assessment of Adverse Drug Reactions in a Controlled Clinical Trial – Xiang Xu

[![Preview Image](https://github.com/TiffanyNwanne/Assessment/Dashboard.png))](https://github.com/TiffanyNwanne/Assessment/Dashboard.png)

---

## **1. Project Background**

Xiang Xu, a pharmaceutical company, has completed a randomized controlled clinical trial for a new drug and has provided access to its anonymized dataset to our non-profit organization, which is dedicated to drug safety. Our objective is to assess whether the treatment is associated with a higher incidence of adverse effects compared to a placebo, ensuring transparency and safety oversight.

---

## **2. Executive Summary**

This analysis examined whether the drug group in the clinical trial experienced significantly more adverse reactions than the placebo group. A total of 1,536 individuals (9.5%) experienced at least one adverse effect. Importantly, both the drug and placebo groups showed nearly identical adverse event rates (9.5%), and statistical testing using the Chi-square test and Mann-Whitney U test confirmed that these differences were **not statistically significant**. Thus, there is no evidence from this trial that the drug causes more adverse effects than the placebo.

---

## **3. Dataset Description**

The dataset includes 16,103 rows with the following relevant variables:

- `age`: Age of the participant
- `sex`: Gender
- `trx`: Treatment group (Drug or Placebo)
- `week`: Week of the trial
- `wbc`, `rbc`: Lab measures (with missing values)
- `adverse_effects`: Indicator of whether any adverse effect occurred (Yes/No)
- `num_effects`: Count of adverse effects for an individual

For this analysis, focus was placed solely on adverse effects and treatment assignment.

---

## **4. Methodology**

### **4.1 Data Cleaning**

- Columns `wbc` and `rbc`, which had substantial missing values, were removed from the analysis to maintain focus on adverse effects.
- A binary column `adverse_binary` was created from `adverse_effects` to facilitate numerical analysis (`Yes` = 1, `No` = 0).

### **4.2 Data Exploration**

- **Total with adverse effects**: 1,536 out of 16,103 (9.5%)
- **Adverse effect rate by group**:
    - Drug group: 9.55%
    - Placebo group: 9.52%

### **4.3 Statistical Analysis**

- **Chi-square test of independence**:
    - χ² ≈ 0.00028, **p-value ≈ 0.987**
    - Interpretation: No significant association between treatment and adverse effects.
- **Mann-Whitney U test** on `num_effects`:
    - U ≈ 28,844,703, **p-value ≈ 0.941**
    - Interpretation: No significant difference in the number of adverse effects between groups.

---

## **5. Recommendations**

1. **No Evidence of Increased Risk**: Based on this trial, the drug does not show a higher rate or severity of adverse reactions compared to placebo.
2. **Maintain Monitoring**: Continue to monitor safety during post-marketing or larger trials.
3. **Improve Lab Data Completeness**: Consider enhancing lab data completeness (e.g., WBC/RBC) to support broader safety evaluations in future studies.
4. **Further Subgroup Analysis** *(optional)*: While no overall difference was found, exploring subgroup effects (e.g., by age or sex) may still be valuable.
