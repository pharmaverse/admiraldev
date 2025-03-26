# rdx_roclet ----
## Test 1: test roclet ----
test_that("rdx_roclet Test 1: test roclet", {
  withr::with_dir(
    "../..",
    roxytopic <- roxygen2::roc_proc_text(
      rdx_roclet(),
      readLines("tests/testthat/fixtures/test_fun.R")
    )
  )
  temp_file <- tempfile(fileext = ".Rd")
  writeLines(roxytopic$test_fun.R$format(), temp_file)
  expect_snapshot_file(temp_file, "test_fun.Rd")
})

# capture_output ----
# Note: any cases that consider warnings can't be tested because the code
# behaves differently in the test environment.
## Test 2: output is captured ----
test_that("capture_output Test 2: output is captured", {
  expect_equal(
    capture_output(1 + 1),
    "[1] 2"
  )
})

## Test 3: error if unexpected condition ----
test_that("capture_output Test 3: error if unexpected condition", {
  expect_error(
    capture_output(message("Hallo")),
    class = "admiraldev-unexpected_cnd"
  )
})

# parse_code ----
## Test 4: parse code ----
test_that("parse_code Test 4: parse code", {
  expect_equal(
    parse_code(c("1+1\n2*2", "s <- sum(\n  1,\n  2\n)")),
    list(
      list(expr = expr(1 + 1), srcref = "1+1", eval = TRUE),
      list(expr = expr(2 * 2), srcref = "2*2", eval = TRUE),
      list(
        expr = expr(s <- sum(1, 2)),
        srcref = c("s <- sum(", "  1,", "  2", ")"),
        eval = TRUE
      )
    )
  )
})

## Test 5: preserve comments and empty lines ----
test_that("parse_code Test 5: preserve comments and empty lines", {
  expect_equal(
    parse_code(c("# compute sum", "", "s <- sum(\n  1, # first\n  2 #second\n)")),
    list(
      list(expr = NULL, srcref = "# compute sum", eval = FALSE),
      list(expr = NULL, srcref = "", eval = FALSE),
      list(
        expr = expr(s <- sum(1, 2)),
        srcref = c("s <- sum(", "  1, # first", "  2 #second", ")"),
        eval = TRUE
      )
    )
  )
})

# capture_message ----
# Note: capturing warnings can't be tested in test_that because the code
# behaves differently in the test environment.
## Test 6: capture message ----
test_that("capture_message Test 6: capture message", {
  expect_equal(
    capture_message({
      message("This is a message")
      stop("This is an error")
    }),
    c(
      "This is a message",
      "Error in eval(expr) : This is an error"
    )
  )
})

## Test 7: capture message with open sink ----
test_that("capture_message Test 7: capture message with open sink", {
  temp_file <- tempfile(fileext = ".txt")
  con <- file(temp_file, "w")
  sink(con, type = "message") # nolint
  out <- capture_message({
    message("This is a message")
    stop("This is an error")
  })
  message("Hello")
  sink(type = "message") # nolint
  close(con)
  expect_equal(
    readLines(temp_file),
    "Hello"
  )
})
