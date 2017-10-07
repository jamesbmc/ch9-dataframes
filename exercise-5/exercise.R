# Exercise 5: Popular Baby Names Over Time

# Read in the female baby names csv file into a variable called `female.names`
# Make sure *not* to read the strings as factors (this might take a minute)
female.names <- read.csv("data/female_names.csv", stringsAsFactors = F)

# Create a vector `year` as the year column of the dataset
year <- female.names$year

# Create a vector `name` as the name column of the datset
name <- female.names$name

# Create a vector `prop` as the proportion column of the dataset
prop <- female.names$prop

# Create a vector `names.2013` as your name vector where your year vector is 2013
names.2013 <- name[year == 2013]

# Create a vector `prop.2013` as the your prop vector where your year vecctor is 2013
prop.2013 <- prop[year == 2013]

# What was the most popular female name in 2013?
most.popular <- names.2013[prop.2013 == max(prop.2013)]

# Write a funciton `MostPopular` that takes in a value `my.year`, and returns
# a sentence stating the most popular name in that year. 
MostPopular <- function(my.year) {
  names.tmp <- name[year == my.year]
  prop.tmp <- prop[year == my.year]
  most.pop <- names.tmp[prop.tmp == max(prop.tmp)]
  return(paste("The most popular baby name in", my.year, "was", most.pop))
}

# What was the most popular female name in 1994?
most.pop.1994 <- MostPopular(1994)

### Bonus ###

# Write a function `HowPopular` that takes in a name and a year, and returns
# a sentence with how popular that name was in that year
HowPopular <- function(my.name, my.year) {
  names.wanted <- name[year == my.year]
  prop.wanted <- prop[year == my.year]
  proportion <- round(prop.wanted[names.wanted == my.name], 4) * 100
  return(paste("The proportion of people named", my.name, "in", my.year, "was", proportion, "%"))
}
# How popular was the name 'Laura' in 1995
Laura.pop.1995 <- HowPopular("Laura", 1995)

Jessica.pop.1994 <- HowPopular("Jessica", 1994)