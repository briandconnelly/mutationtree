# mutationtree
Tree-based model for studying mutation dynamics

## Installation

```r
install.packages("devtools")
devtools::install_github("briandconnelly/mutationtree")
```

## Demo

See `[demo.R](demo.R)` for a simple demonstration.


## Distribution of Fitness Effects

The goal is to allow arbitrary distributions of fitness effects from mutations to be specified. Right now, an exponential distribution is used (see `[mutate.R](R/mutate.R)`, line 25).
