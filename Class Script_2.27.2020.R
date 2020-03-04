library(tidyverse)

rm(list=ls())

set.seed(122333221)

N <- 1000
tests <- data.frame(
  id = 1:N, 
  test1 = rnorm(N, 100, 25)
) %>%
  mutate(
    test2 = test 1 +rnorm(N, 5, 5),
    test4 = test2 + rnorm()
  )

