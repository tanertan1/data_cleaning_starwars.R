# Load the tidyverse package
library(tidyverse)

# ==========================================
# 1. Data Inspection & Type Conversion
# ==========================================
# Quickly inspect the data structure
glimpse(starwars)

# Check the class of the 'gender' column
class(starwars$gender)

# Convert 'gender' from character to factor
starwars$gender <- as.factor(starwars$gender)

# Verify the change
class(starwars$gender)

# ==========================================
# 2. Selecting Variables
# ==========================================
# View all column names
names(starwars)

# Select specific columns and verify their names
# 'ends_with' is a helper function to select columns based on their suffix
starwars %>% 
  select(name, height, ends_with("color")) %>% 
  names()

# ==========================================
# 3. Filtering Observations
# ==========================================
# View unique values in 'hair_color'
starwars %>% 
  distinct(hair_color)

# Filter based on multiple conditions:
# 1. Hair color must be 'blond' OR 'brown'
# 2. Height must be less than 180
starwars %>% 
  select(name, height, ends_with("color")) %>%
  filter(hair_color %in% c("blond", "brown"),
         height < 180)

# ==========================================
# 4. Handling Missing Values (NA)
# ==========================================
# Identify rows with incomplete cases (rows containing at least one NA)
starwars %>% 
  select(name, gender, hair_color, height) %>% 
  filter(!complete.cases(.))

# Option 1: Drop rows with missing values in a specific column (e.g., height)
starwars %>% 
  select(name, gender, hair_color, height) %>% 
  filter(!complete.cases(.)) %>% 
  drop_na(height)

# Option 2: Replace missing values with a specific value (e.g., "none")
starwars %>% 
  select(name, gender, hair_color, height) %>% 
  filter(!complete.cases(.)) %>% 
  mutate(hair_color = replace_na(hair_color, "none"))
