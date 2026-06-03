# is_order_vars ----
## Test 1: returns error if input were created incorrectly ----
test_that("is_order_vars Test 1: returns error if input were created incorrectly", {
  expect_error(is_order_vars(STUDYID))
})

## Test 2: returns TRUE if input were created correctly ----
test_that("is_order_vars Test 2: returns TRUE if input were created correctly", {
  expect_true(is_order_vars(exprs(AVAL, desc(ADT))))
})

# is_valid_dtc ----
## Test 3: returns TRUE if input are valid dtc ----
test_that("is_valid_dtc Test 3: returns TRUE if input are valid dtc", {
  expect_true(is_valid_dtc("2020"))
  expect_true(is_valid_dtc("2022-09"))
  expect_true(is_valid_dtc("2021-04-06"))
  expect_true(is_valid_dtc("2003-12-15T13:15"))
  expect_true(is_valid_dtc("2021-03-09T01:20:30"))
})

## Test 4: returns FALSE if input are NOT valid dtc  ----
test_that("is_valid_dtc Test 4: returns FALSE if input are NOT valid dtc ", {
  expect_false(is_valid_dtc("2021-03-T01:20:30"))
})

## Test 5: returns FALSE if input date or datetime is not real date  ----
test_that("is_valid_dtc Test 5: returns FALSE if input date or datetime is not real date", {
  expect_false(is_valid_dtc("2021-02-31", check_dtc = TRUE))
  expect_false(is_valid_dtc("2021-02-29", check_dtc = TRUE)) # Not a leap year!
  expect_false(is_valid_dtc("2021-02-28T25:00:00", check_dtc = TRUE))
})

## Test 6: returns TRUE if input date or datetime is real date  ----
test_that("is_valid_dtc Test 6: returns TRUE if input date or datetime is real date ", {
  expect_true(is_valid_dtc("2021-02-28", check_dtc = TRUE))
  expect_true(is_valid_dtc("2020-02-29", check_dtc = TRUE)) # A leap year!
  expect_true(is_valid_dtc("2021-02-28T23:00:00", check_dtc = TRUE))
})

# is_auto  ----
## Test 7: returns error if argument is not 'auto' ----
test_that("is_auto Test 7: returns error if argument is not 'auto'", {
  expect_false(is_auto("otua"))
})
