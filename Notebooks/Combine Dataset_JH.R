library(tidyverse)


# Loading Combine Dataset
View(Combine.Data.Sets)

#Expolre the Combine Dataset
head(Combine.Data.Sets)
tail(Combine.Data.Sets)
str(Combine.Data.Sets)
summary(Combine.Data.Sets)

glimpse(Combine.Data.Sets)

Means <- na.omit(Combine.Data.Sets %>% summarize(Mean = mean(imdb_score)))
mean(Combine.Data.Sets$imdb_score, na.rm = TRUE)

SHOW <- (Combine.Data.Sets %>% filter(type %in% c('SHOW')))
MOVIE <- (Combine.Data.Sets %>% filter(type %in% c('MOVIE')))
unique(SHOW$type)
unique(MOVIE$type)

MOVIE_mean = mean(MOVIE$imdb_score, na.rm = TRUE)
MOVIE_mean
SHOW_mean = mean(SHOW$imdb_score, na.rm = TRUE)
SHOW_mean


