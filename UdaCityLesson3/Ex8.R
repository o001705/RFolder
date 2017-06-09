if (require("ggplot2") == FALSE) {
  install.packages("ggplot2")
  require("ggplot2")
}

data(diamonds)

qplot(x = price, data = diamonds) + facet_wrap(~cut, scales="free_y")