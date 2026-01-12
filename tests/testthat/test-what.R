# what_is_it ----
## Test 1: deprecation error if function is called ----
test_that("what_is_it Test 1: deprecation error if function is called", {
  expect_error(
    what_is_it(NULL),
    class = "lifecycle_error_deprecated"
  )
})
