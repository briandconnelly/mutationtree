#' Grow the population, reproducing to given capacity
#'
#' \code{reproduce} allows the population to grow to the given capacity.
#' Reproduction is done using fitness-proportional selection based on the
#' fitness associated with each genotype.
#'
#' @param population A mutationtree population
#' @param popsize The size of the resulting population. Since reproduction is
#' done stochastically, the resulting population may not be this exact value.
#' @param A modified mutationtree population
#'
#' @export
reproduce <- function(population, popsize)
{
    assertthat::assert_that(popsize > 0)

    freqdep <- igraph::V(population)$fitness * igraph::V(population)$abundance
    igraph::V(population)$abundance <- rbinom(n=igraph::vcount(population),
                                              prob=freqdep/sum(freqdep),
                                              size=popsize)
    return(population)
}