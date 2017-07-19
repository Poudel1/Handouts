## lm

animals <- read.csv('data/animals.csv', stringsAsFactors = FALSE, na.strings = '')
fit <- lm(
  log(weight) ~ hindfoot_length,
  data = animals)
summary(fit)

animals$species_id <- factor (animals$species_id)
fit <- lm(
  log(weight)~species_id,
  data = animals)
summary(fit)

library(dplyr)
fit <- lm (
  hindfoot_length ~ weight+species_id,
  data = animals)
  

## glm

animals$sex <- 
fit <- glm(sex ~ hindfoot_length,
           ...,
           data = animals)

## lme4

# install.packages('lme4')

library(lme4)
library(lmer)
fit <- lmer(log(weight) ~ (1 | species_id) + hindfoot_length,
            data = animals)
fit.lmer <- lmer(log(weight) ~ (1 | species_id) + hindfoot_length,
            data = animals)
summary(fit.lmer)
fit <- lm(log(weight)~species_id, data = animals)
summary(fit)
fit <- glm(log(weight)~species_id, data = animals)   
summary(fit)
fit.glm <- glm(log(weight)~species_id, data = animals)  

animals$sex <- factor(animals$sex)
fit <- glm(weight ~ hindfoot_length,
           family = gaussian (link="log",
           data = animals)


fit <- lmer(...,
            data = animals)

animals$sex <- factor (animals$sex),
fit <- glm (sex ~hindfoot_length,
            family=binomial,
            data=animals)


## RStan

library(dplyr)
library(rstan)
stanimals <- animals %>%
  select(weight, species_id, hindfoot_length) %>%
  na.omit() %>%
  mutate(log_weight = log(weight),
         species_idx = as.integer(factor(species_id))) %>%
  select(-weight, -species_id)
stanimals <- c(
  N = nrow(stanimals),
  M = max(stanimals$species_idx),
  as.list(stanimals))

samp <- stan(file = 'worksheet-6.stan',
             data = stanimals,
             iter = 1000, chains = 3)
saveRDS(samp, 'stanimals.RDS')



