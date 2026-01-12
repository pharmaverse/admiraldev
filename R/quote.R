#' Enumerate Multiple Elements
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' This function is *deprecated*, please use `cli` functionality instead.
#'
#' @param x A vector or list
#' @param quote_fun Quoting function, defaults to `backquote`. If set to `NULL`,
#'   the elements are not quoted.
#' @param conjunction Character to be used in the message, defaults to `"and"`.
#'
#'
#' @return A `character` vector
#'
#' @keywords deprecated
#' @family deprecated
#'
#' @export
enumerate <- function(x, quote_fun = backquote, conjunction = "and") {
  lifecycle::deprecate_stop(
    when = "1.1.0",
    what = "admiraldev::enumerate()",
    details = "This function was primarily used in error messaging, and can be
               replaced with 'cli' functionality: `cli::cli_abort('{.val {letters[1:3]}}')`"
  )
}

#' Wrap a String in Backquotes
#'
#' @param x A `character` vector
#'
#'
#' @return A `character` vector
#'
#' @keywords quote
#' @family quote
#'
#' @export
backquote <- function(x) {
  paste0("`", x, "`")
}

#' Wrap a String in Single Quotes
#'
#' @param x A `character` vector
#'
#'
#' @return A `character` vector
#'
#' @keywords quote
#' @family quote
#'
#' @export
squote <- function(x) {
  paste0("'", x, "'")
}

#' Wrap a String in Double Quotes
#'
#' Wrap a string in double quotes, e.g., for displaying character values in
#' messages.
#'
#' @param x A character vector
#'
#' @return If the input is `NULL`, the text `"NULL"` is returned. Otherwise, the
#'   input in double quotes is returned.
#'
#'
#' @keywords quote
#' @family quote
#'
#' @export
dquote <- function(x) {
  if (is.null(x)) {
    "NULL"
  } else {
    paste0("\"", x, "\"")
  }
}
