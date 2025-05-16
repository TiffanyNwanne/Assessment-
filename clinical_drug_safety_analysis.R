# Clinical Drug Safety Analysis
# Author: Tiffany Nwanne
# Date: 2025-05-16

# -----------------------------
# 1. Load Required Libraries
# -----------------------------
library(readr)
library(dplyr)
library(ggplot2)

# -----------------------------
# 2. Data Import
# -----------------------------
df <- read_csv("drug_safety.csv")  # Replace with full path if needed

# -----------------------------
# 3. Initial Exploration
# -----------------------------
str(df)
summary(df)
head(df)
colSums(is.na(df))  # Check for missing values

# -----------------------------
# 4. Data Cleaning
# -----------------------------
# Drop unused columns
df <- df %>% select(-wbc, -rbc)

# Create binary outcome variable
df$adverse_binary <- ifelse(df$adverse_effects == "Yes", 1, 0)

# View frequency tables
table(df$sex)
table(df$trx)
table(df$adverse_effects)

# -----------------------------
# 5. Exploratory Data Analysis
# -----------------------------
# Overall adverse rate
overall_rate <- mean(df$adverse_binary)
cat("Overall Adverse Effect Rate:", overall_rate, "\n")

# Adverse rate by treatment group
group_rates <- df %>%
  group_by(trx) %>%
  summarise(adverse_rate = mean(adverse_binary))
print(group_rates)

# -----------------------------
# 6. Visualizations
# -----------------------------

# Adverse Effect Rate by Treatment Group
plot1 <- ggplot(df, aes(x = trx, y = adverse_binary)) +
  stat_summary(fun = mean, geom = "bar", fill = "steelblue") +
  ggtitle("Adverse Effect Rate by Treatment Group") +
  ylab("Proportion with Adverse Effects") +
  xlab("Treatment Group")
print(plot1)

# Number of Adverse Effects by Group
plot2 <- ggplot(df, aes(x = trx, y = num_effects)) +
  geom_boxplot(fill = "lightgreen") +
  ggtitle("Number of Adverse Effects by Group") +
  ylab("Number of Effects") +
  xlab("Treatment Group")
print(plot2)

# -----------------------------
# 7. Statistical Tests
# -----------------------------

# Chi-squared Test for adverse effect incidence
cat("\nChi-squared Test for Adverse Effect Incidence:\n")
table1 <- table(df$trx, df$adverse_binary)
chisq_result <- chisq.test(table1)
print(chisq_result)

# Mann-Whitney U Test for effect severity
cat("\nMann-Whitney U Test for Severity (Number of Effects):\n")
drug <- df$num_effects[df$trx == "Drug"]
placebo <- df$num_effects[df$trx == "Placebo"]
wilcox_result <- wilcox.test(drug, placebo)
print(wilcox_result)

# -----------------------------
# 8. Save Cleaned Data and Plots
# -----------------------------

# Save cleaned dataset
write.csv(df, "cleaned_drug_safety.csv", row.names = FALSE)
saveRDS(df, "cleaned_drug_safety.rds")

# Save plots
ggsave("adverse_rate_by_group.png", plot = plot1, width = 6, height = 4, dpi = 300)
ggsave("effects_by_group_boxplot.png", plot = plot2, width = 6, height = 4, dpi = 300)

# -----------------------------
# 9. Session Info for Reproducibility
# -----------------------------
sessionInfo()
