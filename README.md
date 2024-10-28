# Hypothesis Testing: Comparing Mean Goals in Men's and Women's FIFA World Cup Matches

This project aims to determine if there is a statistically significant difference in the mean number of goals scored in women's and men's FIFA World Cup matches. Using official match data from FIFA World Cup tournaments since January 1, 2002, we test whether the mean goals scored per match differ between the two categories.

## Project Overview

This analysis applies a hypothesis test to compare the average goals scored in men's and women's matches. Each match is considered independent, and team form is not factored into the analysis. The results of the hypothesis test provide insight into whether there is a significant difference in scoring patterns.

## Hypothesis

- **Null Hypothesis (\(H_0\))**: The mean number of goals scored in women's matches is equal to that in men's matches.
- **Alternative Hypothesis (\(H_1\))**: The mean number of goals scored in women's matches is different from that in men's matches.

The test is conducted with a **10% significance level** (\(\alpha = 0.10\)).

## Methodology

1. **Data Collection**:
   - The dataset includes official FIFA World Cup matches played after January 1, 2002, for both men’s and women’s teams.
   
2. **Data Processing**:
   - For each match, the total goals scored are calculated by summing the home and away scores.

3. **Hypothesis Test**:
   - A statistical test (such as a two-sample t-test or Wilcoxon rank-sum test) is applied to assess if there’s a difference in mean goals scored.

4. **Decision Rule**:
   - The null hypothesis is rejected if the p-value from the test is less than 0.10, indicating a significant difference in means.

## Results

The test results are saved in a data frame called `result_df` with the following columns:
- **p_val**: The calculated p-value.
- **result**: The decision based on the p-value, either "reject" or "fail to reject".

## Requirements

- **Programming Language**: R
- **Libraries**: `tidyverse` for data manipulation
- **Data Source**: FIFA World Cup match data from official datasets

## Usage

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/yourusername/your-repo-name.git


This README provides clear sections for project understanding and usage, formatted for easy reading on GitHub or any markdown viewer. Adjust the repository name and any specific script details as needed.
