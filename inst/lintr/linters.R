#' Linter configurations for `{admiral}` family of packages
#'
#' This function lists out the linter configurations for the `{admiral}`
#' family of packages.
#'
#' @param line_length Line length linter
#' @param object_usage Object usage linter
#' @param cyclocomp Cyclomatic complexity linter
#' @param indentation Indentation linter
#' @param undesirable_function Undesirable function linter
#' @param ... Any additional default linters to specify for use within the package
#'
#' @details
#' Default configurations of special note:
#'   - Enforcing the use of `cli::cli_abort()` over `stop()`
#'   - Enforcing the use of `cli::cli_warn()` over `warning()`
#'   - Enforcing the use of `cli::cli_inform()` over `message()`
#'   - Enforcing the use of  vectorized `dplyr::if_else()`  over `ifelse()`
#'   - Enforcing the use of `stringr::str_detect()` over `grepl()`
#'
#' @keywords internal
#'
#' @examples
#' library(admiraldev)
#' library(lintr)
#'
#' # The code below should reside in .lintr.R file
#' linters <- admiraldev:::admiral_linters(
#'   line_length = line_length_linter(80),
#'   indentation = NULL
#' )
#'
admiral_linters <- function(
    line_length = line_length_linter(100),
    object_usage = NULL,
    cyclocomp = cyclocomp_linter(complexity_limit = 20),
    indentation = NULL,
    undesirable_function = undesirable_function_linter(
      fun = c(
        default_undesirable_functions,
        "stop" = "please use cli_abort() from the {cli} package",
        "warning" = "please use cli_warning() from the {cli} package",
        "message" = "please use cli_inform() from the {cli} package",
        "ifelse" = "please use vectorized if_else() from the {dplyr} package",
        "grepl" = "please use str_detect() from the {stringr} package"
      ),
      symbol_is_undesirable = TRUE
    ),
    ...) {
  c(
    linters_with_defaults(
      # Add default linters below
      line_length_linter = line_length,
      object_usage_linter = object_usage,
      cyclocomp_linter = cyclocomp,
      indentation_linter = indentation,
      undesirable_function_linter = undesirable_function,
      ...
    )
    # Add custom linters below
  )
}
