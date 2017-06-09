if (require("ggplot2") == FALSE) {
  install.packages("ggplot2")
  require("ggplot2")
}

data(diamonds)

qplot(diamonds$price)