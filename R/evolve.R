evolve <- function(population, generations=1, start=1, population_size, mutation_rate)
{
    assertthat::assert_that(generations > 0)
    assertthat::assert_that(population_size > 0)
    assertthat::assert_that(mutation_rate >= 0)

    p <- dplyr::progress_estimated(generations, min_time=0)

    for (gen in seq_len(generations) + start)
    {
        igraph::V(population)[igraph::V(population)$abundance > 0]$last_seen <- gen
        igraph::V(population)[is.na(igraph::V(population)$first_seen)]$first_seen <- gen

        population <- population %>%
            reproduce(popsize=population_size) %>%
            mutate(mu=mutation_rate) %>%
            prune()

        p$tick()$print()
    }

    return(population)
}