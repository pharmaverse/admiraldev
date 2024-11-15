#' Deprecation with Soft Message
#'
#' Wrapper around `lifecycle::deprecate_soft()`
#'
#' @param ...
#'
#' @return Return value of the expression
#'
#' @keywords messages
#' @family messages
#'
#' @details
#'
#' @export
deprecate_inform <- function(...) {
  tryCatch(
    lifecycle::deprecate_soft(...),
    warning = \(w) {
      message(conditionMessage(w))
      tryInvokeRestart("muffleWarning")
    }
  )
}
