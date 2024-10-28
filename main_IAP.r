#import library
library(tidyverse)
library(ggplot2)

# read the women dataframe
women = read.csv("women_results.csv")
# read the women dataframe
men = read.csv("men_results.csv")

#filtering of women data
women = women %>%
filter(as.Date(date) > "2002-01-01",  tournament == "FIFA World Cup") %>%
mutate(total_score = home_score+away_score)
head(women)
#calculation of bin size for women data
bin_women = max(women$total_score) - min(women$total_score) / (1 + 3.3 * log(nrow(women)))
bin_women
#histogram of women
ggplot(women, aes(x = total_score)) + 
geom_histogram(bins = 13, fill = "lightblue", color = "darkblue") +
  ggtitle("Total Goals in Women's FIFA World Cup Matches") +
  xlab("Total Goals") +
  ylab("Frequency")

#filtering of men data
men = men %>%
filter(as.Date(date) > "2002-01-01",  tournament == "FIFA World Cup") %>%
mutate(total_score = home_score+away_score)
head(men)
#calculation of bin size for men data
bin_men = max(men$total_score) - min(men$total_score) / (1 + 3.3 * log(nrow(men)))
bin_men
#histogram of men
ggplot(men, aes(x = total_score), color = red) + 
geom_histogram(bins = 8, fill = "lightcoral", color = "darkred") +
  ggtitle("Total Goals in Men's FIFA World Cup Matches") +
  xlab("Total Goals") +
  ylab("Frequency")

# wilcoxon test for non-parametric two sample test
a = wilcox.test(men$total_score, women$total_score, alternative = "less")

#Creating the result data frame based on the significance level
result = a$p.value
result = ifelse(result <= 0.10, "reject", "fail to reject" )
result_df = data.frame(p_val = a$p.value, result = result) 
result_df
