# Warn If a Variable Already Exists

Warn if a variable already exists inside a dataset

## Usage

``` r
warn_if_vars_exist(dataset, vars)
```

## Arguments

- dataset:

  A `data.frame`

  Default value

  :   none

- vars:

  `character` vector of columns to check for in `dataset`

  Default value

  :   none

## Value

No return value, called for side effects

## See also

Function that provide users with custom warnings
[`suppress_warning()`](https://pharmaverse.github.io/admiraldev/dev/reference/suppress_warning.md),
[`warn_if_incomplete_dtc()`](https://pharmaverse.github.io/admiraldev/dev/reference/warn_if_incomplete_dtc.md),
[`warn_if_inconsistent_list()`](https://pharmaverse.github.io/admiraldev/dev/reference/warn_if_inconsistent_list.md),
[`warn_if_invalid_dtc()`](https://pharmaverse.github.io/admiraldev/dev/reference/warn_if_invalid_dtc.md)

## Examples

``` r
library(dplyr, warn.conflicts = FALSE)
dm <- tribble(
  ~USUBJID,           ~ARM,
  "01-701-1015", "Placebo",
  "01-701-1016", "Placebo",
)

## No warning as `AAGE` doesn't exist in `dm`
warn_if_vars_exist(dm, "AAGE")

## Issues a warning
warn_if_vars_exist(dm, "ARM")
#> Warning: Variable "ARM" already exists in the dataset.
```
