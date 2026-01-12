#' What Kind of Object is This?
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' This function is *deprecated*, please use `cli` functionality instead.
#'
#' @param x Any R object
#'
#' @return A `character` description of the type of `x`
#'
#'
#' @keywords deprecated
#' @family deprecated
#'
#' @export
what_is_it <- function(x) {
  lifecycle::deprecate_stop(
    when = "1.1.0",
    what = "admiraldev::what_is_it()",
    details = "This function was primarily used in error messaging, and can be replaced
               with 'cli' functionality: `cli::cli_abort('{.obj_type_friendly {letters}}')`."
  )

  if (is.null(x)) {
    "`NULL`"
  } else if (is.factor(x)) {
    "a factor"
  } else if (is.symbol(x)) {
    "a symbol"
  } else if (isS4(x)) {
    sprintf("a S4 object of class '%s'", class(x)[1L])
  } else if (is.atomic(x) && length(x) == 1L) {
    if (is.character(x)) {
      paste0("`\"", x, "\"`")
    } else {
      paste0("`", x, "`")
    }
  } else if (is.atomic(x) || class(x)[1L] == "list") {
    friendly_type_of(x)
  } else if (is.data.frame(x)) {
    "a data frame"
  } else {
    sprintf("an object of class '%s'", class(x)[1L])
  }
}
