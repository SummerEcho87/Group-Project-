crunchyroll_titles <- read.csv('../Data/crunchyroll-titles.csv')
head(crunchyroll_titles)
crunchyroll.drop('id', 'description', 'age_certification', 'production_countries', 'tmdb_popularity', 'tmdb_score', axis=1, inplace=TRUE)
#dropping rows that are not needed for data
library('dplyr')
mydata <- crunchyroll_titles
crunchyroll_titles1 <- select(mydata, -c('id', 'description', 'age_certification', 'production_countries', 'tmdb_popularity', 'tmdb_score', 'imdb_id'))

