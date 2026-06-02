#' Checks if the argument equals the auto keyword
#'
#' @param arg argument to check
#'
#' @return `TRUE` if the argument equals the auto keyword, i.e., it is an
#'   expression of a symbol named auto.
#'
#'
#' @keywords is
#' @family is
#' @export
is_auto <- function(arg) {
  is_symbol(arg) && arg == expr(auto)
}

#' Is order vars?
#'
#' Check if inputs are created using `exprs()` or calls involving `desc()`
#' @param arg An R object
#'
#' @return `FALSE` if the argument is not a list of order vars
#'
#' @export
#'
#' @keywords is
#' @family is
is_order_vars <- function(arg) {
  is_desc_call <- function(expr) {
    is_call(expr) &&
      length(expr) == 2L &&
      deparse(expr[[1L]]) == "desc" &&
      is_symbol(expr[[2L]])
  }

  inherits(arg, "list") &&
    all(map_lgl(arg, ~ is.symbol(.x) || is_desc_call(.x)))
}

#' Is this string a valid DTC
#'
#' @param arg A `character` vector
#'
#' @param valid_full_date If `TRUE`, the function will check if the string is a
#'    full date (i.e. it is exactly of the form `"yyyy-mm-dd"` and can be parsed by
#'    `ymd()`).
#'
#' @param valid_full_datetime If `TRUE`, the function will check if the string is a
#' full datetime (i.e. it is exactly of the form `"yyyy-mm-ddThh:mm:ss"` and can be
#' parsed by `ymd_hms()`).
#'
#' @return `TRUE` if the argument is a valid `--DTC` string, `FALSE` otherwise
#'
#' @details If both `check_full_date` and `check_full_time` are set to `FALSE`, the
#' function will only check if the string is a valid DTC string, which can also be a
#' partial date (e.g. `"2024"` or `"2024-05"`) or a partial datetime (e.g.
#' `"2024-05-01T12"`).
#'
#' @export
#' @keywords is
#' @family is
#'
is_valid_dtc <- function(arg, valid_full_date = FALSE, valid_full_datetime = FALSE) {
  twod <- "(\\d{2}|-)"
  pattern <- paste0(
    "^(\\d{4}|-)?",
    "(-", twod, ")?",
    "(-", twod, ")?",
    "(T", twod, ")?",
    "(:", twod, ")?",
    "(:", twod, "(.(\\d{1,5}))?)?$"
  )

  is_valid_format <- str_detect(arg, pattern) | arg == "" | is.na(arg)

  if (valid_full_date) {
    # ymd() will return NA is arg is not a full date
    arg_ymd <- suppress_warning(ymd(arg), "failed to parse")
    is_full_date <- !is.na(arg_ymd) & !is.na(arg)
    is_valid_format & is_full_date
  } else {
    is_full_date <- TRUE
  }

  if (valid_full_datetime) {
    # ymd() will return NA is arg is not a full datetime
    arg_ymd_hms <- suppress_warning(ymd_hms(arg), "failed to parse")
    is_full_datetime <- !is.na(arg_ymd_hms) & !is.na(arg)
  } else {
    is_full_datetime <- TRUE
  }

  is_valid_format & is_full_date & is_full_datetime
}
