# friendly_type_of ----
## Test 1: deprecation error if function is called ----
test_that("friendly_type_of Test 1: deprecation error if function is called", {
  expect_error(
    friendly_type_of(mtcars),
    class = "lifecycle_error_deprecated"
  )
})
