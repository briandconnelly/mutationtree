#' Return whether a given value is between 0 and 1, inclusive
#'
#' \code{is_between_zerooone} returns a boolean value indicating whether (TRUE)
#' or not (FALSE) the given value is numeric and between 0 and 1, inclusive.
#'
#' @param x Some numeric value (scalar)
#' @return \code{TRUE} if \code{x} is a single numeric value in the range [0,1],
#' and \code{FALSE} otherwise.
#'
is_between_zeroone <- function(x)
{
    assertthat::assert_that(is.numeric(x), length(x) == 1)
    x >= 0 & x <= 1
}


# Register a message for when is_between_zeroone fails with assertthat
assertthat::on_failure(is_between_zeroone) <- function(call, env)
{
    paste0(deparse(call$x), " is not a numeric value between 0 and 1")
}
