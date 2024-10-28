#import library
library(tidyverse)
library(ggplot2)

# read the women dataframe
women = read.csv("women_results.csv")
# read the women dataframe
men = read.csv("men_results.csv")

#filtering of women data
women = women %>%
filter(as.Date(date) >= "2002-01-01",  tournament == "FIFA World Cup") %>%
mutate(total_score = home_score+away_score)
head(women)
#calculation of bin size for women data using Sturges’ Rule
bin_women = max(women$total_score) - min(women$total_score) / (1 + 3.3 * log(nrow(women)))
bin_women
#histogram of women and bin was specified manually because it can't be fraction
ggplot(women, aes(x = total_score), col = "blue") + 
geom_histogram(bins = 13)

#filtering of men data
men = men %>%
filter(as.Date(date) >= "2002-01-01",  tournament == "FIFA World Cup") %>%
mutate(total_score = home_score+away_score)
head(men)
#calculation of bin size for men data using Sturges’ Rule
bin_men = max(men$total_score) - min(men$total_score) / (1 + 3.3 * log(nrow(men)))
bin_men
#histogram of men and bin was specified manually because it can't be fraction
ggplot(men, aes(x = total_score), col = "blue") + 
geom_histogram(bins = 8)

# wilcoxon test for non-parametric two sample test
a = wilcox.test(men$total_score, women$total_score, alternative = "two.sided")

#Creating the result data frame based on the significance level
result = a$p.value
result = ifelse(result <= 0.10, "reject", "fail to reject" )
result_df = data.frame(p_val = a$p.value, result = result) 
result_df