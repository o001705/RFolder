if (require("ggplot2") == FALSE) {
  install.packages("ggplot2")
  require("ggplot2")
}
library("scales")
library("dplyr")
library("xlsx")
library("reshape2")

data_mv <- tbl_df(read.xlsx("F:/DataAnalysis/indicator Motor vehicles per 1000 population 20100824.xlsx", sheetName="Data", header=TRUE))

data_mv <- data_mv %>%
  rename(Country = Motor.vehicles..not.2.wheelers..per.1.000.population) %>%
  select(-NA) %>%
  filter(!(is.na(X2002) 
              | is.na(X2003)
              | is.na(X2004)
              | is.na(X2005)
              | is.na(X2006)
              | is.na(X2007)))
data_cars <- melt(data_mv, id=c("Country"), value.name="Vehicles", variable.name="Year")
data_cars <- tbl_df(data_cars)
data_cars <- data_cars %>%
  mutate(Year = as.character(Year), # Convert to character
         Year = substr(Year, 2, 5), # Slice out the X, leaving last 4 digits; R added X since initially since column names can't start with numbers.
         Year = as.numeric(Year))   # Cast as numeric

yearStats <- data_cars %>%
  group_by(Year) %>%
  summarise(median = median(Vehicles, na.rm=TRUE),
            mean = mean(Vehicles, na.rm=TRUE),
            lower = min(Vehicles, na.rm=TRUE),
            upper = max(Vehicles, na.rm=TRUE),
            se = sd(Vehicles, na.rm=TRUE)/sqrt(length(Vehicles)),
            avg_upper = mean + (2.101*se),
            avg_lower = mean - (2.101*se),
            quant.25 = quantile(Vehicles, na.rm=TRUE, 0.25),
            quant.75 = quantile(Vehicles, na.rm=TRUE, 0.75))

yearStats <- round(yearStats, 2)


p <- ggplot(yearStats, aes(x=Year, y=median)) + 
  # theme(plot.background = element_blank(),
  #       panel.grid.minor = element_blank(),
  #       panel.grid.major = element_blank(),
  #       panel.border = element_blank(),
  #       panel.background = element_blank(),
  #       axis.ticks = element_blank(),
  #       axis.title = element_blank()) +
  geom_linerange(aes(x=Year, ymin=lower, ymax=upper), colour = "blue", size=5) + 
  geom_linerange(aes(x=Year, ymin=quant.25, ymax=quant.75), colour = "pink", size=5) +
  geom_line(yearStats, mapping=aes(x=Year, y=median, group=1)) +
  geom_vline(xintercept = 2002, colour = "pink", linetype=1, size=1) +
  geom_hline(yintercept=seq(1, 7, 1), color="blue", linetype=1) 

p


