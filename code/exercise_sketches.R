### ADFG R Intro Workshop 2025
### Section 3: Basic Programming I

### Exercises


# ------------ part 1 ------------ #

# (a)
# A sample of fish were aged, and the associated counts are given in the
# vector below.  Modify this line of code to store this vector to a variable
# named "counts_by_age".
c(42, 81, 19, 12, 7)

# (b)
# We will estimate the proportions of each age, but first, use the sum() function
# to calculate the total of counts_by_age.
## Answer: 161


# (c)
# Store this to a new variable named "n".


# (d)
# Now, calculate a vector of estimated proportions, calculated as counts/total.
# Store this to a new variable named "p_hat".
## Answer: 0.26086957 0.50310559 0.11801242 0.07453416 0.04347826


# (e)
# Calculate the estimated variance of the proportions.  The formula is
# p_hat * (1 - p_hat) / (n - 1)
## Answer: 0.0012051040 0.0015624397 0.0006505343 0.0004311176 0.0002599244


# (f)
# Now, calculate the standard error of the proportions.  Remember: SE = sqrt(V_hat).
# Add a comment to clarify the calculation, in case someone is reading your code
# who doesn't know the relationship between estimated variance and standard error.
## Answer: 0.03471461 0.03952771 0.02550557 0.02076337 0.01612217


# Yay for vector math!  Note that non-specific names such as "n", "p_hat", etc.
# aren't always the best choices for programming, but these will likely match
# the equations in an Operational Plan.




# ------------ part 2 ------------ #

# Total catch and hours fished are recorded for 5 vessels below.
total_catch <- c(234, 564, 123, 87, 345)
hours_fished <- c(12, 24, 36, NA, 48)      # number 4 forgot to record it
vessel_name <- c("Alexander the Grape",
                 "Billy Bob's Bastion of Buoyancy",
                 "Classical Classifier",
                 "Dramamine Drama",
                 "Empress of Empiricality")

# (a)
# Calculate catch per unit effort (CPUE) for all 5 vessels (hint: total/hours)
## Answer: 19.500000 23.500000  3.416667        NA  7.187500

# (b)
# Use the mean() function to calculate the average CPUE for non-missing data.
# To do this, add an argument to mean() to remove the NA.  If you don't remember
# the argument to add, try running help(mean) or ?mean in the console.
## Answer: 13.40104




# ------------ part 3 ------------ #

# (a)
# Try running the following code.  Resist the urge to add the missing parenthesis.
something <- (1 + 1

# Note that the usual ">" thing and the cursor are missing.
# Click in the Console and hit the <esc> key.  Whew!

# Note: trying to run any code after this line probably would have errored and
# escaped the uneven parentheses, but <esc> is the cleanest.



# (b)
# Now try running this.
while(TRUE) cat(sample(0:9, 1))

# Try not to panic and click the friendly red stop sign :)

x <- sample(-500:100, 35)
while(TRUE) {
  x <- x-1
  x[x < -500] <- sample(100:200, sum(x < -500))
  y <- ifelse(x > 0, sample(0:9, sum(x > 0), replace = TRUE), " ")
  cat(paste(y, collapse=""), "\n")
  Sys.sleep(0.02)
}


x <- seq(0, 2.5, length.out=7)
while(TRUE) {
  cat(paste(ifelse(1:60 %in% round(30 * sin(x) + 30), "*", " "), collapse = ""), "\n")
  x <- x + seq(0.06, 0.1, length.out=7) #0.08   ### haha try seq() or even rnorm() here
  Sys.sleep(0.02)
}



while(TRUE) {
  cat(paste(ifelse(1:60 %in% round(30 * (1 + sin(3*as.POSIXlt(Sys.time())$sec + (1:8)/3))), "*", " "), collapse = ""), "\n")
  Sys.sleep(0.02)
}


# ------------ Bonus! ------------ #

# Load the vector of lengths below.
length_cm <- c(22, 22, 24, 25, 26, 28, 30, 30, 30, 32,
               34, 37, 37, 38, 39, 44, 45, 47, 49, 49)

# (a)
# Create a vector of binned lengths using the cut() function.  Inspect this
# new vector and see what the cut() function did.
length_cm_cut <- cut(length_cm, breaks = c(20, 30, 40, 50))

# (b)
# What kind of variable is length_cm_cut?


# (c)
# Tabulate (count) the totals in each 10-cm category using the table() function.
table(length_cm_cut)


# (d)
# Inspect the length measurements (length_cm) again.  How did cut() handle
# measurements that were equal to values in breaks=?


# (e)
# Okay, that's a little annoying, since our tables are typically closed on the
# left instead of the right; in this case we might want:
# 20 <= length_cm < 30 (including 20 but not including 30)
# 30 <= length_cm < 40 (including 30 but not including 40), etc.

# Look at ?cut.  Modify the code below, changing the default value of right=
# to make the table more ADFG-typical.
## Answer:
## length_cm_cut
## [20,30) [30,40) [40,50)
##       6       9       5
length_cm_cut <- cut(length_cm, breaks = c(20, 30, 40, 50))
table(length_cm_cut)








### ADFG R Intro Workshop 2025
### Section 4: Basic Programming II

### Exercises


# ------------ part 1 ------------ #
# Run the following code to load data vector x.
x <- c(7, 2, 6, 8, 6, 3, 2, 5, 8, 2)     # yes, I totally just mashed some keys

# (a)
# Modify the code below to return the third element of x.
x[]

# (b)
# Now return elements 1 through 5 of x.  Hint: remember :?

# (c)
# Use the operator <- to assign the value 999 to the first 5 elements of x.
# For some reason.




# ------------ part 2 ------------ #

# Run the following code to load a data frame.  Inspect the results.
catch_data <- data.frame(Sex = rep(c("F", "M"), 6),
                         Length = c(395.1, 345.3, 364.1, 560.5, 306.1, 473.6,
                                    374.1,  19.6,  16.5,  19.8,  15.0,  12.8),
                         Tech = c(rep("Arthur", 4), rep("Beverly", 3), rep("Chuck", 5)))
catch_data

# (a)
# Modify the code below to return just the first row.
catch_data[]

# Modify the code below to return just the Length column (using square brackets).
catch_data[]

# Now return the Length column by its name (hint: you can resort to bribery)
catch_data


# (b)
# Oh noes!! Chuck recorded his measurements in inches, not mm!  Good news, we can
# fix this.  First, modify the code below to construct a logical statement to
# return just the Length measurements associated with Chuck.
## Answer: 19.6 16.5 19.8 15.0 12.8
catch_data$Length[]

# Use this logical statement in an ifelse() to construct a new column of lengths
# that are converted to mm if needed.
## Answer:
# > catch_data$Length_fix
# [1] 395.10 345.30 364.10 560.50 306.10 473.60
# 374.10 497.84 419.10 502.92 381.00 325.12
catch_data$Length_fix <- ifelse(,                       # logical statement here
                                catch_data$Length*25.4, # if TRUE (convert to mm)
                                )                       # if FALSE (leave it alone)


# ------------ part 3 ------------ #

# Run the following code to load a data frame.  Inspect the results.
weir_data <- data.frame(Year = c(rep(2023, 4), rep(2024, 6), rep(2025, 5)),
                        Channel = c("West", NA, "West", "East", "East",
                                    "East", "East", "West", "West", "East",
                                    "East", "East", "West", NA, "West"),
                        Length_mm = c(313, 346, 362, 309, 211, 334, 324, 358,
                                      287, 335, 264, 388, 319, 310, 283))
weir_data

# (a)
# Calculate the average (mean) length measurement.  Your manager wants to know.
## Answer: 316.2


# (b)
# Now your manager is asking for the average length for 2025.  It's what managers do.
# Hint: use a logical statement to take a subset.
## Answer: 312.8


# (c)
# What is the average length where the Channel was not missing (i.e. not NA)?
## Answer: 314.3846

# (bonus)
# Run the following statements:
sum(is.na(weir_data$Channel))
mean(is.na(weir_data$Channel))
# What do these answers represent?
# How does this calculation work?
