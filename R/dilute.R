dilute <- function(population, dfactor)
{
    assertthat::assert_that(dfactor >= 0 & dfactor <= 1)
    curr_abundance <- igraph::V(population)$abundance

    igraph::V(population)$abundance <- rbinom(n=length(curr_abundance),
                                              size=curr_abundance,
                                              prob=dfactor)
}
