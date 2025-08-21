date_convention_linter_source <- function(source_file) {

  # Return empty list if file cannot be parsed
  if (is.null(source_file$xml)) {
    return(list())
  }

  # Find all comments and scan for *DTC and/or --DT #nolint
  comments <- xml_find_all(source_file$xml, ".//COMMENT")
  pattern <- "\\*DTC|--DT"

  lints <- lapply(comments, function(comment) {
    comment_text <- xml_text(comment)
    if (grepl(pattern, comment_text, fixed = FALSE)) {
      line_num <- as.integer(xml_attr(comment, "line1"))
      col_num <- as.integer(xml_attr(comment, "col1"))
      Lint(
        filename = source_file$filename,
        line_number = line_num,
        column_number = col_num,
        linter = "dtc_comment_linter",
        message = "Please follow the ADaM IG convention and use '--DTC' and '*DTM'.",
        line = source_file$lines[line_num]
      )
    } else {
      NULL
    }
  })

  Filter(Negate(is.null), lints)
}

# Create the Linter object that lintr can use
date_convention_linter <- Linter(
  name = "date_convention_linter_source",
  fun = date_convention_linter_source
)

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
