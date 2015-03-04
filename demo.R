library(igraph)
library(magrittr)
library(dplyr)
library(ggplot2)
# You'll also need dplyr and assertthat

# TODO: mutationtree package

# TODO:
# * helper function to create node?
# * function to compare two vertices (used to see what mutation(s) separates node and its parent for example)
# * function given a node that returns the list of vertex IDs down to the root (and to the leaf, if applicable)
# * generate fitness distribution from resulting population?
# * class(evolved_pop) returns the class name. Functions could assert that population arg is right kind of class
#    * set class of population to mtpopulation or something: check with "mtpop" %in% class(evolved_pop)

# movie: fitness distribution over time
# movie: distribution of #beneficial mutations over time


#set.seed(21)

GENERATIONS <- 40
POPSIZE <- 1e7
BASE_FITNESS <- 1
MUTATION_RATE <- 1e-5
LAMBDA <- 12

# Create a population and evolve it.
evolved_pop <- create_population(size=POPSIZE, fitness=BASE_FITNESS) %>%
    evolve(generations=GENERATIONS, population_size=POPSIZE, mutation_rate=MUTATION_RATE)

results <- get.data.frame(x=evolved_pop, what='vertices')
ggplot(filter(results, abundance > 0), aes(x=fitness)) + geom_histogram()
