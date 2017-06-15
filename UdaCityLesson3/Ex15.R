
birthdays <- tbl_df(read.csv("F:/Personal/birthdaysExample.csv"))

tempDates <- mdy(birthdays$dates)

birthdays <- birthdays %>%
  mutate(Birthday = tempDates,
         Year = year(tempDates),
         Month = month(tempDates, label=TRUE, abbr=FALSE),
         Day = day(tempDates),
         Weekday = weekdays(tempDates, abbr=FALSE))


birthdays$Weekday <- factor(birthdays$Weekday, levels=c('Monday', 'Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'), ordered=TRUE)

# ifelse didn't seem to work here for creating 'optional' since the else would create a NULL vector within the function and R complained.
# creates optional ggplot argument only if Day is passed in.
# aes_string takes in a string as the column name for plotting. Perfect for our arguments we pass in as strings.
# Paste our argument in for custom X and Y-axis labeling

makePlots<- function(TimeLength){
  
  optional<- NULL
  if(TimeLength == "Day")  optional<- scale_x_discrete(breaks = seq(1, 31, 1)) 
  
  ggplot(birthdays, aes_string(x = TimeLength, fill = TimeLength)) + 
    geom_histogram(binwidth = 1, color = "black", show_guide = FALSE) + 
    scale_fill_brewer(palette="Paired") + 
    stat_bin(aes(label=..count..), vjust=-.1, 
             geom="text", position="identity", size=3) + 
    xlab(TimeLength)+
    ylab(paste0("Number of Birthdays per ", TimeLength)) + 
    theme_tufte() + 
    optional
  
}

makePlots("Month")
