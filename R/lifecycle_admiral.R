#' Deprecation with Soft Message
#'
#' Wrapper around `lifecycle::deprecate_soft()`.
#'
#' @param env See documentation for `lifecycle::deprecate_soft()`.
#'
#' @param user_env See documentation for `lifecycle::deprecate_soft()`.
#'
#' @param ... See documentation for `lifecycle::deprecate_soft()` for additional argument use.
#'
#' @return `NULL`, invisibly.
#'
#' @examples
#' # A Phase 1 deprecated function with custom bulleted list:
#' deprecate_inform(
#'   when = "1.0.0",
#'   what = "foo()",
#'   details = c(
#'     #     'x = "This message will turn into a warning with release of x.y.z",
#'     i = "See admiral's deprecation guidance:
#' https://pharmaverse.github.io/admiraldev/dev/articles/programming_strategy.html#deprecation"
#'   )
#' )
#'
#' @keywords messages
#' @family messages
#'
#'
#' @export
deprecate_inform <- function(...) {
  tryCatch(
    lifecycle::deprecate_soft(
      env = caller_env(),
      user_env = caller_env(),
      ...),
    warning = \(w) {
      message(conditionMessage(w))
      tryInvokeRestart("muffleWarning")
    }
  )
}
