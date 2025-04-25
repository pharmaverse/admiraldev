#' Test function
#'
#' @param arg_exp An expected argument
#'
#' @param arg_opt An optional argument
#'
#' @permitted A nice number
#'
#' @param arg_opt2 Another optional argument
#'
#' @default The first letter of the alphabet
#'
#' @examplesx
#' @info This is the introduction.
#' @caption First example
#' @info This example shows the default behavior of the function.
#' @code
#' 1 + 1
#' @caption Second example
#' @info This example issues an expected message
#' @code [expected_cnds = "message"]
#' message("Hello, world!")
test_fun <- function(arg_exp, arg_opt = 42, arg_opt2 = "a") {
  42
}
