#' Remove extinct leaf nodes from the population graph
#'
#' To help minimize the size of a graph, \code{prune} removes nodes that both
#' have zero abundance and are leaves (i.e., have no children). This second
#' condition is added so that extant lineages with extinct parents aren't
#' pruned. While more aggressive pruning is perhaps possible, this should remove
#' most unneeded nodes over time.
#'
#' @param population A mutationtree population
#' @return A pruned mutationtree population
#'
#' @export
prune <- function(population)
{
    # Prune extinct leaf nodes
    indices <- seq_len(igraph::vcount(population))
    prune_ix <- intersect(indices[igraph::degree(graph=population, mode='in')==0],
                          indices[igraph::V(population)$abundance == 0])
    population <- igraph::delete.vertices(graph=population, v=igraph::V(population)[prune_ix])
    return(population)
}