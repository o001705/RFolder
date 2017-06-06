taex1 <- function(book_index) {
  #############################################################################
  # Exercise 1
  # Create a vector of statements. In order to do that, use those statements
  # of the introduction of the r-exercise “Data Science for Operational
  # Excellence (Part-5)”.
  #############################################################################

  text <- c("Operations need to have demand forecasts in order to establish optimal resource allocation policies. ",
            "But, when we make predictions the only thing that we assure is the occurrence of prediction errors. ",
            "Fortunately, there is no need to be 100% accurate to succeed, we just need to perform better than our competitors. ",
            "In this exercise we will learn a practical approach to predict using the forecast package. ")
  text


  #############################################################################
  # Exercise 2
  # Transform this vector into a data frame. Create a first column called Item
  # to put a sequence in those statements.
  #############################################################################
library(dplyr)
  list_len <- length(text)
  text_df <- data_frame(line = 1:list_len, text = text)
  text_df

  #############################################################################
  # Exercise 3
  # How many times the string predict appears?
  #############################################################################
  lines <- 0
  for(i in 1:list_len){
    lines <- lines + grepl("[p][r][e][d][i][c][t]", text_df[i,2])
  }
  lines


  #############################################################################
  # Exercise 4
  # What are the sentences where predict appears?
  #############################################################################
  place <- vector()
  for(i in 1:list_len){
    place[i] <- grepl("[p][r][e][d][i][c][t]", text_df[i,2])
  }
  text_df[place,2]


  #############################################################################
  # Exercise 5
  # In witch Items does forecast appears?
  #############################################################################
  for(i in 1:list_len){
    place[i] <- grepl("[p][r][e][d][i][c][t]", text_df[i,2])
  }
  text_df[place,1]


  #############################################################################
  # Exercise 6
  # Count the number of times the word predict appears. Count the number of
  # times the word forecast appears. Calculate the proportions of predict/
  # forecast on this text.
  #############################################################################
  word1 <- 0
  word2 <- 0
  for(i in 1:list_len){
    word1 <- word1 + grepl("[p][r][e][d][i][c][t]", text_df[i,2])
    word2 <- word2 + grepl("[f][o][r][e][c][a][s][t]", text_df[i,2])
  }
  word1/word2


  #############################################################################
  # Exercise 7
  # Break those sentences in words and create a new data frame that the word
  # that repeats the most appears in the first line.
  #############################################################################
 library(tidytext)
  text_df %>%
    unnest_tokens(word, text)%>%
    count(word, sort = TRUE)

  #############################################################################
  # Exercise 8
  # As you can see, there are many words that are irrelevant, like “to”, “the”.
  # Take this words off using data(stop_words).
  #############################################################################
  data(stop_words)
  text_df %>%
    unnest_tokens(word, text)%>%
    count(word, sort = TRUE)%>%
    anti_join(stop_words)


  #############################################################################
  # Exercise 9
  # Download the book 768 from the library(gutenbergr).
  #############################################################################
 library(gutenbergr)
  book <- gutenberg_download(as.numeric(book_index))

  print((gutenberg_metadata %>%
    filter(as.numeric(gutenberg_id) == as.numeric(book_index)))["title"])

  #############################################################################
  # Exercise 10
  # Please, ignore the stopping words, and find out the words that appear
  # in descending order.
  #############################################################################

  book %>%
    unnest_tokens(word, text)%>%
    count(word, sort = TRUE)%>%
    anti_join(stop_words)

  book$linenumber <- seq.int(nrow(book))

  library(tidyr)
  library(stringr)

  book_sentiment <- book %>%
    unnest_tokens(word, text)%>%
    inner_join(get_sentiments("bing")) %>%
    count(word,index = linenumber %/% 200,sentiment) %>%
    spread(sentiment, n, fill = 0) %>%
    mutate(sentiment = positive - negative)

  library(ggplot2)

  ggplot(book_sentiment, aes(index, sentiment)) +
    geom_bar(stat="identity", fill="#FF9999", position=position_dodge())

}
