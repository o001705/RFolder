if (require("ggplot2") == FALSE) {
  install.packages("ggplot2")
  require("ggplot2")
}
library("scales")
library("dplyr")
library("xlsx")

data_mv <- tbl_df(read.xlsx("F:/DataAnalysis/indicator Motor vehicles per 1000 population 20100824.xlsx", sheetName="Data", header=TRUE))

data_mv <- data_mv %>%
  rename(Country = Motor.vehicles..not.2.wheelers..per.1.000.population) %>%
  select(-NA) %>%
  filter((Country != "<NA>") & !(is.na(X2002) 
                                  | is.na(X2003)
                                  | is.na(X2004)
                                  | is.na(X2005)
                                  | is.na(X2006)
                                  | is.na(X2007)))
data_mv
