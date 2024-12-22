## Test 1:  Message is sent to user ----
test_that("lifecycle_admiral Test 1:  Simple message is sent to user", {
  example_fun <- function(dataset) {
    deprecate_inform(
      when = "1.0.0",
      what = "example_fun()",
      with = "example_fun2()"
    )
    assert_data_frame(dataset, required_vars = exprs(STUDYID, USUBJID))
  }

  data <- dplyr::tribble(
    ~STUDYID, ~USUBJID,
    "xyz",    123,
    "xyz",    456
  )

  expect_snapshot({
    example_fun(data)
    example_fun(data)
  })
})

# Test 2:  Nicer message is sent to user ----
test_that("lifecycle_admiral Test 2:  Spicier message is sent to user", {
  example_fun <- function(dataset) {
    deprecate_inform(
      when = "1.0.0",
      what = "example_fun()",
      with = "example_fun2()",
      details = c(
        x = "This message will turn into a warning with release of 1.1.0",
        i = "See admiral's deprecation guidance:
                       https://pharmaverse.github.io/admiraldev/dev/articles/programming_strategy.html#deprecation" # nolint
      )
    )
    assert_data_frame(dataset, required_vars = exprs(STUDYID, USUBJID))
  }

  data <- dplyr::tribble(
    ~STUDYID, ~USUBJID,
    "xyz",    123,
    "xyz",    456
  )

  expect_snapshot({
    example_fun(data)
    example_fun(data)
  })
})
