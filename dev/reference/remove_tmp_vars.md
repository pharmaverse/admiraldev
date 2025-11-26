# Remove All Temporary Variables Created Within the Current Function Environment

Remove All Temporary Variables Created Within the Current Function
Environment

## Usage

``` r
remove_tmp_vars(dataset)
```

## Arguments

- dataset:

  The input dataset

  Default value

  :   none

## Value

The input dataset with temporary variables removed

## See also

[`get_new_tmp_var()`](https://pharmaverse.github.io/admiraldev/dev/reference/get_new_tmp_var.md)

## Examples

``` r
library(dplyr, warn.conflicts = FALSE)
dm <- tribble(
  ~DOMAIN,  ~STUDYID,      ~USUBJID,
  "DM",    "STUDY X", "01-701-1015",
  "DM",    "STUDY X", "01-701-1016",
)
dm <- select(dm, USUBJID)
tmp_var <- get_new_tmp_var(dm)
dm <- mutate(dm, !!tmp_var := NA)

## This function creates two new temporary variables which are removed when calling
## `remove_tmp_vars()`. Note that any temporary variable created outside this
## function is **not** removed
do_something <- function(dataset) {
  tmp_var_1 <- get_new_tmp_var(dm)
  tmp_var_2 <- get_new_tmp_var(dm)
  dm %>%
    mutate(!!tmp_var_1 := NA, !!tmp_var_2 := NA) %>%
    print() %>%
    remove_tmp_vars()
}

do_something(dm)
#> # A tibble: 2 × 4
#>   USUBJID     tmp_var_1 tmp_var_2 tmp_var_3
#>   <chr>       <lgl>     <lgl>     <lgl>    
#> 1 01-701-1015 NA        NA        NA       
#> 2 01-701-1016 NA        NA        NA       
#> # A tibble: 2 × 2
#>   USUBJID     tmp_var_1
#>   <chr>       <lgl>    
#> 1 01-701-1015 NA       
#> 2 01-701-1016 NA       
```
