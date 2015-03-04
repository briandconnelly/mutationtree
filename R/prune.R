prune <- function(population)
{
    # Prune extinct leaf nodes
    indices <- seq_len(igraph::vcount(population))
    prune_ix <- intersect(indices[igraph::degree(graph=population, mode='in')==0],
                          indices[igraph::V(population)$abundance == 0])
    population <- igraph::delete.vertices(graph=population, v=igraph::V(population)[prune_ix])
    return(population)
}