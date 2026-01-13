# Warn If Two Lists are Inconsistent

Checks if two list inputs have the same names and same number of
elements and issues a warning otherwise.

## Usage

``` r
warn_if_inconsistent_list(base, compare, list_name, i = 2)
```

## Arguments

- base:

  A named list

  Default value

  :   none

- compare:

  A named list

  Default value

  :   none

- list_name:

  A string the name of the list

  Default value

  :   none

- i:

  the index id to compare the 2 lists

  Default value

  :   `2`

## Value

a `warning` if the 2 lists have different names or length

## See also

Function that provide users with custom warnings
[`suppress_warning()`](https://pharmaverse.github.io/admiraldev/reference/suppress_warning.md),
[`warn_if_incomplete_dtc()`](https://pharmaverse.github.io/admiraldev/reference/warn_if_incomplete_dtc.md),
[`warn_if_invalid_dtc()`](https://pharmaverse.github.io/admiraldev/reference/warn_if_invalid_dtc.md),
[`warn_if_vars_exist()`](https://pharmaverse.github.io/admiraldev/reference/warn_if_vars_exist.md)

## Examples

``` r
library(dplyr, warn.conflicts = FALSE)
library(rlang)

# no warning
warn_if_inconsistent_list(
  base = exprs(DTHDOM = "DM", DTHSEQ = DMSEQ),
  compare = exprs(DTHDOM = "DM", DTHSEQ = DMSEQ),
  list_name = "Test"
)
# warning
warn_if_inconsistent_list(
  base = exprs(DTHDOM = "DM", DTHSEQ = DMSEQ, DTHVAR = "text"),
  compare = exprs(DTHDOM = "DM", DTHSEQ = DMSEQ),
  list_name = "Test"
)
#> Warning: The variables used for traceability in `Test` are not consistent, please check:
#> source 1 , Variables are given as: DTHDOM DTHSEQ DTHVAR 
#> source 2 , Variables are given as: DTHDOM DTHSEQ
```
