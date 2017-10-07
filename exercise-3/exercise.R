# Exercise 3: Working with Data Frames

# Load R's "USPersonalExpenditure" dataest using the `data()` function
data("USPersonalExpenditure")

# The variable USPersonalExpenditure is now accessible to you. Unfortunately, it's not a data.frame
# Test this using the is.data.frame function
is.data.frame(USPersonalExpenditure)


# Luckily, you can simply pass the USPersonalExpenditure variable to the data.frame function
# to convert it a data.farme

# Create a new variable by passing the USPersonalExpenditure to the data.frame function
us.expenditure<- data.frame(USPersonalExpenditure)

# What are the column names of your dataframe?
colnames(us.expenditure)

# Why are they so strange?
# Show the year the data was taken

# What are the row names of your dataframe?
rownames(us.expenditure)

# Create a column `category` that is equal to your rownames
us.expenditure$category <- rownames(us.expenditure)

# How much money was spent on personal care in 1940?
personal.care <- us.expenditure["Personal Care", "X1940"]

# How much money was spent on Food and Tobacco in 1960
food.and.tobacco <- us.expenditure["Food and Tobacco", "X1960"]

# What was the highest expenditure category in 1960?
max.expenditure.1960 <- us.expenditure$category[us.expenditure$X1960 == max(us.expenditure$X1960)]

### Bonus ###

# Write a function that takes in a year as a parameter, and 
# returns the highest spending category of that year
HighestCategory <- function(year) {
  return(us.expenditure$category[us.expenditure[year] == max(us.expenditure[year])])
}
# Using your function, determine the highest spending category of each year
highest.1945 <- HighestCategory("X1945")

# Write a loop to cycle through the years, and store the highest spending category of
# each year in a list
highest <- list()
for(year in seq(1940, 1960, 5)) {
  year.name <- paste0("X", year)
  highest[year.name] <- HighestCategory(year.name)
}