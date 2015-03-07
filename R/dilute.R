#' Dilute a population
#'
#' \code{dilute} thins a population by a given factor.
#'
#' @param population A mutationtree population
#' @param dfactor The dilution factor, a value in the range [0,1]
#' @return A diluted population
#'
#' @export
dilute <- function(population, dfactor)
{
    assertthat::assert_that(dfactor >= 0 & dfactor <= 1)
    curr_abundance <- igraph::V(population)$abundance

    igraph::V(population)$abundance <- rbinom(n=length(curr_abundance),
                                              size=curr_abundance,
                                              prob=dfactor)
    return(population)
}
