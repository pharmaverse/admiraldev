# Create test data with conflicting attributes
x <- dplyr::tribble(
  ~id, ~val_x,
  1,   "x1",
  2,   "x2",
  3,   "x3"
)

y <- dplyr::tribble(
  ~id, ~val_y,
  1,   "y1",
  2,   "y2"
)

# Assign different label attributes to trigger the specific dplyr warning
attr(x$id, "label") <- "LHS_ID"
attr(y$id, "label") <- "RHS_ID"

# anti_join ----
## Test 1: works without warning on attribute mismatch ----
test_that("anti_join Test 1: works without warning on attribute mismatch", {
  expect_snapshot(anti_join(x, y, by = "id"))
})

# inner_join ----
## Test 2: works without warning on attribute mismatch ----
test_that("inner_join Test 2: works without warning on attribute mismatch", {
  expect_snapshot(inner_join(x, y, by = "id"))
})

# left_join ----
## Test 3: works without warning on attribute mismatch ----
test_that("left_join Test 3: works without warning on attribute mismatch", {
  expect_snapshot(left_join(x, y, by = "id"))
})
