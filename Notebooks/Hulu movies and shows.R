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

# How have SHOW runtimes changed over the decades?
# Creating Data Frame for Shows.
HuluSHOW <- (Hulu_titles %>% filter(type %in% c('SHOW')))
write.csv(HuluSHOW,".View(Hulu_titles)", row.names = FALSE)
head(HuluSHOW)









