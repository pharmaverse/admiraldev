#' A Test R6 Class
#'
TestClass <- R6::R6Class(
  "TestClass",
  public = list(
    #' @field field A field
    field = NULL,

    #' @description
    #' Initialize a new `TestClass` object
    initialize = function(field) {
      self$field <- field
    }
  )
)
