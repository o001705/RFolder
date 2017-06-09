if (require("ggplot2") == FALSE) {
  install.packages("ggplot2")
  require("ggplot2")
}

library("scales")

data(diamonds)


ggplot(diamonds, aes(x = clarity, y = price, color = cut)) + 
  geom_boxplot() + 
  facet_grid(color~., margins = TRUE) 