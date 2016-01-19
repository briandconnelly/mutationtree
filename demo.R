library(mutationtree)
library(magrittr)
library(dplyr)
library(igraph)
library(ggplot2)

#set.seed(21)

GENERATIONS <- 40           # Number of generations to evolve for
POPSIZE <- 1e7              # Size of the population
BASE_FITNESS <- 1           # Base fitness for individuals
MUTATION_RATE <- 1e-5       # Mutation Rate
LAMBDA <- 12                # lambda param for exponential distribution of fitness effects

# Create a population and evolve it.
evolved_pop <- create_population(size = POPSIZE, base_fitness=BASE_FITNESS) %>%
    evolve(generations = GENERATIONS, population_size = POPSIZE,
           mutation_rate = MUTATION_RATE)

# Get a data frame containing information about the evolved population (and
# ancestors of extant genotypes)
results <- get.data.frame(x=evolved_pop, what='vertices')

# Plot the distribution of fitnesses among extant types
ggplot(data = filter(results, abundance > 0), aes(x = fitness)) +
    geom_histogram()
