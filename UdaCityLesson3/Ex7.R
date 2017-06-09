if (require("ggplot2") == FALSE) {
  install.packages("ggplot2")
  require("ggplot2")
}
if (library("dplyr") == FALSE) {
  install.packages("dplyr")
  require("library")
}

data(diamonds)

diamonds %>%
  group_by(cut) %>%
  summarise(max_price = max(price),
            min_price = min(price),
            median_price = median(price))