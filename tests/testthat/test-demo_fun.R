# demo_fun ----

## Test 1: returns 42 ----
test_that("demo_fun Test 1: returns 42", {
  expect_equal(demo_fun("life", "the universe", "everything"), 42)
})
