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

#' Is this string a valid DTC?
#'
#' @param arg The string to check.
#'
#' @permitted [char_scalar]
#'
#' @param check_dtc If `TRUE`, the function will check if the string is a real,
#' date or datetime (e.g. "2020-02-31" is not real). Note that `NA` is a valid
#' datetime.
#'
#' @permitted [boolean]
#'
#' @return `TRUE` if the argument is a valid `--DTC` string, `FALSE` otherwise
#'
#' @details If `check_dtc` is `FALSE`, the function only checks if the format of the
#' string is valid, i.e. it will not check if the actual date/datetime is real, so
#' calls such as `is_valid_dtc("2020-13", check_dtc = FALSE))` and
#' `is_valid_dtc("2020-12-01T25:00:00", check_dtc = FALSE)` will return`TRUE`.
#'
#' @export
#' @keywords is
#' @family is
#'
is_valid_dtc <- function(arg, check_dtc = FALSE) {
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

  if (check_dtc & !is.na(arg)) {
    parsed_datetime <- parse_date_time(
      arg,
      orders = c("YmdHMS", "Ymd", "YmdHM", "Y", "Ym", "YmdH"),
      quiet = TRUE
    )
    # Check if successfully parsed OR if it is an intentionally missing value
    is_parseable <- !is.na(parsed_datetime)
  } else {
    is_parseable <- TRUE
  }

  is_valid_format & is_parseable
}
