if (require("ggplot2") == FALSE) {
  install.packages("ggplot2")
  require("ggplot2")
}

library("scales")

data(diamonds)


sizes = c(0.1, 0.3, 0.8, 1.01, 1.6, 2.0, 3.0, 5.0)

summary(diamonds$carat)

ggplot(diamonds, aes(x=carat)) + 
  geom_freqpoly(binwidth=0.1, alpha = 0.75) + 
  scale_x_continuous(breaks=sizes, expand = c(0,0)) +
  scale_y_continuous(expand=c(0,0))+
  geom_vline(xintercept = c(0.1, 0.8, 1.6, 2.0, 3.0, 5.0), color = "red", linetype="dashed", alpha = 0.75) +
  geom_vline(xintercept = c(0.3, 1.01), color = "forestgreen", linetype = "twodash") +
  geom_hline(yintercept = 2000, color = "brown", linetype="longdash", alpha = 0.5) + 
  xlab("Carat Size") + ylab("Count")
