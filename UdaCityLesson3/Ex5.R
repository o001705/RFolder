if (require("ggplot2") == FALSE) {
  install.packages("ggplot2")
  require("ggplot2")
}

data(diamonds)

summary(diamonds$price)

qplot(diamonds$price, xlim=c(300, 18900), 
      ylim=c(0, 5500), binwidth=1000,
      colour=I("blue"), fill=I("pink"))
