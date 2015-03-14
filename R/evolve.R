#' Evolve a population for a number of generations
#'
#' \code{evolve} subjects the given population to a number of rounds of evolution. During this process,
#' the population first reproduces via \code{\link{reproduce}}, creating the next generation.
#'
#' @param population A mutationtree population
#' @param generations The number of generations to evolve (positive integer, default: 1)
#' @param start Start generation number (default: 1)
#' @param population_size The size of the resulting population. Since reproduction is
#' done stochastically, the resulting population may not be this exact value.
#' @param mutation_rate Rate at which mutations arise
#' @param progress Whether or not to show a progress bar (default: TRUE for interactive sessions, FALSE otherwise)
#' @return A modified mutationtree population
#'
#' @note This function simply calls \code{\link{reproduce}},
#' \code{\link{mutate}}, and then \code{\link{prune}} on the population for the
#' specified number of cycles (generations).
#'
#' @seealso \code{\link{reproduce}}
#' @seealso \code{\link{mutate}}
#' @seealso \code{\link{prune}}
#'
#' @export
evolve <- function(population, generations=1, start=1, population_size,
                   mutation_rate, progress=interactive())
{
    assertthat::assert_that(assertthat::is.count(generations), generations > 0)
    assertthat::assert_that(assertthat::is.count(population_size), population_size > 0)
    assertthat::assert_that(is_between_zeroone(mutation_rate))

    if(progress) p <- dplyr::progress_estimated(generations, min_time=0)

    for (gen in seq_len(generations) + start)
    {
        igraph::V(population)[igraph::V(population)$abundance > 0]$last_seen <- gen
        igraph::V(population)[is.na(igraph::V(population)$first_seen)]$first_seen <- gen

        population <- population %>%
            reproduce(popsize=population_size) %>%
            mutate(mu=mutation_rate) %>%
            prune()

        if(progress) p$tick()$print()
    }

    return(population)
}
