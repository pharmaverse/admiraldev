# get_constant_vars ----
## Test 1: without ignore_vars ----
test_that("get_constant_vars Test 1: without ignore_vars", {
  data <- dplyr::tribble(
    ~USUBJID, ~AGE, ~AVISIT,
    "1",      26,   "BASELINE",
    "1",      26,   "WEEK 1",
    "2",      42,   "BASELINE",
    "2",      42,   "WEEK 1"
  )

  expect_equal(
    get_constant_vars(data, by_vars = exprs(USUBJID)),
    exprs(USUBJID, AGE)
  )
})

## Test 2: with ignore_vars ----
test_that("get_constant_vars Test 2: with ignore_vars", {
  data <- dplyr::tribble(
    ~USUBJID, ~AGE, ~WGTBL, ~HGTBL, ~AVISIT,
    "1",      26,   61,     172,    "BASELINE",
    "1",      26,   61,     172,    "WEEK 1",
    "2",      42,   72,     183,    "BASELINE",
    "2",      42,   72,     183,    "WEEK 1"
  )

  expect_equal(
    get_constant_vars(data, by_vars = exprs(USUBJID), ignore_vars = exprs(WGTBL, HGTBL)),
    exprs(USUBJID, AGE)
  )
})

# get_duplicates ----
## Test 3: x atomic vector ----
test_that("get_duplicates Test 3: x atomic vector", {
  x <- c("a", "a", "b", "c", "d", "d", 1, 1, 4)

  expect_equal(
    get_duplicates(x),
    c("a", "d", 1)
  )
})

# get_source_vars ----
## Test 4: x is a list of expressions ----
test_that("get_source_vars Test 4: x is a list of expressions", {
  x <- exprs(DTHDOM = "AE", DTHSEQ = AESEQ)

  expect_equal(
    get_source_vars(x),
    x[2]
  )
})

## Test 5: NULL returns NULL ----
test_that("get_source_vars Test 5: NULL returns NULL", {
  expect_equal(
    get_source_vars(NULL),
    NULL
  )
})

## Test 6: no source vars returns NULL ----
test_that("get_source_vars Test 6: no source vars returns NULL", {
  expect_equal(
    get_source_vars(x <- exprs(DTHDOM = "AE", DTHVAR = "AEDECOD")),
    NULL
  )
})

# get_dataset ----
## Test 7: get_dataset works ----
test_that("get_dataset Test 7: get_dataset works", {
  admiraldev_environment$many_to_one <- NULL
  admiraldev_environment$one_to_many <- NULL

  expect_equal(NULL, get_dataset("one_to_many"))
})

## Test 8: get_dataset works ----
test_that("get_dataset Test 8: get_dataset works", {
  expect_error(
    get_dataset("test"),
    class = "assert_character_scalar"
  )
})
