print_population <- function(population)
{
    extant_ix <- igraph::V(population)$abundance > 0

    cat(sprintf('\t* Population Size: %d\n', sum(igraph::V(population)$abundance)))
    cat(sprintf('\t* Nodes: %d\n', igraph::vcount(population)))

    mean_level <- mean(igraph::V(population)$level)
    cat(sprintf('\t* Levels: Min %d, Max %d, Mean %f \n',
                min(igraph::V(population)$level),
                max(igraph::V(population)$level),
                mean(igraph::V(population)$level)))
    cat(sprintf('\t* Extant Genotypes: %d\n', length(extant_ix)))
    cat(sprintf('\t* Max Fitness: %f\n', max(igraph::V(population)[extant_ix]$fitness) ))
}