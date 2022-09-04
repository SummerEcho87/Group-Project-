# Importing Packages

library(tidyverse)

#Loading Dataset
View(Hulu_titles)

#Expolre the Hulu Dataset
head(Hulu_titles)
tail(Hulu_titles)
str(Hulu_titles)
summary(Hulu_titles)

glimpse(Hulu_titles)

# Question:1 How have movies and shows times changed throughout the decades?
# Creating  Data Frames for Movies.
HuluMOVIE <- (Hulu_titles%>% filter(type %in% c('MOVIE')))
write.csv(HuluMOVIE,"View(Hulu_titles)", row.names = FALSE)
HuluMOVIE

# Checking three different MOVIE data frames for 3 different decades.
HuluMOVIE90 <- (Hulu_titles %>% filter(release_year %in% c('1990','1991','1992','1993','1994','1995','1996','1997','1998','1999')))
unique(HuluMOVIE90$type)
HuluMOVIE00 <- (Hulu_titles %>% filter(release_year %in% c('2000','2001','2002','2003','2004','2005','2006','2007','2008','2009')))
unique(HuluMOVIE00$type)
HuluMOVIE10 <- (Hulu_titles %>% filter(release_year %in% c('2010','2011','2012','2013','2014','2015','2016','2017','2018','2019')))
unique(HuluMOVIE10$type)

#How have MOVIE runtimes changed over the decades?
#1990's MOVIE Runtimes
MeansRunTimeMOVIE90 <- HuluMOVIE90 %>% group_by(release_year) %>% summarize(Mean = mean(runtime))
MeansRunTimeMOVIE90
# Checking 1990's OVERALL Means Run Time
TotalMeansRunTime90 <- HuluMOVIE90 %>% summarize(Mean = mean(runtime))
TotalMeansRunTime90
#2000's MOVIE Runtimes
MeansRunTimeMOVIE00 <- HuluMOVIE00 %>% group_by(release_year) %>% summarize(Mean = mean(runtime))
MeansRunTimeMOVIE00
#2000's Overall Mean Run Time
TotalMeansRunTime00 <- HuluMOVIE00 %>% summarize(Mean = mean(runtime))
TotalMeansRunTime00
#2010's MOVIE Runtimes
MeansRunTimeMOVIE10 <- HuluMOVIE10 %>% group_by(release_year) %>% summarize(Mean = mean(runtime))
MeansRunTimeMOVIE10
#2010's Overall Means Run Time
TotalMeansRunTime10 <- HuluMOVIE10 %>% summarize(Mean = mean(runtime))
TotalMeansRunTime10
nrow(HuluMOVIE90[!is.na(HuluMOVIE90$runtime),])
nrow(HuluMOVIE10[!is.na(HuluMOVIE10$runtime),])
nrow(HuluMOVIE00[!is.na(HuluMOVIE00$runtime),])

#nΣ(Xj – X..)2
# n: the sample size of group j Σ: a greek symbol that means “sum” Xj: the mean of group j X..: the overall mean
# sample size of group j(sum)(mean of group j- overall mean)2
# Performing a Kruskal-Wallis test for data that is non-parametic (in our case uneven sample sizes)?
nrow(HuluMOVIE[!is.na(HuluMOVIE$runtime),])

# How have SHOW runtimes changed over the decades?
# Creating Data Frame for Shows.
HuluSHOW <- (Hulu_titles %>% filter(type %in% c('SHOW')))
write.csv(HuluSHOW,".View(Hulu_titles)", row.names = FALSE)
head(HuluSHOW)

# Checking three different Shows data frames for 3 different decades.
HuluSHOW90 <- (Hulu_titles %>% filter(release_year %in% c('1990','1991','1992','1993','1994','1995','1996','1997','1998','1999')))
unique(HuluSHOW90$type)
HuluSHOW00 <- (Hulu_titles %>% filter(release_year %in% c('2000','2001','2002','2003','2004','2005','2006','2007','2008','2009')))
unique(HuluSHOW00$type)
HuluSHOW10 <- (Hulu_titles %>% filter(release_year %in% c('2010','2011','2012','2013','2014','2015','2016','2017','2018','2019')))
unique(HuluSHOW10$type)

#How have Shows  runtimes changed over the decades?
#1990's Shows runtimes
MeansRunTimeSHOW90 <- HuluSHOW90 %>% group_by(release_year) %>% summarize(Mean = mean(runtime))
MeansRunTimeSHOW90
# Checking 1990's OVERALL Means Run Time
TotalMeansRunTime90 <- HuluSHOW90 %>% summarize(Mean = mean(runtime))
TotalMeansRunTime90
#2000's MOVIE Runtimes
MeansRunShow00 <- HuluSHOW00 %>% group_by(release_year) %>% summarize(Mean = mean(runtime))
MeansRunTimeMOVIE00
#2000's Overall Mean Run Time
TotalMeansRunTime00 <- HuluSHOW00 %>% summarize(Mean = mean(runtime))
TotalMeansRunTime00
#2010's MOVIE Runtimes
MeansRunTimeSHOW10 <- HuluSHOW10 %>% group_by(release_year) %>% summarize(Mean = mean(runtime))
MeansRunTimeSHOW10
#2010's Overall Means Run Time
TotalMeansRunTime10 <- HuluSHOW10 %>% summarize(Mean = mean(runtime))
TotalMeansRunTime10
nrow(HuluSHOW90[!is.na(HuluSHOW90$runtime),])
nrow(HuluSHOW10[!is.na(HuluSHOW10$runtime),])
nrow(HuluSHOW00[!is.na(HuluSHOW00$runtime),])
# nΣ(Xj – X..)2
#n: the sample size of group j Σ: a greek symbol that means “sum” Xj: the mean of group j X..: the overall mean
#sample size of group j(sum)(mean of group j- overall mean)2

# Perform a Kruskal-Wallis test for data that is non-parametic (in our case uneven sample sizes)?
nrow(HuluSHOW[!is.na(HuluSHOW$runtime),])

#Perform a Kruskall-Wallis Test to test for analysis of variance when non-parametic
#(in our case uneven sample sizes)
# Kruskall-Wallis Test for variance of runtime of movies by year
kruskal.test(runtime ~ release_year,  data=HuluSHOW)
# P-value shows a significant difference in the average show runtime

# Kruskall-Wallis Test for variance of runtime of movies by year
kruskal.test(runtime ~ release_year, data = HuluMOVIE)
# Since this p-value is greater than 0.05, we can reject the null hypothesis that the median runtime is the same across the years

# How Have IMDB ratings changed for shows over the decades?
IMDB<-HuluSHOW %>% group_by(release_year) %>% summarize(Mean = mean(imdb_score, na.rm = TRUE))
IMDB
mean(HuluSHOW90$imdb_score, na.rm = TRUE)
mean(HuluSHOW00$imdb_score, na.rm = TRUE)
mean(HuluSHOW10$imdb_score, na.rm = TRUE)
kruskal.test(imdb_score ~ release_year, data = HuluSHOW)

# How Have IMDB ratings changed for movies over the decades?
IMDB<-HuluMOVIE %>% group_by(release_year) %>% summarize(Mean = mean(imdb_score, na.rm = TRUE))
IMDB
mean(HuluMOVIE90$imdb_score, na.rm = TRUE)
mean(HuluMOVIE00$imdb_score, na.rm = TRUE)
mean(HuluMOVIE10$imdb_score, na.rm = TRUE)
kruskal.test(imdb_score ~ release_year, data = HuluMOVIE)

# Lets Compare Hulu IMDB scores to the Average IMDB score for streaming services (Netlfix, Hulu and HBO)
# Hulu Movie Average IMDB score
Hulu_MOVIE_mean = mean(HuluMOVIE$imdb_score, na.rm = TRUE)
Hulu_MOVIE_mean
# Hulu Movie Average IMDB score is 6.1

# Hulu Shows Average IMDB score
Hulu_SHOW_mean = mean(HuluSHOW$imdb_score, na.rm = TRUE)
Hulu_SHOW_mean
# Show Show Average IMDB score is 7.1

# T-TEST for Movies - Is there a significant difference between the average Hulu Mmvie 
# IMDB score and the overall IMDB score for streaming services?
t_obj <- t.test(HuluMOVIE$imdb_score, mu = 6.2)
print(t_obj)
# As we can see that the P-value is less than .05. We can see that Hulu movies have a significantly 
# lower IMDB score at 6.2 than the overall average score of 6.4

# T-TEST for Shows - Is there a significant difference between the average Hulu show 
# IMDB score and the overall IMDB score for streaming services?
t_obj <- t.test(HuluSHOW$imdb_score, mu = 7.0)
print(t_obj)
# AS we can see that the P-value is less than .05 so there is NOT a signifcant difference in averages. 
# The Average Hulu score of 7.0 is the same as the overall average of 7.0  




