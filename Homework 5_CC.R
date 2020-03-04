
## Import 1st Dataset

library(readxl)
X2018_19_parent_survey_results_3_3_2020 <- read_excel("2018-19_parent_survey_results__3.3.2020.xlsx")
View(X2018_19_parent_survey_results_3_3_2020) 


## Rename 1st Dataframe & View

parent_climate_survey <- read_excel("2018-19_parent_survey_results__3.3.2020.xlsx")
View(parent_climate_survey)


## Drop Columns
## Dropped scores because they are not meaningful with score criterion/description
## Dropped parent response counts but kept response rates 

parent_climate_survey$`Parent Response Count` <- parent_climate_survey$`Estimated Parent Number Eligible1` <- parent_climate_survey$`Administration Dimension Score` <- parent_climate_survey$`Creativity & the Arts Dimension Score` <- parent_climate_survey$`Physical Environment Dimension Score` <- parent_climate_survey$`Learning Climate Dimension Score` <- parent_climate_survey$`Family Involvement Dimension Score` <- parent_climate_survey$`School Resources Dimension Score` <- parent_climate_survey$`Safety Dimension Score` <- parent_climate_survey$`Satisfaction with School Dimension Score` <- parent_climate_survey$`Grit Dimension Score` <- parent_climate_survey$OVERALL <- parent_climate_survey$`District Office Dimension Score` <- NULL



## Drop Rows
## Dropped high school climate data to compare with PARCC scores (taken every year 3rd-8th but not tested in high school)

parent_climate_survey_1 <- parent_climate_survey[-c(61, 62, 91, 108, 109, 115, 121, 125, 126, 129, 130, 132, 133, 139, 140, 143, 145:165, 167:169), ]
View(parent_climate_survey_1)

## Save new parent climate survey data to export and commit
save(parent_climate_survey_1, file="parent_climate_survey_1.Rda")


## Import 2nd Dataset
## PARCC score limited to Baltimore

library(readxl)
PARCC <- read_excel("PARCC.xlsx")
View(PARCC)

PARCC_scores <- read_excel("PARCC.xlsx")

## Drop Columns 
## Removed columns without descriptive labels

PARCC_scores$...8  <- PARCC_scores$`1` <- PARCC_scores$...10 <- PARCC_scores$`2` <- PARCC_scores$...7 <- PARCC_scores$...12 <- PARCC_scores$...12 <- PARCC_scores$`3` <- PARCC_scores$...14 <- PARCC_scores$`4` <- PARCC_scores$...16 <- PARCC_scores$`5` <- PARCC_scores$...18 <- PARCC_scores$`3,4,5` <- PARCC_scores$...20 <- PARCC_scores$...20 <- PARCC_scores$`4 & 5` <- PARCC_scores$...22 <- PARCC_scores$...6 <- NULL

## Rename columns with meaningful names

colnames(PARCC_scores) <- c("Year", "School Number", "School Name", "School Gradeband", "Management Type", "Mean Scale Score")
View(PARCC_scores)

## Merge the Data

merged_data <- left_join(parent_climate_survey_1, PARCC_scores, by = "School Name")

# Save new merged data
save(merged_data, file="merged_data_CC.Rda")


# Subset the data by each school number (to convert from long to wide)
merged_data$`School Name` <- merged_data$`Admin1-The school administration promptly responds to my concerns` <- merged_data$`Admin9-Parents have the opportunity to give input into the school's decisions` <- merged_data$`Creative1-Student work in the arts is displayed or presented in my child's school`<-  NULL
