#' Retrieve a Dataset from the `admiraldev_environment` environment
#'
#' @details
#' Once in a while, we may encounter "locked binding for 'xxx'." errors
#' during the development process while building out functions. This may arise because
#' we want to create dynamic data/objects based on user-inputs that need modification
#' at points in time after the package has been loaded. To manage such data or objects,
#' R has a data structure known as an 'environment'. These environment objects are created
#' at build time, but can be populated with values after the package has been loaded and
#' update those values over the course of an R session.
#'
#' Currently we only support two datasets inside our `admiraldev_environment` object:
#'  - `one_to_many`
#'  - `many_to_one`
#'
#' The purpose of `get_dataset` is to retrieve the datasets contained
#' inside `admiraldev_environment`.
#'
#' @param name The name of the dataset to retrieve
#'
#' @return A `data.frame`
#'
#'
#' @keywords datasets
#' @family datasets
#'
#' @export
get_dataset <- function(name) {
  assert_character_scalar(name, values = c("one_to_many", "many_to_one"))

  admiraldev_environment[[name]]
}
