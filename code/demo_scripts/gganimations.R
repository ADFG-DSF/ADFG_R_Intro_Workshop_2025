#ggplot Animation Examples

library(ggplot2)
library(gganimate)
library(gapminder)

p <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(title = "Year: {frame_time}", x = "GDP per capita", y = "life expectancy")

anim <- p + transition_time(year) +
  ease_aes("linear")

anim


### Babynames Animation
library(babynames)
library(tidyverse)
library(gganimate)

# Step 1: Add decade column
babynames_decade <- babynames %>%
  mutate(decade = floor(year / 10) * 10)

# Step 2: Find top *peaking* name per decade (not just total n)
peak_names_by_decade <- babynames_decade %>%
  group_by(name) %>%
  filter(n == max(n)) %>%              # get year of peak for each name
  slice(1) %>%                         # in case of ties
  ungroup() %>%
  mutate(peak_decade = floor(year / 10) * 10) %>%
  group_by(peak_decade) %>%
  slice_max(order_by = n, n = 1) %>%   # get name peaking in that decade with highest value
  ungroup()

# Step 3: Filter main data to only those names
selected_names <- unique(peak_names_by_decade$name)

filtered_data <- babynames %>%
  filter(name %in% c("George", "Jason", "Logan", "Cody","Matthew"))

# Step 4: Aggregate to one row per name/year
filtered_summary <- filtered_data %>%
  group_by(year, name) %>%
  summarise(n = sum(n), .groups = "drop")

# Step 5: Animate
p <- ggplot(filtered_summary, aes(x = year, y = n, color = name, group = name)) +
  geom_line(size = 1.2) +
  labs(title = "Baby Name Popularity",
       x = "Year", y = "Number of Babies",
       color = "Name") +
  theme_minimal(base_size = 14) +
  transition_reveal(year)+scale_x_continuous(breaks = seq(1880,2010,10))

animate(p, fps = 4, width = 900, height = 500, duration = 10)


