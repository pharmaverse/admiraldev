library(lubridate)

## Test 1: negate_vars returns list of negated variables ----
test_that("negate_vars returns list of negated variables", {
  expect_identical(negate_vars(vars(var1, var2)), rlang::exprs(-var1, -var2))
})

## Test 2: negate_vars returns NULL if input is NULL ----
test_that("negate_vars returns NULL if input is NULL", {
  expect_identical(negate_vars(NULL), NULL)
})

## Test 3: `convert_dtm_to_dtc` is in correct format ----
test_that("`convert_dtm_to_dtc` is in correct format", {
  expect_equal(
    convert_dtm_to_dtc(as.POSIXct("2022-04-05 15:34:07 UTC")),
    "2022-04-05T15:34:07"
  )
})

## Test 4: `convert_dtm_to_dtc` Error is thrown if dtm is not in correct format ----
test_that("`convert_dtm_to_dtc` Error is thrown if dtm is not in correct format", {
  expect_error(
    convert_dtm_to_dtc("2022-04-05T15:26:14"),
    "lubridate::is.instant(dtm) is not TRUE",
    fixed = TRUE
  )
})

## Test 5: is_valid_day: returns TRUE for values 1-31 ----
test_that("is_valid_day: returns TRUE for values 1-31", {
  input <- c(0, 1, 2, 10, 15, 30, 31, 32, 99)
  expected_output <- c(FALSE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE)
  expect_equal(is_valid_day(input), expected_output)
})

## Test 6: is_valid_month: returns TRUE for values 1-12 ----
test_that("is_valid_month: returns TRUE for values 1-12", {
  input <- c(0, 1, 2, 10, 12, 13, 31, 99)
  expected_output <- c(FALSE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE)
  expect_equal(is_valid_month(input), expected_output)
})

## Test 7: is_valid_time_entry: returns TRUE for times as 00:00:00 or keywords FIRST or LAST ----
test_that("is_valid_time_entry: returns TRUE for times as 00:00:00 or keywords FIRST or LAST", {
  input <- c("10:00", "10:00:00", "12:30:00", "LAST", "FIRST", "NONE")
  expected_output <- c(FALSE, TRUE, TRUE, TRUE, TRUE, FALSE)
  expect_equal(is_valid_time_entry(input), expected_output)
})

## Test 8: is_valid_date_entry: returns TRUE for dates as dd-mm 01-01 or keywords FIRST MID LAST ----
test_that("is_valid_date_entry: returns TRUE for dates as dd-mm 01-01 or keywords FIRST MID LAST", {
  input <- c("01-15", "15-01", "12-15", "LAST", "MID", "NONE")
  expected_output <- c(TRUE, FALSE, TRUE, TRUE, TRUE, FALSE)
  expect_equal(is_valid_date_entry(input), expected_output)
})

## Test 9: is_timeunit: returns TRUE for years, months, days, hours, minutes, seconds ----
test_that("is_timeunit: returns TRUE for years, months, days, hours, minutes, seconds", {
  input <- c("years", "months", "days", "hours", "minutes", "seconds", "none")
  expected_output <- c(TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, FALSE)
  expect_equal(is_timeunit(input), expected_output)
})

## Test 10: is_date: returns TRUE dates and datetimes ----
test_that("is_date: returns TRUE dates and datetimes", {
  input <- as_date("2022-10-13")
  expected_output <- TRUE
  expect_equal(is_date(input), expected_output)

  input <- "2022-10-13"
  expected_output <- FALSE
  expect_equal(is_date(input), expected_output)

  input <- ymd_hms("2019-07-18 15:25:40")
  expected_output <- TRUE
  expect_equal(is_date(input), expected_output)
})

## Test 11: is_named: returns TRUE if object is named ----
test_that("is_named: returns TRUE if object is named", {
  input <- c(1, 2, 3, 4)
  expected_output <- FALSE
  expect_equal(is_named(input), expected_output)

  names <- c("HCB", "ALT", "AST", "CRCL")
  expected_output <- FALSE
  expect_equal(is_named(names), expected_output)

  names(input) <- names
  expected_output <- TRUE
  expect_equal(is_named(input), expected_output)
})

## Test 12: is_auto: returns TRUE if object equals the auto keyword ----
test_that("is_auto: returns TRUE if object equals the auto keyword", {
  t <- expr(auto)
  input <- t
  expected_output <- FALSE
  expect_equal(is_auto(input), expected_output)

  input <- enquo(t)
  expected_output <- TRUE
  expect_equal(is_auto(input), expected_output)
})
