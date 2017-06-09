if (require("ggplot2") == FALSE) {
  install.packages("ggplot2")
  require("ggplot2")
}

library("scales")

data(diamonds)
# 
ggplot(diamonds,aes(x=price/carat))+
  geom_histogram(color="pink", fill="blue", binwidth=0.05)+
  facet_wrap(~cut,ncol=2, scales="free_y") +
  theme(legend.position="none") +
  scale_x_log10()

# ggplot(diamonds, aes(x = price/carat)) + 
#   geom_histogram(color = "black", fill = "pink", binwidth = .05) + 
#   theme(axis.text.x = element_text(angle = 0)) +
#   scale_x_log10(expression(paste(Log[10], " of Price")),
#                 breaks = trans_breaks("log10", function(x) 10^x),
#                 labels = trans_format("log10", math_format(10^.x))) + 
#   facet_grid(cut~., scale = "free") + ylab("Count")
