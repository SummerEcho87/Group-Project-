crunchyroll <- read.csv('../Data/crunchyroll-titles.csv')

crunchyroll.drop('id', 'description', 'age_certification', 'production_countries', 'tmdb_popularity', 'tmdb_score', axis=1, inplace=TRUE)
