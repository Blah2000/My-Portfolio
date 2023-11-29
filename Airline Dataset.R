library(tidyverse)
setwd(file.path("C:", "Users", "andre", "Downloads"))

# Read Data Set
airline_data <- read.csv("Airline Dataset Updated - v2.csv")

# Calculate the gender ratio
gender_ratio <- airline_data %>%
  group_by(Gender) %>%
  summarise(count = n()) %>%
  spread(Gender, count) %>%
  mutate(ratio = Male / Female)

# Print the gender ratio
print(gender_ratio)

#############
# Average age of male 
average_age_male <- airline_data %>%
  filter(Gender == "Male") %>%
  summarise(Average_age = mean(Age, na.rm = TRUE))

# Print the average age of male passengers
print(average_age_male)

########
#Average age of female 
average_age_female <- airline_data %>%
  filter(Gender == "Female") %>%
  summarise(Average_age = mean(Age, na.rm = TRUE))

# Print the average age of female passengers
print(average_age_female)

###################
top_nationalities <- airline_data %>%
  group_by(Nationality) %>%
  summarise(count = n()) %>%
  arrange(desc(count)) %>%
  top_n(10)

# Print the top 10 nationalities
print(top_nationalities)