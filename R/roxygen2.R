# THIS FILE INCLUDES FUNCTIONS THAT ARE RE-USED THROUGHOUT
# roxygen2 COMMENTS TO GENERATE DOCUMENTATION TEXT

#' Standard Text for the `dataset` Argument
#'
#' This function provides standardized documentation text for the `dataset`
#' argument used in `{admiral}` functions.
#'
#' The benefits of having a programmatic way to write documentation is that if
#' any changes need to be made, modifying this function scales across the
#' codebase, can be tested, and is less prone to user-error such as typos or
#' grammar mistakes.
#'
#' @param expected_vars Variables expected in the dataset
#'
#'   A character vector of variable names expected to be present in the
#'   `dataset` argument.
#'
#'   *Permitted values*: A character vector or `NULL`
#'
#'   *Default value*: `NULL`
#'
#' @returns A character string with the standardized documentation text for
#'   the `dataset` argument
#'
#' @keywords roxygen_helper
#' @family roxygen_helper
#'
#' @export
#'
#' @examples
#' roxygen_param_dataset()
#'
#' roxygen_param_dataset(expected_vars = c("by_vars"))
roxygen_param_dataset <- function(expected_vars = NULL) {
  if (is.null(expected_vars)) {
    dataset_text <- "Input dataset"
  } else {
    dataset_text <- paste0(
      "Input dataset \n \n",
      "The variables specified by the ",
      cli::ansi_collapse(map_chr(expected_vars, ~ paste0("`", ., "`"))),
      " argument",
      if_else(length(expected_vars) > 1, "s", ""),
      " are expected to be in the dataset."
    )
  }
  dataset_text
}

#' Standard Text for the `by_vars` Argument
#'
#' This function provides standardized documentation text for the `by_vars`
#' argument used in `{admiral}` functions.
#'
#' The benefits of having a programmatic way to write documentation is that if
#' any changes need to be made, modifying this function scales across the
#' codebase, can be tested, and is less prone to user-error such as typos or
#' grammar mistakes.
#'
#' @param rename Should the renaming feature be documented?
#'
#'   If `TRUE`, the text includes information about renaming variables using
#'   named elements in `by_vars`.
#'
#'   *Permitted values*: `TRUE`, `FALSE`
#'
#'   *Default value*: `FALSE`
#'
#' @returns A character string with the standardized documentation text for
#'   the `by_vars` argument
#'
#' @keywords roxygen_helper
#' @family roxygen_helper
#'
#' @export
#'
#' @examples
#' roxygen_param_by_vars()
#'
#' roxygen_param_by_vars(rename = TRUE)
roxygen_param_by_vars <- function(rename = FALSE) {
  by_vars_text <- ""

  if (rename) {
    by_vars_text <- paste0(
      by_vars_text,
      "Variables can be renamed by naming the element, i.e. \n",
      "`by_vars = exprs(<name in input dataset> = <name in additional dataset>)`, ",
      "similar to the `dplyr` joins."
    )
  }

  by_vars_text
}

#' Standard Text for NA Handling in Sorting Variables
#'
#' This function provides standardized documentation text about the handling
#' of `NA` values in sorting variables.
#'
#' The benefits of having a programmatic way to write documentation is that if
#' any changes need to be made, modifying this function scales across the
#' codebase, can be tested, and is less prone to user-error such as typos or
#' grammar mistakes.
#'
#' @returns A character string with the standardized documentation text about
#'   NA handling in sort order
#'
#' @keywords roxygen_helper
#' @family roxygen_helper
#'
#' @export
#'
#' @examples
#' roxygen_order_na_handling()
roxygen_order_na_handling <- function() {
  paste(
    "For handling of `NA`s in sorting variables see the \"Sort Order\" section",
    "in `vignette(\"generic\")`."
  )
}

#' Standard Note for Memory-Intensive Functions
#'
#' This function provides a standardized note about memory consumption for
#' functions that create large temporary datasets.
#'
#' The benefits of having a programmatic way to write documentation is that if
#' any changes need to be made, modifying this function scales across the
#' codebase, can be tested, and is less prone to user-error such as typos or
#' grammar mistakes.
#'
#' @returns A character string with the standardized note about memory usage
#'
#' @keywords roxygen_helper
#' @family roxygen_helper
#'
#' @export
#'
#' @examples
#' roxygen_save_memory()
roxygen_save_memory <- function() {
  paste(
    "**Note:** This function creates temporary datasets which may be much bigger",
    "than the input datasets. If this causes memory issues, please try setting",
    "the admiral option `save_memory` to `TRUE` (see `set_admiral_options()`).",
    "This reduces the memory consumption but increases the run-time.",
    sep = "\n"
  )
}
