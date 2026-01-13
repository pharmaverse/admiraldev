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
}
