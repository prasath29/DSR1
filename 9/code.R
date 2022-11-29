install.packages("arules")
install.packages("arules", repos = "https://mhahsler.r-universe.dev")
library("arules")
data("IncomeESL")
trans <- transactions(IncomeESL)
trans
rules <- apriori(trans, supp = 0.1, conf = 0.9, target = "rules")
inspect(head(rules, n = 3, by = "lift"))
library("tidyverse")
library("arules")
data("IncomeESL")
trans <- IncomeESL %>%
  select(-`ethnic classification`) %>%
  transactions()
rules <- trans %>%
  apriori(supp = 0.1, conf = 0.9, target = "rules", control = list(verbose = FALSE))
rules %>%
  head(n = 3, by = "lift") %>%
  inspect()