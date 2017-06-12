if (require("ggplot2") == FALSE) {
  install.packages("ggplot2")
  require("ggplot2")
}

library("scales")

data(diamonds)


ggplot(diamonds, aes(x = color, y = price/carat, fill=color)) + 
  geom_boxplot() +
  coord_cartesian(ylim=c(1000, 6000)) +
  scale_y_continuous(labels=dollar) + 
  xlab("Color") + 
  ylab("Price per Carat")