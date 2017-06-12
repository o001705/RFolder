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
  group_by(color) %>%
  filter(color == "D" | color == "J") %>%
  summarise(Quartile.25 = quantile(price, 0.25),
            Quartile.75 = quantile(price, 0.75),
            IQR = Quartile.75 - Quartile.25)