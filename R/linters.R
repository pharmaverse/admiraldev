#' Custom linter for *DTC/--DTM
#'
#' This linter function checks whether a file contains a comment with "*DTC"
#' or  anywhere in the file, including inline.
#'
#' @param source_file source_file to check
#' @keywords internal
date_convention_linter_source <- function(source_file) {
  lines <- source_file$lines
  pattern <- "#.*(\\*DTC|--DT)"

  lints <- list()

  for (i in seq_along(lines)) {
    line_text <- lines[i]

    if (grepl(pattern, line_text, fixed = FALSE)) {
      match_pos <- regexpr("\\*DTC|--DT", line_text)
      col_num <- if (match_pos > 0) match_pos else 1

      lint <- Lint(
        filename = source_file$filename,
        line_number = i,
        column_number = col_num,
        message = "Please follow the ADaM IG convention and use '--DTC' and '*DTM'.",
        line = lines[i]
      )
      lints <- c(lints, list(lint))
    }
  }

  lints
}

#' Linter object creator for *DTC/--DTM custom linter
#'
#' This function creates the `Linter` object corresponding to
#' `date_convention_linter_source()`.
#'
#' @keywords internal
date_convention_linter <- Linter(
  name = "date_convention_linter_source",
  fun = date_convention_linter_source
)

#' Linter configurations for `{admiral}` family of packages
#'
#' This function lists out the linter configurations for the `{admiral}`
#' family of packages (including custom linters).
#'
#' @keywords internal
admiral_linters <- function() {
  c(
    # Default linters
    linters_with_defaults(
      line_length_linter(100),
      object_usage_linter = NULL,
      cyclocomp_linter(complexity_limit = 20),
      undesirable_function_linter = undesirable_function_linter(
        fun = c(
          "default" = default_undesirable_functions,
          "stop" = "cli::cli_abort()",
          "warning" = "cli::cli_warning()"
        )
      ),
      indentation_linter = NULL
    ),
    # Custom linters
    date_convention_linter
  )
}
