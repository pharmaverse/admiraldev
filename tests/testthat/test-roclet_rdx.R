# capture_output ----
# Note: any cases that consider conditions can't be tested because the code
# behaves differently in the test environment.
## Test 1: output is captured ----
test_that("capture_output Test 1: output is captured", {
  expect_equal(
    capture_output(1 + 1),
    "[1] 2"
  )
})
