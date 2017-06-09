if (require("ggplot2") == FALSE) {
  install.packages("ggplot2")
  require("ggplot2")
}

data(diamonds)

summary(diamonds)
df[sapply(df, is.factor)] 
print("Number of Observations: ")
nrow(diamonds)

print("Number of Variables: ")
ncol(diamonds)

i <- 0;
print("Number of ordered variables")
for (name in sapply(diamonds, class)) {
  if (name[1] == "ordered" & name[2] == "factor"){
    i <- i +1
  }
}
print(i)
