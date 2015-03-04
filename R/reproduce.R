reproduce <- function(population, popsize)
{
    assertthat::assert_that(popsize > 0)

    freqdep <- igraph::V(population)$fitness * igraph::V(population)$abundance
    igraph::V(population)$abundance <- rbinom(n=igraph::vcount(population),
                                              prob=freqdep/sum(freqdep),
                                              size=popsize)
    return(population)
}