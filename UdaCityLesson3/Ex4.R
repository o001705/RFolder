if (require("ggplot2") == FALSE) {
  install.packages("ggplot2")
  require("ggplot2")
}

data(diamonds)

lessthan500 <- subset(diamonds, diamonds$price < 500)
nrow(lessthan500)

lessthan250 <- subset(diamonds, diamonds$price < 250)
nrow(lessthan250)

gte15000 <- subset(diamonds, diamonds$price >= 15000)
nrow(gte15000)