#' Linter configurations for `{admiral}` family of packages
#'
#' This function lists out the linter configurations for the `{admiral}`
#' family of packages.
#'
#' @details
#' Configurations of special note:
#'   - Enforcing the use of `cli::cli_abort()` over `stop()`
#'   - Enforcing the use of `cli::cli_warn()` over `warning()`
#'   - Enforcing the use of  vectorized `dplyr::if_else()`  over `ifelse()`
#'   - Enforcing the use of `stringr::str_detect()` over `grepl()`
#'
#' @keywords internal
admiral_linters <- function() {
  c(
    # Default linters
    linters_with_defaults(
      line_length_linter(100),
      object_usage_linter = NULL,
      cyclocomp_linter(complexity_limit = 20),
      indentation_linter = NULL,
      undesirable_function_linter = undesirable_function_linter(
        fun = c(
          default_undesirable_functions,
          "stop" = "please use cli_abort() from the {cli} package",
          "warning" = "please use cli_warning() from the {cli} package",
          "ifelse" = "please use vectorized if_else() from the {dplyr} package",
          "grepl" = "please use str_detect() from the {stringr} package"
        )
      )
    )
  )
}
