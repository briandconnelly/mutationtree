#' Create a mutationtree population
#'
#' \code{create_population} creates a mutationtree population. The population is
#' started with one genotype at the root of the tree with \code{size}
#' individuals and fitness \code{base_fitness}.
#'
#' @param size The size of the population
#' @param base_fitness The base fitness of genotypes in the population
#' @return A mutationtree population
#'
#' @export
#'
create_population <- function(size, base_fitness)
{
    assertthat::assert_that(assertthat::is.count(size))
    assertthat::assert_that(is.numeric(base_fitness), length(base_fitness) == 1,
                            base_fitness > 0)

    pop <- igraph::graph.empty(directed=TRUE) +
        igraph::vertex(first_seen=NA, last_seen=NA, level=0, abundance=size,
                       effect_size=0, fitness=base_fitness,
                       num_beneficial=0, num_deleterious=0)
    return(pop)
}