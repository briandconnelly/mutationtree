create_population <- function(size, fitness)
{
    assertthat::assert_that(size > 0)
    assertthat::assert_that(fitness > 0)

    pop <- igraph::graph.empty(directed=TRUE) +
        igraph::vertex(first_seen=NA, last_seen=NA, level=0, abundance=size,
                       fitness=fitness,  num_beneficial=0, num_deleterious=0)
    return(pop)
}