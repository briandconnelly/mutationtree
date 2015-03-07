#' Mutate individuals in the population
#'
#' \code{mutate}
#'
#' @param population A mutationtree population
#' @param mu The mutation rate
#' @return A modified mutationtree population
#'
#' @export
mutate <- function(population, mu)
{
    # TODO: how to pass in distribution info? function ptr?

    assertthat::assert_that(mu >= 0)
    assertthat::assert_that(mu <= 1)

    # Get the number of mutatnts for each type and remove mutants from their
    # original genotype vertex (this seems to work)
    num_mutants <- rbinom(n=igraph::vcount(population),
                          prob=mu,
                          size=igraph::V(population)$abundance)
    igraph::V(population)$abundance <- igraph::V(population)$abundance - num_mutants

    for (ix in seq_along(num_mutants)[num_mutants > 0])
    {
        effects <- rexp(n=num_mutants[ix], rate=1.0/LAMBDA)
        # TODO: make some negative effects
        for (e in effects)
        {
            population <- population + igraph::vertex(first_seen=NA,
                                                      last_seen=NA,
                                                      level=igraph::V(population)$level[ix] + 1,
                                                      abundance=1,
                                                      effect_size=e,
                                                      fitness=max(0, 1 + e),
                                                      num_beneficial=igraph::V(population)[ix]$num_beneficial + ifelse(e > 0, 1, 0),
                                                      num_deleterious=igraph::V(population)[ix]$num_deleterious + ifelse(e < 0, 1, 0))
            population <- population + igraph::edge(igraph::V(population)[igraph::vcount(population)], igraph::V(population)[ix])
        }
    }

    return(population)
}