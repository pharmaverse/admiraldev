# assert_filter_cond ----
## Test 1: `assert_filter_cond` works as expected ----
test_that("assert_filter_cond Test 1: `assert_filter_cond` works as expected", {
  fc <- expr(AGE == 64)
  expect_identical(
    assert_filter_cond(fc),
    fc
  )

  expect_identical(
    assert_filter_cond(arg = fc, optional = TRUE),
    fc
  )

  fc <- expr("string")
  expect_error(
    assert_filter_cond(arg = fc),
    class = "assert_filter_cond"
  )
  expect_snapshot(
    assert_filter_cond(arg = fc),
    error = TRUE
  )

  vals <- c("A", "B")
  fc <- expr(VAR %in% !!vals)
  expect_identical(
    assert_filter_cond(arg = fc),
    fc
  )
})

# assert_data_frame ----
## Test 2: error if not a dataframe ----
test_that("assert_data_frame Test 2: error if not a dataframe", {
  example_fun <- function(dataset) {
    assert_data_frame(dataset, required_vars = exprs(STUDYID, USUBJID))
  }
  expect_error(
    example_fun(c(1, 2, 3)),
    class = "assert_data_frame"
  )
  expect_snapshot(
    example_fun(c(1, 2, 3)),
    error = TRUE
  )
})

## Test 3: assert_data_frame extract_vars() works as intended ----
test_that("assert_data_frame Test 3: assert_data_frame extract_vars() works as intended", {
  input <- dplyr::tribble(
    ~STUDYID, ~USUBJID, ~SEQ,
    "A",      "1",         1,
    "A",      "2",         2,
    "A",      "3",         3,
  )

  example_fun <- function(dataset, order) {
    assert_data_frame(dataset, required_vars = expr_c(
      exprs(STUDYID, USUBJID),
      extract_vars(order)
    ))
  }

  expect_invisible(example_fun(input, order = exprs(SEQ)))
})

## Test 4: assert_data_frame works if extract_vars() has NULL input ----
test_that("assert_data_frame Test 4: assert_data_frame works if extract_vars() has NULL input", {
  input <- dplyr::tribble(
    ~STUDYID, ~USUBJID, ~SEQ,
    "A",      "1",         1,
    "A",      "2",         2,
    "A",      "3",         3,
  )

  example_fun <- function(dataset, order = NULL) {
    assert_data_frame(dataset, required_vars = expr_c(
      exprs(STUDYID, USUBJID),
      extract_vars(order)
    ))
  }

  expect_invisible(example_fun(input))
})

## Test 5: error if dataframe is grouped ----
test_that("assert_data_frame Test 5: error if dataframe is grouped", {
  example_fun <- function(dataset) {
    assert_data_frame(dataset, required_vars = exprs(STUDYID, USUBJID))
  }

  data <- dplyr::tribble(
    ~STUDYID, ~USUBJID, ~ARMCD,
    "xyz",    "1",      "PLACEBO",
    "xyz",    "2",      "ACTIVE"
  ) %>% group_by(ARMCD)

  expect_error(
    example_fun(data),
    class = "assert_data_frame"
  )

  expect_snapshot(
    example_fun(data),
    error = TRUE
  )
})

## Test 6: error if an expected variable is missing ----
test_that("assert_data_frame Test 6: error if an expected variable is missing", {
  example_fun <- function(dataset) {
    assert_data_frame(dataset, required_vars = exprs(STUDYID, USUBJID))
  }

  data <- dplyr::tribble(
    ~STUDYID, ~ARMCD,
    "xyz",    "PLACEBO",
    "xyz",    "ACTIVE"
  )
  expect_error(
    example_fun(data),
    class = "assert_data_frame"
  )

  expect_snapshot(
    example_fun(data),
    error = TRUE
  )
})

## Test 7: error if expected variables are missing ----
test_that("assert_data_frame Test 7: error if expected variables are missing", {
  example_fun <- function(dataset) {
    assert_data_frame(dataset, required_vars = exprs(STUDYID, USUBJID))
  }

  data <- dplyr::tribble(
    ~ARMCD,
    "PLACEBO",
    "ACTIVE"
  )
  expect_error(
    example_fun(data),
    class = "assert_data_frame"
  )

  expect_snapshot(
    example_fun(data),
    error = TRUE
  )
})

## Test 8: no error if optional is TRUE and `arg` is NULL ----
test_that("assert_data_frame Test 8: no error if optional is TRUE and `arg` is NULL", {
  example_fun <- function(dataset) {
    assert_data_frame(dataset, required_vars = exprs(STUDYID, USUBJID), optional = TRUE)
  }

  expect_invisible(
    example_fun(NULL)
  )
})

## Test 9: error if required variables are missing ----
test_that("assert_data_frame Test 9: error if required variables are missing", {
  example_fun <- function(dataset) {
    assert_data_frame(dataset, required_vars = exprs(STUDYID, USUBJID))
  }

  admiral_dm <- dplyr::tribble(
    ~USUBJID2,
    "01-701-1015",
    "01-701-1016",
  )

  expect_error(
    example_fun(admiral_dm)
  )
})

## Test 10: error if required variable is missing ----
test_that("assert_data_frame Test 10: error if required variable is missing", {
  example_fun <- function(dataset) {
    assert_data_frame(dataset, required_vars = exprs(STUDYID, USUBJID))
  }

  admiral_dm <- dplyr::tribble(
    ~USUBJID,
    "01-701-1015",
    "01-701-1016",
  )

  expect_error(
    example_fun(admiral_dm)
  )
})

# assert_character_scalar ----
## Test 11: no error if optional is TRUE and `arg` is NULL ----
test_that("assert_character_scalar Test 11: no error if optional is TRUE and `arg` is NULL", {
  example_fun <- function(character) {
    assert_character_scalar(character, optional = TRUE)
  }

  expect_invisible(
    example_fun(NULL)
  )
})

## Test 12: no error, case_sensitive = FALSE ----
test_that("assert_character_scalar Test 12: no error, case_sensitive = FALSE", {
  example_fun <- function(character) {
    assert_character_scalar(character, values = c("test"), case_sensitive = FALSE)
  }

  out <- expect_invisible(example_fun(character = "TEST"))
  expect_equal(out, "test")

  check_unit <- function(duration_unit) {
    assert_character_scalar(
      duration_unit,
      values = c("years", "months", "weeks", "days", "hours", "minutes", "seconds"),
      case_sensitive = FALSE
    )
  }

  out <- expect_invisible(check_unit("months"))
  expect_equal(out, "months")

  out <- expect_invisible(check_unit("MONTHS"))
  expect_equal(out, "months")

  check_unit2 <- function(duration_unit) {
    assert_character_scalar(
      duration_unit,
      values = c("YEARS", "MONTHS", "WEEKS", "DAYS", "HOURS", "MINUTES", "SECONDS"),
      case_sensitive = FALSE
    )
  }

  out <- expect_invisible(check_unit2("months"))
  expect_equal(out, "months")

  out <- expect_invisible(check_unit2("MONTHS"))
  expect_equal(out, "months")
})

## Test 13: error if `arg` not in values ----
test_that("assert_character_scalar Test 13: error if `arg` not in values", {
  check_unit <- function(duration_unit) {
    assert_character_scalar(
      duration_unit,
      values = c("years", "months", "weeks", "days", "hours", "minutes", "seconds"),
      case_sensitive = FALSE
    )
  }

  expect_error(
    check_unit("month"),
    class = "assert_character_scalar"
  )
  expect_snapshot(check_unit("month"), error = TRUE)


  check_unit2 <- function(duration_unit) {
    assert_character_scalar(
      duration_unit,
      values = c("YEARS", "MONTHS", "WEEKS", "DAYS", "HOURS", "MINUTES", "SECONDS"),
      case_sensitive = FALSE
    )
  }

  expect_error(
    check_unit2("month"),
    class = "assert_character_scalar"
  )
  expect_snapshot(check_unit2("month"), error = TRUE)
})

## Test 14: error if not character ----
test_that("assert_character_scalar Test 14: error if not character", {
  example_fun2 <- function(msg_type) {
    msg_type <- assert_character_scalar(msg_type,
      values = c("warning", "error"), case_sensitive = FALSE
    )

    if (msg_type == "warning") {
      print("A warning was requested.")
    }
  }
  expect_error(
    example_fun2(2),
    class = "assert_character_scalar"
  )

  expect_snapshot(
    example_fun2(2),
    error = TRUE
  )
})

## Test 15: error if input is a vector ----
test_that("assert_character_scalar Test 15: error if input is a vector", {
  example_fun2 <- function(msg_type) {
    msg_type <- assert_character_scalar(msg_type,
      values = c("warning", "error"), case_sensitive = FALSE
    )

    if (msg_type == "warning") {
      print("A warning was requested.")
    }
  }
  expect_error(
    example_fun2(c("admiral", "admiralonco")),
    class = "assert_character_scalar"
  )

  expect_snapshot(
    example_fun2(c("admiral", "admiralonco")),
    error = TRUE
  )
})

# assert_character_vector ----
## Test 16: error if `arg` not a character vector ----
test_that("assert_character_vector Test 16: error if `arg` not a character vector", {
  arg <- c(1, 2, 3)

  expect_error(
    assert_character_vector(arg),
    class = "assert_character_vector"
  )

  expect_snapshot(
    error = TRUE,
    assert_character_vector(arg)
  )
})

## Test 17: error if `arg` is not in values ----
test_that("assert_character_vector Test 17: error if `arg` is not in values", {
  example_fun <- function(character) {
    assert_character_vector(character, values = c("test", "oak"))
  }

  expect_error(
    example_fun(character = c("oak", "mint")),
    class = "assert_character_vector"
  )
  expect_snapshot(
    example_fun(character = c("oak", "mint")),
    error = TRUE
  )
})

## Test 18: arg_name correctly displayed in name check ----
test_that("assert_character_vector Test 18: arg_name correctly displayed in name check", {
  example_fun <- function(character) {
    assert_character_vector(character, values = c("test", "oak"), named = TRUE)
  }

  expect_error(
    example_fun(character = c(tree = "oak", "test")),
    class = "assert_character_vector"
  )
  expect_snapshot(
    example_fun(character = c(tree = "oak", "test")),
    error = TRUE
  )
})

# assert_logical_scalar ----
## Test 19: no error if optional is TRUE and `arg` is NULL ----
test_that("assert_logical_scalar Test 19: no error if optional is TRUE and `arg` is NULL", {
  example_fun <- function(arg) {
    assert_logical_scalar(arg, optional = TRUE)
  }

  expect_invisible(
    example_fun(NULL)
  )
})

## Test 20: error if `arg` is not TRUE or FALSE ----
test_that("assert_logical_scalar Test 20: error if `arg` is not TRUE or FALSE", {
  example_fun <- function(arg) {
    assert_logical_scalar(arg)
  }
  arg <- c()
  expect_error(example_fun(NA), class = "assert_logical_scalar")
  expect_error(example_fun(arg), class = "assert_logical_scalar")
  expect_error(example_fun("test"), class = "assert_logical_scalar")
  expect_snapshot(
    error = TRUE,
    example_fun("test")
  )
})

# assert_symbol ----
## Test 21: no error if optional = TRUE and `arg` = NULL ----
test_that("assert_symbol Test 21: no error if optional = TRUE and `arg` = NULL", {
  f <- function(var) {
    v <- enexpr(var)
  }

  example_fun <- function(arg) {
    assert_symbol(arg, optional = TRUE)
  }

  expect_invisible(
    example_fun(
      f(NULL)
    )
  )
})

## Test 22: `assert_symbol` throws an error if `arg` is missing ----
test_that("assert_symbol Test 22: `assert_symbol` throws an error if `arg` is missing", {
  f <- function(var) {
    v <- enexpr(var)
  }

  example_fun <- function(arg) {
    assert_symbol(arg)
  }

  expect_error(
    example_fun(f()),
    class = "assert_symbol"
  )
  expect_snapshot(example_fun(f()), error = TRUE)
})

## Test 23: `assert_symbol` throws an error if `arg` is not a symbol ----
test_that("assert_symbol Test 23: `assert_symbol` throws an error if `arg` is not a symbol", {
  f <- function(var) {
    v <- enexpr(var)
  }

  example_fun <- function(arg) {
    assert_symbol(arg)
  }

  expect_error(
    example_fun(f(NULL)),
    class = "assert_symbol"
  )
  expect_snapshot(example_fun(f(NULL)), error = TRUE)
})

## Test 24: `assert_symbol` does not throw an error if `arg` is a symbol ----
test_that("assert_symbol Test 24: `assert_symbol` does not throw an error if `arg` is a symbol", {
  f <- function(var) {
    v <- enexpr(var)
  }

  admiral_dm <- dplyr::tribble(
    ~DOMAIN,      ~USUBJID,
    "DM",    "01-701-1015",
    "DM",    "01-701-1016",
  )

  example_fun <- function(arg) {
    assert_symbol(arg)
  }

  expect_invisible(
    example_fun(
      f(admiral_dm)
    )
  )
})

# assert_expr ----
## Test 25: `assert_expr` does not throw an error if `arg` is an expression ----
test_that("assert_expr Test 25: `assert_expr` does not throw an error if `arg` is an expression", {
  dm <- dplyr::tribble(
    ~DOMAIN,      ~USUBJID,
    "DM",    "01-701-1015",
    "DM",    "01-701-1016",
  )

  expect_invisible(
    assert_expr(var <- expr(dm))
  )
})

## Test 26: no error if optional is TRUE and `arg` is NULL ----
test_that("assert_expr Test 26: no error if optional is TRUE and `arg` is NULL", {
  expect_invisible(
    assert_expr(var <- NULL, optional = TRUE)
  )
})

## Test 27: `assert_expr` throws an error if `arg` is missing ----
test_that("assert_expr Test 27: `assert_expr` throws an error if `arg` is missing", {
  expect_error(
    assert_expr(),
    class = "assert_expr"
  )

  expect_snapshot(
    assert_expr(),
    error = TRUE
  )

  example_fun <- function(data) {
    assert_expr(data)
  }
  expect_snapshot(
    example_fun(),
    error = TRUE
  )
})

## Test 28: `assert_expr` throws an error if `arg` is not an expression ----
test_that("assert_expr Test 28: `assert_expr` throws an error if `arg` is not an expression", {
  expect_error(
    {
      var <- c(1, 2)
      assert_expr(var)
    },
    class = "assert_expr"
  )

  expect_snapshot(
    {
      var <- c(1, 2)
      assert_expr(var)
    },
    error = TRUE
  )
})

# assert_vars ----
## Test 29: no error if expected input ----
test_that("assert_vars Test 29: no error if expected input", {
  expect_invisible(assert_vars(exprs(USUBJID, PARAMCD)))
  expect_invisible(assert_vars(
    exprs(APERSDT = APxxSDT, APEREDT = APxxEDT),
    expect_names = TRUE
  ))
})

## Test 30: error if unexpected input ----
test_that("assert_vars Test 30: error if unexpected input", {
  expect_error(
    assert_vars(AVAL + 1),
    class = "assert_vars"
  )

  expect_snapshot(
    assert_vars(AVAL + 1),
    error = TRUE
  )

  expect_error(
    assert_vars(rlang::quos(USUBJID, PARAMCD)),
    class = "assert_vars"
  )

  expect_snapshot(
    assert_vars(rlang::quos(USUBJID, PARAMCD)),
    error = TRUE
  )

  expect_error(
    assert_vars(c("USUBJID", "PARAMCD", "VISIT")),
    class = "assert_vars"
  )

  expect_snapshot(
    assert_vars(c("USUBJID", "PARAMCD", "VISIT")),
    error = TRUE
  )

  expect_error(
    assert_vars(exprs(USUBJID, AVAL + 2)),
    class = "assert_vars"
  )

  expect_snapshot(
    assert_vars(exprs(USUBJID, AVAL + 2)),
    error = TRUE
  )

  expect_error(
    assert_vars(exprs(APERSDT = APxxSDT, APxxEDT), expect_names = TRUE),
    class = "assert_vars"
  )

  expect_snapshot(
    assert_vars(exprs(APERSDT = APxxSDT, APxxEDT), expect_names = TRUE),
    error = TRUE
  )
})

## Test 31: error if some elements of `arg` are not unquoted variable names ----
test_that("assert_vars Test 31: error if some elements of `arg` are not unquoted variable names", {
  example_fun <- function(arg) {
    assert_vars(arg)
  }

  expect_error(
    example_fun(exprs(USUBJID, PARAMCD, NULL)),
    class = "assert_vars"
  )

  expect_snapshot(
    example_fun(exprs(USUBJID, PARAMCD, NULL)),
    error = TRUE
  )
})

# assert_integer_scalar ----
## Test 32: no error if `arg` is NULL and optional is TRUE ----
test_that("assert_integer_scalar Test 32: no error if `arg` is NULL and optional is TRUE", {
  example_fun <- function(arg) {
    assert_integer_scalar(arg, optional = TRUE)
  }

  expect_invisible(
    example_fun(NULL)
  )
})

## Test 33: error if chosen subset not in subsets ----
test_that("assert_integer_scalar Test 33: error if chosen subset not in subsets", {
  example_fun <- function(arg) {
    assert_integer_scalar(arg, subset = "infinity")
  }

  expect_error(
    example_fun(1),
    class = "assert_character_scalar"
  )

  expect_snapshot(
    example_fun(1),
    error = TRUE
  )
})

## Test 34: no error if `arg` is in selected subset ----
test_that("assert_integer_scalar Test 34: no error if `arg` is in selected subset", {
  example_fun <- function(arg) {
    assert_integer_scalar(arg, subset = "positive")
  }

  expect_invisible(
    example_fun(1)
  )
})

## Test 35: error if `arg` is not an integer scalar ----
test_that("assert_integer_scalar Test 35: error if `arg` is not an integer scalar", {
  example_fun <- function(arg) {
    assert_integer_scalar(arg)
  }

  arg <- c()

  expect_error(
    example_fun(TRUE),
    class = "assert_integer_scalar"
  )
  expect_error(
    example_fun(arg),
    class = "assert_integer_scalar"
  )
  expect_error(
    example_fun(Inf),
    class = "assert_integer_scalar"
  )
  expect_error(
    example_fun(1.5),
    class = "assert_integer_scalar"
  )

  expect_snapshot(
    example_fun(1.5),
    error = TRUE
  )
})

# assert_numeric_vector ----

## Test 36: no error for expected input ----
test_that("assert_numeric_vector Test 36: no error for expected input", {
  expect_invisible(
    assert_numeric_vector(c(0, 1), length = 2)
  )
})

## Test 37: no error if `arg` is NULL and optional is TRUE ----
test_that("assert_numeric_vector Test 37: no error if `arg` is NULL and optional is TRUE", {
  example_fun <- function(arg) {
    assert_numeric_vector(arg, optional = TRUE)
  }

  expect_invisible(
    example_fun(NULL)
  )
})

## Test 38: error if `arg` is not a numeric vector ----
test_that("assert_numeric_vector Test 38: error if `arg` is not a numeric vector", {
  example_fun <- function(arg) {
    assert_numeric_vector(arg)
  }

  arg <- c()

  expect_error(
    example_fun(TRUE),
    class = "assert_numeric_vector"
  )
  expect_snapshot(
    example_fun(TRUE),
    error = TRUE
  )

  expect_error(
    example_fun(arg),
    class = "assert_numeric_vector"
  )
  expect_snapshot(
    example_fun(arg),
    error = TRUE
  )

  expect_error(
    example_fun("1.5"),
    class = "assert_numeric_vector"
  )
  expect_snapshot(
    example_fun("1.5"),
    error = TRUE
  )
})

## Test 39: error if length is not as expected ----
test_that("assert_numeric_vector Test 39: error if length is not as expected", {
  numbers <- c(1, 2, 3)
  expect_snapshot(
    assert_numeric_vector(
      numbers,
      length = 2
    ),
    error = TRUE
  )
})

# assert_s3_class ----
## Test 40: error if `arg` is not an object of a specific class S3 ----
test_that("assert_s3_class Test 40: error if `arg` is not an object of a specific class S3", {
  example_fun <- function(arg) {
    assert_s3_class(arg, "factor")
  }

  expect_error(
    example_fun("test"),
    class = "assert_s3_class"
  )
  expect_snapshot(
    example_fun("test"),
    error = TRUE
  )
})

## Test 41: no error if `arg` is NULL and optional is TRUE ----
test_that("assert_s3_class Test 41: no error if `arg` is NULL and optional is TRUE", {
  example_fun <- function(arg) {
    assert_s3_class(arg, cls = "factor", optional = TRUE)
  }

  expect_invisible(
    example_fun(NULL)
  )
})

## Test 42: error if `arg` is NULL and optional is FALSE ----
test_that("assert_s3_class Test 42: error if `arg` is NULL and optional is FALSE", {
  example_fun <- function(arg) {
    assert_s3_class(arg, cls = "factor", optional = FALSE)
  }

  expect_error(
    example_fun(NULL),
    class = "assert_s3_class"
  )
  expect_snapshot(example_fun(NULL), error = TRUE)
})

## Test 43: no error if `arg` is an object of a specific class S3 ----
test_that("assert_s3_class Test 43: no error if `arg` is an object of a specific class S3", {
  example_fun <- function(arg) {
    assert_s3_class(arg, "factor")
  }

  expect_invisible(example_fun(as.factor("test")))
})

# assert_list_of ----
## Test 44: error if `arg` is not a list of specific class S3 objects ----
test_that("assert_list_of Test 44: error if `arg` is not a list of specific class S3 objects", {
  example_fun <- function(arg) {
    assert_list_of(arg, "factor")
  }

  expect_error(
    example_fun(list("test")),
    class = "assert_list_of"
  )
  expect_snapshot(
    example_fun(list("test")),
    error = TRUE
  )
})

## Test 45: no error if `arg` is NULL and optional is TRUE ----
test_that("assert_list_of Test 45: no error if `arg` is NULL and optional is TRUE", {
  example_fun <- function(arg) {
    assert_list_of(arg, cls = "factor", optional = TRUE)
  }

  expect_invisible(
    example_fun(NULL)
  )
})

## Test 46: error if `arg` is NULL and optional is FALSE ----
test_that("assert_list_of Test 46: error if `arg` is NULL and optional is FALSE", {
  example_fun <- function(arg) {
    assert_list_of(arg, cls = "factor", optional = FALSE)
  }

  expect_error(
    example_fun(NULL),
    class = "assert_list_of"
  )
  expect_snapshot(example_fun(NULL), error = TRUE)
})

## Test 47: no error if `arg` is a list of specific class S3 objects ----
test_that("assert_list_of Test 47: no error if `arg` is a list of specific class S3 objects", {
  example_fun <- function(arg) {
    assert_list_of(arg, "factor")
  }

  expect_invisible(
    example_fun(
      list(as.factor("test"), as.factor(1))
    )
  )
})

## Test 48: error if `arg` is not a named list (no elements named) ----
test_that("assert_list_of Test 48: error if `arg` is not a named list (no elements named)", {
  expect_error(
    {
      mylist <- list(1, 2, 3)
      assert_list_of(mylist, cls = "numeric", named = TRUE)
    },
    class = "assert_list_of"
  )
  expect_snapshot(
    {
      mylist <- list(1, 2, 3)
      assert_list_of(mylist, cls = "numeric", named = TRUE)
    },
    error = TRUE
  )
})

## Test 49: error if `arg` is not a named list (some elements named) ----
test_that("assert_list_of Test 49: error if `arg` is not a named list (some elements named)", {
  expect_error(
    {
      mylist <- list(1, 2, 3, d = 4)
      assert_list_of(mylist, cls = "numeric", named = TRUE)
    },
    class = "assert_list_of"
  )
  expect_snapshot(
    {
      mylist <- list(1, 2, 3, d = 4)
      assert_list_of(mylist, cls = "numeric", named = TRUE)
    },
    error = TRUE
  )
})

## Test 50: no error if `arg` is a named list ----
test_that("assert_list_of Test 50: no error if `arg` is a named list", {
  expect_invisible(
    assert_list_of(mylist <- list(a = 1, b = 2, c = 3), cls = "numeric", named = TRUE)
  )
})

# assert_named ----
## Test 51: no error if arg is NULL and optional = TRUE ----
test_that("assert_named Test 51: no error if arg is NULL and optional = TRUE", {
  expect_invisible(assert_named(arg <- NULL, optional = TRUE))
})

## Test 52: error if no elements are named ----
test_that("assert_named Test 52: error if no elements are named", {
  expect_error(
    {
      arg <- c(1, 2)
      assert_named(arg)
    },
    class = "assert_named"
  )

  expect_snapshot(
    {
      arg <- c(1, 2)
      assert_named(arg)
    },
    error = TRUE
  )
})

# assert_function ----
## Test 53: error if `arg` is not a function ----
test_that("assert_function Test 53: error if `arg` is not a function", {
  example_fun <- function(arg) {
    assert_function(arg)
  }

  expect_error(example_fun(5), class = "assert_function")
  expect_snapshot(
    example_fun(5),
    error = TRUE
  )
  expect_error(example_fun(), class = "assert_function")
})

## Test 54: no error if `arg` is NULL and optional is TRUE ----
test_that("assert_function Test 54: no error if `arg` is NULL and optional is TRUE", {
  example_fun <- function(arg) {
    assert_function(arg, optional = TRUE)
  }

  expect_invisible(
    example_fun(NULL)
  )
})

## Test 55: no error if `arg` is a function with all parameters defined ----
test_that("assert_function Test 55: no error if `arg` is a function with all parameters defined", {
  example_fun <- function(arg) {
    assert_function(arg, params = c("x"))
  }

  expect_invisible(example_fun(mean))
})

## Test 56: error if  `params`  is missing with no default ----
test_that("assert_function Test 56: error if  `params`  is missing with no default", {
  example_fun <- function(arg) {
    assert_function(arg, params = c("x"))
  }

  expect_error(
    example_fun(sum),
    class = "assert_function"
  )
  expect_snapshot(
    example_fun(sum),
    error = TRUE
  )

  example_fun <- function(arg) {
    assert_function(arg, params = c("x", "y"))
  }

  expect_error(
    example_fun(sum),
    class = "assert_function"
  )
  expect_snapshot(
    example_fun(sum),
    error = TRUE
  )
})

## Test 57: If dot-dot-dot is a argument ----
test_that("assert_function Test 57: If dot-dot-dot is a argument", {
  example_fun <- function(derivation, args = NULL) {
    assert_function(derivation, names(args))
  }
  expect_invisible(example_fun(mutate, args = exprs(AVAL = x + 1)))
})

# assert_unit ----
## Test 58: no error if the parameter is provided in the expected unit ----
test_that("assert_unit Test 58: no error if the parameter is provided in the expected unit", {
  advs <- dplyr::tribble(
    ~USUBJID, ~VSTESTCD, ~VSTRESN, ~VSSTRESU, ~PARAMCD, ~AVAL,
    "P01",    "WEIGHT",      80.1, "kg",      "WEIGHT",  80.1,
    "P02",    "WEIGHT",      85.7, "kg",      "WEIGHT",  85.7
  )

  expect_invisible(
    assert_unit(advs, param = "WEIGHT", required_unit = "kg", get_unit_expr = VSSTRESU)
  )
})

## Test 59: no error for multiple expected units ----
test_that("assert_unit Test 59: no error for multiple expected units", {
  advs <- dplyr::tribble(
    ~USUBJID, ~VSTESTCD, ~VSTRESN, ~VSSTRESU, ~PARAMCD, ~AVAL,
    "P01",    "WEIGHT",      80.1, "kg",      "WEIGHT",  80.1,
    "P02",    "WEIGHT",      85.7, "kg",      "WEIGHT",  85.7
  )

  expect_invisible(
    assert_unit(
      advs,
      param = "WEIGHT",
      required_unit = c("kg", "lb"),
      get_unit_expr = VSSTRESU
    )
  )
})

## Test 60: no error if all units NA ----
test_that("assert_unit Test 60: no error if all units NA", {
  advs <- dplyr::tribble(
    ~USUBJID, ~VSTESTCD, ~VSTRESN, ~VSSTRESU,     ~PARAMCD, ~AVAL,
    "P01",    "RATIO",       80.1, NA_character_, "WEIGHT",  80.1,
    "P02",    "RATIO",       85.7, NA_character_, "WEIGHT",  85.7
  )

  expect_invisible(
    assert_unit(
      advs,
      param = "RATIO",
      required_unit = NA_character_,
      get_unit_expr = VSSTRESU
    )
  )
})

## Test 61: error if multiple units in the input dataset ----
test_that("assert_unit Test 61: error if multiple units in the input dataset", {
  advs <- dplyr::tribble(
    ~USUBJID, ~VSTESTCD, ~VSTRESN, ~VSSTRESU, ~PARAMCD, ~AVAL,
    "P01",    "WEIGHT",      80.1, "kg",      "WEIGHT",  80.1,
    "P02",    "WEIGHT",      85.7, "lb",      "WEIGHT",  85.7
  )

  expect_error(
    assert_unit(advs, param = "WEIGHT", get_unit_expr = VSSTRESU),
    class = "assert_unit"
  )
  expect_snapshot(
    assert_unit(advs, param = "WEIGHT", get_unit_expr = VSSTRESU),
    error = TRUE
  )
})

## Test 62: error if unexpected unit in the input dataset ----
test_that("assert_unit Test 62: error if unexpected unit in the input dataset", {
  advs <- dplyr::tribble(
    ~USUBJID, ~VSTESTCD, ~VSTRESN, ~VSSTRESU, ~PARAMCD, ~AVAL,
    "P01",    "WEIGHT",      80.1, "kg",      "WEIGHT",  80.1,
    "P02",    "WEIGHT",      85.7, "kg",      "WEIGHT",  85.7
  )

  expect_error(
    assert_unit(advs, param = "WEIGHT", required_unit = "lb", get_unit_expr = VSSTRESU),
    class = "assert_unit"
  )
  expect_snapshot(
    assert_unit(advs, param = "WEIGHT", required_unit = "lb", get_unit_expr = VSSTRESU),
    error = TRUE
  )
})

## Test 63: error if get_unit_expr invalid ----
test_that("assert_unit Test 63: error if get_unit_expr invalid", {
  advs <- dplyr::tribble(
    ~USUBJID, ~VSTESTCD, ~VSTRESN, ~VSSTRESU, ~PARAMCD, ~AVAL,
    "P01",    "WEIGHT",      80.1, "kg",      "WEIGHT",  80.1,
    "P02",    "WEIGHT",      85.7, "kg",      "WEIGHT",  85.7
  )

  expect_error(
    assert_unit(advs, param = "WEIGHT", required_unit = "kg", get_unit_expr = VSTRESU),
    class = "assert_unit"
  )
  expect_snapshot(
    assert_unit(advs, param = "WEIGHT", required_unit = "kg", get_unit_expr = VSTRESU),
    error = TRUE
  )
})

# assert_param_does_not_exist ----
## Test 64: error if parameter exists in the input dataset ----
test_that("assert_param_does_not_exist Test 64: error if parameter exists in the input dataset", {
  advs <- dplyr::tribble(
    ~USUBJID, ~VSTESTCD, ~VSTRESN, ~VSSTRESU, ~PARAMCD, ~AVAL,
    "P01",    "WEIGHT",      80.1, "kg",      "WEIGHT",  80.1,
    "P02",    "WEIGHT",      85.7, "kg",      "WEIGHT",  85.7
  )

  expect_error(
    assert_param_does_not_exist(advs, param = "WEIGHT"),
    class = "assert_param_does_not_exist"
  )

  expect_snapshot(
    assert_param_does_not_exist(advs, param = "WEIGHT"),
    error = TRUE
  )
})

## Test 65: no error if the parameter exists in the dataset ----
test_that("assert_param_does_not_exist Test 65: no error if the parameter exists in the dataset", {
  advs <- dplyr::tribble(
    ~USUBJID, ~VSTESTCD, ~VSTRESN, ~VSSTRESU, ~PARAMCD, ~AVAL,
    "P01",    "WEIGHT",      80.1, "kg",      "WEIGHT",  80.1,
    "P02",    "WEIGHT",      85.7, "kg",      "WEIGHT",  85.7
  )

  expect_invisible(
    assert_param_does_not_exist(advs, param = "HR")
  )
})

# assert_varval_list ----
## Test 66: error if `arg` is not a list of expressions ----
test_that("assert_varval_list Test 66: error if `arg` is not a list of expressions", {
  example_fun <- function(arg) {
    assert_varval_list(arg, accept_var = FALSE)
  }

  expect_error(
    example_fun(c("USUBJID", "PARAMCD", "VISIT")),
    class = "assert_varval_list"
  )
  expect_snapshot(
    example_fun(c("USUBJID", "PARAMCD", "VISIT")),
    error = TRUE
  )
})

## Test 67: error if not all elements are variables ----
test_that("assert_varval_list Test 67: error if not all elements are variables", {
  example_fun <- function(arg) {
    assert_varval_list(arg, accept_var = TRUE)
  }

  expect_error(
    example_fun(exprs(USUBJID, PARAMCD, NULL)),
    class = "assert_varval_list"
  )
  expect_snapshot(
    example_fun(exprs(USUBJID, PARAMCD, NULL)),
    error = TRUE
  )
})

## Test 68: error if `required_elements` are missing from `arg` ----
test_that("assert_varval_list Test 68: error if `required_elements` are missing from `arg`", {
  example_fun <- function(arg) {
    assert_varval_list(arg, required_elements = "DTHDOM")
  }

  expect_error(
    example_fun(exprs(DTHSEQ = AESEQ)),
    class = "assert_varval_list"
  )
  expect_snapshot(
    example_fun(exprs(DTHSEQ = AESEQ)),
    error = TRUE
  )
})

## Test 69: no error if `arg` is NULL and optional is TRUE ----
test_that("assert_varval_list Test 69: no error if `arg` is NULL and optional is TRUE", {
  example_fun <- function(arg) {
    assert_varval_list(arg, optional = TRUE)
  }

  expect_invisible(
    example_fun(NULL)
  )
})

## Test 70: error if `accept_expr` is TRUE and value is invalid ----
test_that("assert_varval_list Test 70: error if `accept_expr` is TRUE and value is invalid", {
  example_fun <- function(arg) {
    assert_varval_list(arg, accept_expr = TRUE)
  }

  expect_error(
    example_fun(exprs(DTHSEQ = TRUE)),
    class = "assert_varval_list"
  )
  expect_snapshot(
    example_fun(exprs(DTHSEQ = TRUE)),
    error = TRUE
  )
})

## Test 71: error if `accept_expr` is FALSE and value is invalid ----
test_that("assert_varval_list Test 71: error if `accept_expr` is FALSE and value is invalid", {
  example_fun <- function(arg) {
    assert_varval_list(arg, accept_expr = FALSE)
  }

  expect_error(
    example_fun(exprs(DTHSEQ = exprs())),
    class = "assert_varval_list"
  )
  expect_snapshot(
    example_fun(exprs(DTHSEQ = exprs())),
    error = TRUE
  )
})

## Test 72: no error if an argument is a variable-value list ----
test_that("assert_varval_list Test 72: no error if an argument is a variable-value list", {
  example_fun <- function(arg) {
    assert_varval_list(arg)
  }

  expect_invisible(
    example_fun(exprs(DTHDOM = "AE", DTHSEQ = AESEQ))
  )
})

# assert_expr_list ----
## Test 73: error if `arg` is not a list of expressions ----
test_that("assert_expr_list Test 73: error if `arg` is not a list of expressions", {
  expect_error(
    assert_expr_list(arg <- c("USUBJID", "PARAMCD", "VISIT")),
    class = "assert_expr_list"
  )
})

## Test 74: error if `arg` is not a named list of expressions ----
test_that("assert_expr_list Test 74: error if `arg` is not a named list of expressions", {
  expect_error(
    assert_expr_list(arg <- exprs(USUBJID, PARAMCD, NULL), named = TRUE),
    regexp = "argument must be named"
  )
})

## Test 75: error if `required_elements` are missing from `arg` ----
test_that("assert_expr_list Test 75: error if `required_elements` are missing from `arg`", {
  expect_error(
    assert_expr_list(
      arg <- exprs(DTHSEQ = AESEQ),
      required_elements = "DTHDOM"
    ),
    class = "assert_expr_list"
  )
})

## Test 76: no error if `arg` is NULL and optional is TRUE ----
test_that("assert_expr_list Test 76: no error if `arg` is NULL and optional is TRUE", {
  expect_invisible(
    assert_expr_list(NULL, optional = TRUE)
  )
})

## Test 77: error if element is invalid ----
test_that("assert_expr_list Test 77: error if element is invalid", {
  expect_error(
    assert_expr_list(arg <- exprs(DTHSEQ = !!mean)),
    class = "assert_expr_list"
  )
})

## Test 78: no error if argument is valid ----
test_that("assert_expr_list Test 78: no error if argument is valid", {
  expect_invisible(
    assert_expr_list(arg <- exprs(
      DTHDOM = "AE",
      DTHSEQ = AESEQ,
      DTHVAR = if_else(!is.na(AEDECOD), "AEDECOD", NA)
    ))
  )
})

# assert_list_element ----
## Test 79: no error if the elements fulfill a certain condition ----
test_that("assert_list_element Test 79: no error if the elements fulfill a certain condition", {
  expect_invisible(
    assert_list_element(
      list(
        list(var = expr(DTHDT), val = 1),
        list(var = expr(EOSDT), val = 0)
      ),
      element = "val",
      condition = val >= 0,
      message_text = ""
    )
  )
})

## Test 80: error if the elements do not fulfill the condition ----
test_that("assert_list_element Test 80: error if the elements do not fulfill the condition", {
  expect_snapshot(
    assert_list_element(
      list(
        list(var = expr(DTHDT), val = 1),
        list(var = expr(EOSDT), val = -1)
      ),
      element = "val",
      condition = val >= 0,
      message_text = "List element {.val val} must be `>=0` in argument {.arg {arg_name}}.",
      arg_name = "input"
    ),
    error = TRUE
  )

  expect_snapshot(
    error = TRUE,
    assert_list_element(
      list(
        list(var = expr(DTHDT), val = 1),
        list(var = expr(EOSDT), val = -1),
        list(var = expr(EOSDT), val = -2)
      ),
      element = "val",
      condition = val %in% valid_vals,
      valid_vals = c(0, 1),
      message_text = paste(
        "List element {.val val} must one of {.val {valid_vals}} in argument",
        "{.arg {arg_name}}."
      ),
      arg_name = "input"
    )
  )
})

# assert_one_to_one ----
## Test 81: error if there is a one to many mapping ----
test_that("assert_one_to_one Test 81: error if there is a one to many mapping", {
  dm <- dplyr::tribble(
    ~DOMAIN,      ~USUBJID,
    "DM",    "01-701-1015",
    "DM",    "01-701-1016",
    "DM",    "01-701-1023",
    "DM",    "01-701-1024",
  )

  expect_error(
    assert_one_to_one(dm, exprs(DOMAIN), exprs(USUBJID)),
    class = "assert_one_to_one"
  )
  admiraldev_environment$one_to_many <- NULL

  expect_snapshot(
    error = TRUE,
    assert_one_to_one(dm, exprs(DOMAIN), exprs(USUBJID))
  )
  admiraldev_environment$one_to_many <- NULL
})

## Test 82: error if there is a many to one mapping ----
test_that("assert_one_to_one Test 82: error if there is a many to one mapping", {
  dm <- dplyr::tribble(
    ~DOMAIN,      ~USUBJID,
    "DM",    "01-701-1015",
    "DM",    "01-701-1016",
    "DM",    "01-701-1023",
    "DM",    "01-701-1024",
  )

  expect_error(
    assert_one_to_one(dm, exprs(USUBJID), exprs(DOMAIN)),
    class = "assert_one_to_one"
  )
  admiraldev_environment$many_to_one <- NULL
})

## Test 83: dataset is returned invisible if one-to-one ----
test_that("assert_one_to_one Test 83: dataset is returned invisible if one-to-one", {
  df <- dplyr::tribble(
    ~SPECIES, ~SPECIESN,
    "DOG",           1L,
    "CAT",           2L,
    "DOG",           1L
  )

  df_out <- expect_invisible(
    assert_one_to_one(df, vars1 = exprs(SPECIES), vars2 = exprs(SPECIESN))
  )

  expect_equal(df_out, expected = df)
})

# assert_date_var ----
## Test 84: error if variable is not a date or datetime variable ----
test_that("assert_date_var Test 84: error if variable is not a date or datetime variable", {
  example_fun <- function(dataset, var) {
    var <- assert_symbol(enexpr(var))
    assert_date_var(dataset = dataset, var = !!var)
  }

  my_data <- dplyr::tribble(
    ~USUBJID, ~ADT,
    "1",      ymd("2020-12-06"),
    "2",      ymd("")
  )

  expect_error(
    example_fun(
      dataset = my_data,
      var = USUBJID
    )
  )
  expect_snapshot(
    error = TRUE,
    example_fun(
      dataset = my_data,
      var = USUBJID
    )
  )
})

# assert_date_vector ----
## Test 85: returns error if input vector is not a date formatted ----
test_that("assert_date_vector Test 85: returns error if input vector is not a date formatted", {
  expect_error(assert_date_vector("2018-08-23"))
})

## Test 86: returns invisible if input is date formatted ----
test_that("assert_date_vector Test 86: returns invisible if input is date formatted", {
  expect_invisible(assert_date_vector(as.Date("2022-10-25")))
})

## Test 87: no error if `arg` is NULL and optional is TRUE ----
test_that("assert_date_vector Test 87: no error if `arg` is NULL and optional is TRUE", {
  example_fun <- function(arg) {
    assert_date_vector(arg, optional = TRUE)
  }

  expect_invisible(
    example_fun(NULL)
  )
})

## Test 88: error if `arg` is NULL and optional is FALSE ----
test_that("assert_date_vector Test 88: error if `arg` is NULL and optional is FALSE", {
  example_fun <- function(arg) {
    assert_date_vector(arg, optional = FALSE)
  }

  expect_error(
    example_fun(NULL),
    class = "assert_date_vector"
  )
  expect_snapshot(
    example_fun(NULL),
    error = TRUE
  )
})


# assert_atomic_vector ----
## Test 89: error if input is not atomic vector ----
test_that("assert_atomic_vector Test 89: error if input is not atomic vector", {
  x <- list("a", "a", "b", "c", "d", "d", 1, 1, 4)
  expect_error(assert_atomic_vector(x), class = "assert_atomic_vector")
  expect_snapshot(
    error = TRUE,
    assert_atomic_vector(x)
  )
})

# assert_same_type ----
## Test 90: no error if same type ----
test_that("assert_same_type Test 90: no error if same type", {
  true_value <- "Y"
  false_value <- "N"
  expect_invisible(assert_same_type(true_value, false_value))
})

## Test 91: error if different type ----
test_that("assert_same_type Test 91: error if different type", {
  true_value <- "Y"
  false_value <- "N"
  missing_value <- 0

  # perform a class match of the error message
  expect_error(
    assert_same_type(true_value, false_value, missing_value),
    class = "assert_same_type"
  )
  expect_snapshot(
    error = TRUE,
    assert_same_type(true_value, false_value, missing_value)
  )
})

## Test 92: works as intended ----
test_that("assert_same_type Test 92: works as intended", {
  expect_equal(
    valid_time_units(),
    c("years", "months", "days", "hours", "minutes", "seconds")
  )
})
