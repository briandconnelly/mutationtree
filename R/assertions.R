is_between_zeroone <- function(x)
{
    assertthat::assert_that(is.numeric(x), length(x) == 1)
    x >= 0 & x <= 1
}

assertthat::on_failure(is_between_zeroone) <- function(call, env)
{
    paste0(deparse(call$x), " is not a numeric value between 0 and 1")
}