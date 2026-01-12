#' Return English-friendly messaging for object-types
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' This function is *deprecated*, please use `cli` functionality instead.
#'
#' @param x Any R object.
#' @param value Whether to describe the value of `x`.
#' @param length Whether to mention the length of vectors and lists.
#'
#' @details This helper function aids us in forming user-friendly messages that gets
#' called through `what_is_it()`, which is often used in the assertion functions
#' to identify what object-type the user passed through an argument instead of
#' an expected-type.
#'
#' @export
#'
#' @return A string describing the type. Starts with an indefinite
#'   article, e.g. "an integer vector".
#'
#' @keywords deprecated
#' @family deprecated
friendly_type_of <- function(x, value = TRUE, length = FALSE) { # nolint
  lifecycle::deprecate_stop(
    when = "1.1.0",
    what = "admiraldev::friendly_type_of()",
    details = "This function was primarily used in error messaging, and can be replaced
               with 'cli' functionality: `cli::cli_abort('{.obj_type_friendly {letters}}')`."
  )
}

#' @param x The object type which does not conform to `what`. Its
#'   `friendly_type_of()` is taken and mentioned in the error message.
#' @param what The friendly expected type.
#' @param ... Arguments passed to [abort()].
#' @inheritParams args_error_context
#' @noRd
stop_input_type <- function(x,
                            what,
                            ...,
                            arg = rlang::caller_arg(x),
                            call = rlang::caller_env()) {
  # From compat-cli.R
  format_arg <- rlang::env_get(
    nm = "format_arg",
    last = topenv(),
    default = NULL
  )
  if (!is.function(format_arg)) {
    format_arg <- function(x) sprintf("`%s`", x)
  }

  msg <- sprintf(
    "%s must be %s, not %s.",
    format_arg(arg),
    what,
    friendly_type_of(x)
  )
  rlang::abort(msg, ..., call = call)
}
