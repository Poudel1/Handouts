## Getting started

library(dplyr)
library(ggplot2)
animals <- read.csv('data/animals.csv', na.strings = '') %>%
  filter(!is.na(species_id), !is.na(sex), !is.na(weight))

## Constructing layered graphics in ggplot

ggplot(data=animals,
       aes(x= species_id, y= weight)) + 
geom_point()

ggplot(data = animals,
       aes(x = species_id, y = weight)) +
 geom_boxplot()

ggplot(data = animals,
       aes(x = species_id, y = weight)) +
  geom_boxplot() +
  geom_point(stat = "summary",
             fun.y ="mean",
            color = "red")

ggplot(data = animals,
       aes(x = species_id, y = weight, color = species_id)) +
  geom_boxplot() +
  geom_point(stat = 'summary',
             fun.y = 'mean')

## Exercise 1

library(dplyr)
library(ggplot2)
dm <- filter (animals, species_id== "DM")
ggplot (data= dm,
aes (x=year, y=weight, color=sex)) +
  geom_line (stat= "summary",
             fun.y= "mean")

## Adding a regression line

levels(animals$sex) <- c('Female', 'Male')
animals_dm <- filter(animals, species_id == "DM")
ggplot(data = animals_dm,
       aes(x = year, y = weight)) +
  geom_point(aes(shape=sex),
             size = 3,
             stat = 'summary',
             fun.y = 'mean') +
  geom_smooth(method = "lm")

ggplot(data = animals_dm,
       aes(x = year, y = weight)) + 
  geom_point(aes(shape = sex),
             size = 3,
             stat = 'summary',
             fun.y = 'mean') +
  geom_smooth(aes (group=sex), method= "lm")

ggplot(data = animals_dm,
       aes(x=year, y=weight, color=sex)) + 
  geom_point(aes(shape = sex),
             size = 3,
	           stat = 'summary',
	           fun.y = 'mean') +
  geom_smooth(method = 'lm')

# Storing and re-plotting

year_wgt <- ggplot(data = animals_dm,
                   aes(x = year,
                       y = weight,
                       color = sex)) +
  geom_point(aes(shape = sex),
             size = 3,
             stat = 'summary',
             fun.y = 'mean') +
  geom_smooth(method = 'lm')

year_wgt +
  scale_color_manual(values= c("darkblue", "orange"))
                     
year_wgt <- year_wgt +
  scale_color_manual(values = c("blue", "purple"))
year_wgt

## Exercise 2


ggplot(data = animals_dm,
                   aes(x=weight,
                       fill= sex)) +
geom_histogram (binwidth = 0.5) 
 
ggplot(data = animals_dm,
       aes(x=weight,
           fill= sex)) +
  geom_histogram (binwidth = 0.90)

histo <- histo + labs (title = "dipodmys merriami weight distribution", x = 'Weight (g)', y = 'Count')
+scale_x_continuous(limits = c(20,60), breaks = c(20, 30, 40, 50, 60))

histo <- histo+ theme_bw ()+
  theme(legend.position = c(0.2, 0.5),
        plot.title = element_text (face="bold", vjust=2, hjust=,
        )


animals_common <- filter (animals, species_id %in% c("DM, "DO, "PP"))
        
## Axes, labels and themes

histo <- ggplot(data = animals_dm,
                aes(x = weight, fill = sex)) +
  geom_...
histo

histo <- histo +
  ...(title = 'Dipodomys merriami weight distribution',
       x = 'Weight (g)',
       y = 'Count') +
  scale_x_continuous(limits = c(20, 60),
                     breaks = c(20, 30, 40, 50, 60))
histo

histo <- histo +
  theme_bw() +
  theme(legend.position = c(0.2, 0.5),
        plot.title = ...,
        ... = element_text(...),
        ... = element_text(size = 13, vjust = 0))
histo

## Facets

animals_common <- filter(animals, ...)
ggplot(data = ...,
       ...) +
  geom_histogram() +
  ...
  labs(title = "Weight of most common species",
       x = "Count",
       y = "Weight (g)")

ggplot(data = animals_common,
       aes(x = weight)) +
  geom_histogram(...,
                 ...) +
  geom_histogram() +
  facet_wrap( ~ species_id) +
  labs(title = "Weight of most common species",
       x = "Count",
       y = "Weight (g)")

ggplot(data = animals_common,
       aes(x = weight, ...)) +
  geom_histogram(...) +
  facet_wrap( ~ species_id) +
  labs(title = "Weight of most common species",
       x = "Count",
       y = "Weight (g)") +
  guides(fill = FALSE)		

## Exercise 3

...

