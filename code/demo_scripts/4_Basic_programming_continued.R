# ADF&G R Intro Workshop
# Logan Wendling & Matt Tyers
# logan.wendling@alaska.gov
# matt.tyers@alaska.gov


#####         SCRIPT 4           #####
##### PROGRAMMING BASICS, PART 2 #####



# How to take things apart & put things together
# We can use square brackets to retrieve or assign subsets
x1 <- c(1, 1, 2, 3, 5, 8, 13, 21)
x1
x1[4]
x1[1:4]
x1[5:length(x1)]  # remind ourselves what length(x1) does!

# negative indices exclude items
x1[-4]


# Indices with 2+ dimensions!
# data.frames and matrices follow the same rules with square brackets []
catchdata <- data.frame(station = c(1, 1, 2, 2, 3, 3),
                        catch = c(12, 23, 44, 65, 34, 49),
                        hours = c(1, 2, 2, 3, 1, 1.5),
                        weather = c("sun", "sun", "rain", "rain", "rain", "flood"))
catchdata
catchdata[1, ]   # row 1
catchdata[, 1]   # column 1
catchdata[1, 1]  # row 1, column 1

# but data.frames also allow subsetting by column name with $
catchdata$catch  # or selecting catch by name - THIS IS MORE ROBUST TO DATA CHANGES

catchdata$catch[1]           # selecting a single element from one column
catchdata$catch[1] <- 999    # storing a new value!
catchdata

# you can also define new columns with $
catchdata$CPUE <- catchdata$catch / catchdata$hours
catchdata


## -----------------------------

# an example of extracting something from a list!
# here is a 2-sample t-test of two vectors
x1 <- c(1, 4, 2, 3, 5)
x2 <- c(7, 6, 9, 6, 8, 7)
t.test(x1, x2)   # printing the test results

# what is actually returned?
test_results <- t.test(x1, x2)
str(test_results)    # str() prints the structure of any object

# extracting the p-value directly
test_results$p.value

# extracting the CI for the difference
test_results$conf.int





# another list example if it's useful...
list1 <- list(catchdata, 42, c("raindrops on roses", "whiskers on kittens"))
list1
list1[[3]]   # double brackets for subsetting

# the str() function shows the structure of any object
str(list1)


# or, if list elements have names, you can also use $ to extract things with names
list1 <- list(catchdata=catchdata,
              meaningOfLife=42,
              myFavoriteThings=c("raindrops on roses", "whiskers on kittens"))
list1
list1$myFavoriteThings   # grabbing the last element by name
list1[[3]]               # and also by index!

# the str() function shows the structure of any object
str(list1)




## --------------------------------

## Some fun with logicals!


data(mtcars)   # this loads a built-in dataset that is included with R
mtcars  # viewing the dataset
head(mtcars) # just viewing the first 5 rows
tail(mtcars) # last 5 rows

# a few more ways of viewing it...
summary(mtcars)
str(mtcars)


# subset of cars with 4-cylinder engines?
mtcars[mtcars$cyl == 4, ]

# subset of cars with 4-cylinder engines AND more than 90 horsepower?
mtcars[mtcars$cyl == 4 & mtcars$hp > 90, ]

# make a selection, with cars that have 4 cylinders and cars that have 6 cylinders
mtcars[mtcars$cyl == 4 & mtcars$cyl==6, ]  # what happened??
mtcars[mtcars$cyl == 4 | mtcars$cyl==6, ]  # that's better!

# how else could we do this?
mtcars[mtcars$cyl %in% c(4,6), ]
mtcars[mtcars$cyl <= 6, ]
mtcars[mtcars$cyl != 8, ]  # technically correct but a little scary

mtcars$cartype <- ifelse(mtcars$qsec < 17 & mtcars$mpg > 25, "fast and efficient",
                  ifelse(mtcars$qsec < 17, "fast",
                         ifelse(mtcars$mpg > 25, "efficient", "")))


# we need the mtcars$ to tell R to look inside the mtcars data frame
plot(mtcars$hp, mtcars$mpg)
plot(hp, mpg)   # doesn't work

# there are some Base-R ways of telling R to look inside mtcars
# (Logan will be presenting some better ways tomorrow)
with(mtcars, plot(hp, mpg))
plot(mpg~hp, data=mtcars)

plot(mtcars)  # cool way to plot the whole data.frame at once!
class(mtcars)
# remember, functions like plot() depend on the type of object that is being plotted




### some additional practice.....

# some more fun with data.frames & logicals ...
df1 <- data.frame(day = c(1, 2, 3, 1, 2, 3),
                  operator = c("A", "A", "A", "B", "B", "B"),
                  reading = c(5, 1, 2, 6, 999, 9))

summary(df1)  # summary() summarizes all columns using the appropriate methods!
str(df1)
names(df1)  # names() just prints names

df1$day  # extracting the day column by name
df1[, 1]  # can also extract by location, but this is less robust to changes


# fun with logical statements!
df1$operator == "B"   # we test equality with ==, not =
df1$operator != "B"   # not equals
!(df1$operator == "B")  # ! means not

df1[df1$day == 2, ]  # subsetting for day==2
df1[df1$day != 2, ]  # subsetting for day NOT EQUALS 2
df1[!(df1$day == 2), ]  # subsetting for day NOT EQUALS 2, a different way

# challenge: create a data.frame of the subset of data from day 2 and operator B
two_B <- df1[df1$day == 2 & df1$operator == "B", ]
not_two_B <- df1[!(df1$day == 2 & df1$operator == "B"), ]

# using logical statements for assignment!
df1$operator[df1$operator == "A"] <- "Arthur"
df1$operator[df1$operator == "B"] <- "Beverly"

# introducing ifelse()... like Excel's =if()
# test, value if true, value if false
df1$day1 <- ifelse(df1$day == 1, "day 1", NA)   # adding a new column with $

# testing for NA
df1[is.na(df1$day1), ]    # cases where df is NA
df1[!is.na(df1$day1), ]   # cases where df is not NA

# Challenge: Beverly's machine was malfunctioning on day 2!!
# Task: Recode the 999 as NA
# Multiple ways to do this!!
df1
df1_fix1 <- df1 # so we keep the original intact
df1_fix1[5, 3] <- NA

df1_fix2 <- df1
df1_fix2$reading[5] <- NA

df1_fix3 <- df1
df1_fix3[df1_fix3$operator=="Beverly" & df1_fix3$day==2, 3] <- NA

df1_fix4 <- df1
df1_fix4$reading[df1_fix4$operator=="Beverly" & df1_fix4$day==2] <- NA

df1_fix5 <- df1
df1_fix5$reading[df1_fix5$reading == 999] <- NA

## discussion: all of these will work, but #4 is probably the best.  Why?
## - most robust to reordering of the dataset
## - guaranteed to be the right value (eliminates human error from mis-counting indices)







## -----------------
# load some fake data, same as before
day <- c(1, 2, 3, 1, 2, 3)
operator <- c("A", "A", "A", "B", "B", "B")
reading <- c(5, 1, 2, 6, NA, 9)

# the ifelse operator: logical check, vector or value if TRUE, vector or value if FALSE
ifelse(operator=="A", "Arthur", "Beverly")  # single values for TRUE and FALSE
ifelse(operator=="A", reading, 999)  # vector for TRUE
ifelse(operator=="A", 999, reading)  # vector for FALSE



# Other ways of sticking things together
a <- 1:3
b <- 7:9
rbind(a, b)  # by row
cbind(a, b)  # by column
c(a, b)      # lengthwise



# Installing packages!
install.packages("recapr")   # installing a very simple package to your computer
help(vChapman)               # accessing the contents doesn't work yet ...
library("recapr")       # you have to load the package first
help(vChapman)          # ... now it works!

# This might take a few minutes, but we highly recommend this collection
# of packages...
install.packages("tidyverse")

# we'll start working with them soon!



