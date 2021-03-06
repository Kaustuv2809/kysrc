# kprep_levels.R
#
# this script is used to transform the raw excel files from the school report
# cards website and create the following dataframes in the kysrc package:
#
# kprep_levels
#
# this script is included in .Rbuildignore along with all of
# the assocaited excel files.
#
# 11-12 thru 15-16 data obtained on 2016-10-13 and
# 16-17 data obtained on 2017-09-28 from:
# https://applications.education.ky.gov/src/

# load data ####

# load packages
library(devtools)
library(readxl)
library(dplyr)
library(tidyr)
library(stringr)
library(magrittr)

# load data
levels12 <- read_excel("raw_data/data12/ACCOUNTABILITY_ACHIEVEMENT_LEVEL.xlsx", sheet = 2)
levels13 <- read_excel("raw_data/data13/ACCOUNTABILITY_ACHIEVEMENT_LEVEL.xlsx", sheet = 2)
levels14 <- read_excel("raw_data/data14/ACCOUNTABILITY_ACHIEVEMENT_LEVEL.xlsx")
levels15 <- read_excel("raw_data/data15/ACCOUNTABILITY_ACHIEVEMENT_LEVEL.xlsx")
levels16 <- read_excel("raw_data/data16/ACCOUNTABILITY_ACHIEVEMENT_LEVEL.xlsx")
levels17 <- read_excel("raw_data/data17/ACCOUNTABILITY_ACHIEVEMENT_LEVEL.xlsx")
levels18 <- read_excel("raw_data/data18/Accountable NAPD_20180926.xlsx")

source("raw_data/function_help.R")

# clean data ####

# create function to convert chars to nums, handling "," in 1000+ numbers
char_to_num <- function(string = ""){
  as.numeric(str_replace_all(string, ",", ""))
}


# filter out unneeded columns, rename columns
levels12_clean <- levels12 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, CONTENT_LEVEL, CONTENT_TYPE,
         DISAGG_LABEL, NBR_TESTED, PCT_NOVICE, PCT_APPRENTICE, PCT_PROFICIENT,
         PCT_DISTINGUISHED, PCT_PROFICIENT_DISTINGUISHED,
         PCT_BONUS, NAPD_CALCULATION) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, school_level = CONTENT_LEVEL, subject = CONTENT_TYPE,
         student_group = DISAGG_LABEL, n_tested = NBR_TESTED,
         novice_pct = PCT_NOVICE, apprentice_pct = PCT_APPRENTICE,
         proficient_pct = PCT_PROFICIENT, distinguished_pct = PCT_DISTINGUISHED,
         prof_dist_pct = PCT_PROFICIENT_DISTINGUISHED,
         bonus_pct = PCT_BONUS, napd_calc = NAPD_CALCULATION) %>%
  mutate(student_group = str_replace_all(student_group,
                                         "Limited English Proficiency",
                                         "English Learners"))

levels13_clean <- levels13 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, CONTENT_LEVEL, CONTENT_TYPE,
         DISAGG_LABEL, NBR_TESTED, PCT_NOVICE, PCT_APPRENTICE, PCT_PROFICIENT,
         PCT_DISTINGUISHED, PCT_PROFICIENT_DISTINGUISHED,
         PCT_BONUS, NAPD_CALCULATION) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, school_level = CONTENT_LEVEL, subject = CONTENT_TYPE,
         student_group = DISAGG_LABEL, n_tested = NBR_TESTED,
         novice_pct = PCT_NOVICE, apprentice_pct = PCT_APPRENTICE,
         proficient_pct = PCT_PROFICIENT, distinguished_pct = PCT_DISTINGUISHED,
         prof_dist_pct = PCT_PROFICIENT_DISTINGUISHED,
         bonus_pct = PCT_BONUS, napd_calc = NAPD_CALCULATION) %>%
  mutate(student_group = str_replace_all(student_group,
                                         "Limited English Proficiency",
                                         "English Learners"))

levels14_clean <- levels14 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, CONTENT_LEVEL, CONTENT_TYPE,
         DISAGG_LABEL, NBR_TESTED, PCT_NOVICE, PCT_APPRENTICE, PCT_PROFICIENT,
         PCT_DISTINGUISHED, PCT_PROFICIENT_DISTINGUISHED,
         PCT_BONUS, NAPD_CALCULATION) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, school_level = CONTENT_LEVEL, subject = CONTENT_TYPE,
         student_group = DISAGG_LABEL, n_tested = NBR_TESTED,
         novice_pct = PCT_NOVICE, apprentice_pct = PCT_APPRENTICE,
         proficient_pct = PCT_PROFICIENT, distinguished_pct = PCT_DISTINGUISHED,
         prof_dist_pct = PCT_PROFICIENT_DISTINGUISHED,
         bonus_pct = PCT_BONUS, napd_calc = NAPD_CALCULATION) %>%
  mutate(student_group = str_replace_all(student_group,
                                         "Limited English Proficiency",
                                         "English Learners"))

levels15_clean <- levels15 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, CONTENT_LEVEL, CONTENT_TYPE,
         DISAGG_LABEL, NBR_TESTED, PCT_NOVICE, PCT_APPRENTICE, PCT_PROFICIENT,
         PCT_DISTINGUISHED, PCT_PROFICIENT_DISTINGUISHED,
         PCT_BONUS, NAPD_CALCULATION) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, school_level = CONTENT_LEVEL, subject = CONTENT_TYPE,
         student_group = DISAGG_LABEL, n_tested = NBR_TESTED,
         novice_pct = PCT_NOVICE, apprentice_pct = PCT_APPRENTICE,
         proficient_pct = PCT_PROFICIENT, distinguished_pct = PCT_DISTINGUISHED,
         prof_dist_pct = PCT_PROFICIENT_DISTINGUISHED,
         bonus_pct = PCT_BONUS, napd_calc = NAPD_CALCULATION) %>%
  mutate(student_group = str_replace_all(student_group,
                                         "Limited English Proficiency",
                                         "English Learners"))

levels16_clean <- levels16 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, CONTENT_LEVEL, CONTENT_TYPE,
         DISAGG_LABEL, NBR_TESTED, PCT_NOVICE, PCT_APPRENTICE, PCT_PROFICIENT,
         PCT_DISTINGUISHED, PCT_PROFICIENT_DISTINGUISHED,
         PCT_BONUS, NAPD_CALCULATION) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, school_level = CONTENT_LEVEL, subject = CONTENT_TYPE,
         student_group = DISAGG_LABEL, n_tested = NBR_TESTED,
         novice_pct = PCT_NOVICE, apprentice_pct = PCT_APPRENTICE,
         proficient_pct = PCT_PROFICIENT, distinguished_pct = PCT_DISTINGUISHED,
         prof_dist_pct = PCT_PROFICIENT_DISTINGUISHED,
         bonus_pct = PCT_BONUS, napd_calc = NAPD_CALCULATION) %>%
  mutate(year = as.character(year))

levels17_clean <- levels17 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, CONTENT_LEVEL, CONTENT_TYPE,
         DISAGG_LABEL, NBR_TESTED, PCT_NOVICE, PCT_APPRENTICE, PCT_PROFICIENT,
         PCT_DISTINGUISHED, PCT_PROFICIENT_DISTINGUISHED,
         PCT_BONUS, NAPD_CALCULATION) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, school_level = CONTENT_LEVEL, subject = CONTENT_TYPE,
         student_group = DISAGG_LABEL, n_tested = NBR_TESTED,
         novice_pct = PCT_NOVICE, apprentice_pct = PCT_APPRENTICE,
         proficient_pct = PCT_PROFICIENT, distinguished_pct = PCT_DISTINGUISHED,
         prof_dist_pct = PCT_PROFICIENT_DISTINGUISHED,
         bonus_pct = PCT_BONUS, napd_calc = NAPD_CALCULATION) %>%
  mutate(year = as.character(year))

levels18_clean <- levels18 %>%
  rename(sch_id =`Accountable School Code`, dist_name = `District Name`,
         sch_name = `School Name`, school_level = Level, subject = Subject,
         student_group = `Demographic Group`, n_tested = `Tested`,
         novice_pct = `Novice %`, apprentice_pct = `Apprentice %`,
         proficient_pct = `Proficient %`, distinguished_pct = `Distinguished %`,
         prof_dist_pct = `Proficient/ Distinguished %`) %>%
  select(-Type, -Enrollment, -Suppression, -`Participation Rate`) %>%
  mutate(bonus_pct = NA, napd_calc = NA, year = "2017-2018",
         school_level = str_replace_all(school_level, "ES", "Elementary School"),
         school_level = str_replace_all(school_level, "MS", "Middle School"),
         school_level= str_replace_all(school_level, "HS", "High School"),
         subject = str_replace_all(subject, "RD", "Reading"),
         subject = str_replace_all(subject, "MA", "Mathematics"),
         subject = str_replace_all(subject, "SC", "Science"),
         subject = str_replace_all(subject, "SS", "Social Studies"),
         subject = str_replace_all(subject, "WR", "Writing"),
         student_group = str_replace_all(student_group,
                                         "Consolidated Student Group",
                                         "Gap Group (non-duplicated)"),
         student_group = str_replace_all(student_group,
                                         "English Learner \\(EL\\)",
                                         "English Learners"),
         student_group = str_replace_all(student_group,
                                         "White",
                                         "White (Non-Hispanic)"),
         student_group = str_replace_all(student_group,
                                         "Disability-With IEP Alt Only",
                                         "Disability-Alternate Only"),
         student_group = str_replace_all(student_group,
                                         "Disability-With IEP \\(No Alt\\)",
                                         "Disability-With IEP (not including Alternate)"),
         student_group = str_replace_all(student_group,
                                         "Disability \\(no ALT\\) with Accomodation",
                                         "Disability-With Accommodation (not including Alternate)")) %>%
  select(sch_id, dist_name, sch_name, year, everything())

# bind kprep level data from all years into one dataframe
ach_levels <- bind_rows(levels12_clean, levels13_clean,
                        levels14_clean, levels15_clean,
                        levels16_clean, levels17_clean,
                        levels18_clean)

# remove old dataframes
rm(levels12, levels13, levels14, levels15, levels12_clean, levels13_clean,
   levels14_clean, levels15_clean, levels16, levels16_clean, levels17,
   levels17_clean, levels18, levels18_clean)

# clean data formatting
ach_levels %<>%
  mutate(year = factor(year, levels = c("20112012", "20122013",
                                        "20132014", "20142015",
                                        "20152016", "20162017",
                                        "2017-2018"),
                       labels = c("2011-2012", "2012-2013",
                                  "2013-2014", "2014-2015",
                                  "2015-2016", "2016-2017",
                                  "2017-2018")),
         school_level = factor(school_level, levels = c("Elementary School",
                                                        "Middle School",
                                                        "High School")),
         subject = factor(subject),
         student_group = factor(student_group),
         n_tested = char_to_num(n_tested),
         novice_pct = as.numeric(novice_pct) / 100,
         apprentice_pct = as.numeric(apprentice_pct) / 100,
         proficient_pct = as.numeric(proficient_pct) / 100,
         distinguished_pct = as.numeric(distinguished_pct) / 100,
         prof_dist_pct = as.numeric(prof_dist_pct) / 100,
         bonus_pct = as.numeric(bonus_pct) / 100,
         napd_calc = as.numeric(napd_calc) / 100,
         perf_index = (apprentice_pct * .5) + proficient_pct +
           (distinguished_pct * 1.25))

# select state data
ach_level_state <- select_state(ach_levels)

# select district data
ach_level_dist <- select_dist(ach_levels)

# select school data
ach_level_sch <- select_sch(ach_levels)

# use data for package ####
use_data(ach_level_sch, overwrite = TRUE)
use_data(ach_level_dist, overwrite = TRUE)
use_data(ach_level_state, overwrite = TRUE)
