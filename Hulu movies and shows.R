# Importing Packages

library("mvnormtest")
library("car")
library("dplyr")
library("ggplot2")

#Loading Dataset
View(Hulu_titles)

# Checking out the dataset
head(Hulu_titles)

# Question:1 How have movies and shows times changed throughout the decades?
# Creating  Data Frames for Shows.
HuluSHOW <- (Hulu_titles %>% filter(type %in% c('SHOW')))
write.csv(HuluSHOW,"View(Hulu_titles)", row.names = FALSE)
HuluSHOW

# Creating  Data Frames for Movies.
HuluMOVIE <- (Hulu_titles %>% filter(type %in% c('MOVIE')))
write.csv(HuluMOVIE,"View(Hulu_titles"), row.names = FALSE)
HuluMOVIE

HuluMOVIE90 <- (Hulu_titles %>% filter(release_year %in% c('1990','1991','1992','1993','1994','1995','1996','1997','1998','1999')))
unique(HuluMOVIE90$type)
HuluMOVIE00 <- (Hulu_titles %>% filter(release_year %in% c('2000','2001','2002','2003','2004','2005','2006','2007','2008','2009')))
unique(HuluMOVIE00$type)
HuluMOVIE10 <- (Hulu_titles %>% filter(release_year %in% c('2010','2011','2012','2013','2014','2015','2016','2017','2018','2019')))
unique(HuluMOVIE10$type)

# Combining Group By and Summarize
# Question:2 How have MOVIE runtimes changed over the decades?
# 1990's runtimes 
 MeansRunTime90 <- HuluMOVIE90 %>% group_by(release_year) %>% summarize(Mean = mean(runtime))
 MeansRunTime90
 # Checking for the over all average for all 90s movies. 
 TotalMeansRunTime90 <- HuluMOVIE90 %>% summarize(Mean = mean(runtime))
 TotalMeansRunTime90
 # Checking for the over all average for all 2000s movies. 
 MeansRunTime00 <- HuluMOVIE00 %>% summarize(Mean = mean(runtime))
 MeansRunTime00
 
 
 
 
 
 
 
 
 
 
 



