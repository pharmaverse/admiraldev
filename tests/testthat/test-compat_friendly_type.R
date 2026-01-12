# friendly_type_of ----
## Test 1: deprecation error if function is called ----
test_that("friendly_type_of Test 1: deprecation error if function is called", {
  expect_error(
    friendly_type_of(mtcars),
    class = "lifecycle_error_deprecated"
  )
})
# .rlang_as_friendly_type ----
## Test 5: .rlang_as_friendly_type() works for S4 and internal types ----
test_that(".rlang_as_friendly_type Test 5: .rlang_as_friendly_type works for S4 & internal types", {
  withr::local_options(lifecycle_verbosity = "quiet")

  setClass("person", slots = c(name = "character", age = "numeric"))
  john <- new("person", name = "John", age = 18)
  expect_equal(.rlang_as_friendly_type(typeof(john)), "an S4 object")

  expect_equal(.rlang_as_friendly_type("list"), "a list")
  expect_equal(.rlang_as_friendly_type("externalptr"), "a pointer")
  expect_equal(.rlang_as_friendly_type("char"), "an internal string")
  expect_equal(.rlang_as_friendly_type("promise"), "an internal promise")
  expect_equal(.rlang_as_friendly_type("..."), "an internal dots object")
  expect_equal(.rlang_as_friendly_type("any"), "an internal `any` object")
  expect_equal(.rlang_as_friendly_type("custom_type"), "custom_type")
})

# .rlang_stop_unexpected_typeof ----
## Test 6: .rlang_stop_unexpected_typeof() works ----
test_that(".rlang_stop_unexpected_typeof Test 6: .rlang_stop_unexpected_typeof() works", {
  withr::local_options(lifecycle_verbosity = "quiet")
  expect_error(.rlang_stop_unexpected_typeof("test"), "Unexpected type <character>.")
})

# stop_input_type ----
## Test 7: stop_input_type() works ----
test_that("stop_input_type Test 7: stop_input_type() works", {
  withr::local_options(lifecycle_verbosity = "quiet")
  expect_error(stop_input_type(1, what = "character"))
})
