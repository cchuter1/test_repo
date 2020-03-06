rm(list=ls())

library(tidyverse)
library(readxl)

# Observations: Traditional schools in Baltimore City Schools

## Load and munge data


#First Data Set

baltimoredata <- read_excel("~/Desktop/2018-19-CitySchoolsSchoolandDistrictLevelEnrollment.xlsx") 
View(
  baltimoredata[,c("School Number", "School Name", "Year", "Total Enrollment")]
)

#Second Data Set

library(readxl)
SOURCE_MISA_2017_18_PUBLIC <- read_excel("~/Downloads/SOURCE MISA 2017-18 PUBLIC.xlsx")
View(SOURCE_MISA_2017_18_PUBLIC) 

names(SOURCE_MISA_2017_18_PUBLIC)[names(SOURCE_MISA_2017_18_PUBLIC) == 'School'] <- 'School Number'
View(SOURCE_MISA_2017_18_PUBLIC)


## Join data 

analytichw <- left_join(baltimoredata, SOURCE_MISA_2017_18_PUBLIC, by="School Name")
