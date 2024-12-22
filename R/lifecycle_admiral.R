#' Deprecation with Soft Message
#'
#' Wrapper around `lifecycle::deprecate_soft()`.
#'
#' @param when See documentation for `lifecycle::deprecate_soft()`.
#' @param what See documentation for `lifecycle::deprecate_soft()`.
#' @param with See documentation for `lifecycle::deprecate_soft()`.
#' @param details See documentation for `lifecycle::deprecate_soft()`.
#' @param id See documentation for `lifecycle::deprecate_soft()`.
#' @param env See documentation for `lifecycle::deprecate_soft()`.
#' @param user_env See documentation for `lifecycle::deprecate_soft()`.
#' @return `NULL`, invisibly.
#'
#' @examples
#' # A Phase 1 deprecated function with custom bulleted list:
#' deprecate_inform(
#'   when = "1.0.0",
#'   what = "foo()",
#'   details = c(
#'     x = "This message will turn into a warning with release of x.y.z",
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
deprecate_inform <- function(
    when,
    what,
    with = NULL,
    details = NULL,
    id = NULL,
    env = rlang::caller_env(),
    user_env = rlang::caller_env(2)) {
  tryCatch(
    lifecycle::deprecate_soft(
      when = when,
      what = what,
      with = with,
      details = details,
      id = id,
      env = env,
      user_env = user_env
    ),
    warning = \(w) {
      message(conditionMessage(w))
      tryInvokeRestart("muffleWarning")
    }
  )
}
