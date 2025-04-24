#' A Demo Function
#'
#' This function is used to demonstrate the custom tags of the `rdx_roclet()`.
#'
#' @param x An argument
#' @param number A number
#' @permitted A number
#' @param letter A letter
#' @permitted [char_scalar]
#' @default The first letter of the alphabet
#' @keywords internal
#' @examplesx
#' @info This is the introduction.
#' @caption A simple example
#' @info This is a simple example showing the default behaviour.
#' @code demo_fun(1)
#' @caption An example with a different letter
#' @info This example shows that the `letter` argument doesn't
#'   affect the output.
#' @code demo_fun(1, letter = "b")
demo_fun <- function(x, number = 1, letter = "a") 42
