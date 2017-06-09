if (require("ggplot2") == FALSE) {
  install.packages("ggplot2")
  require("ggplot2")
}

data(diamonds)

ggplot(diamonds,aes(x=price, 
          binwidth=1000, fill=factor(cut), color=I("pink")))+geom_histogram()+
      facet_wrap(~cut,ncol=2, scales="free_y") +
      theme(legend.position="none")

