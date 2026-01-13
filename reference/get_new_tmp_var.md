# Get a New Temporary Variable Name for a Dataset

Get a New Temporary Variable Name for a Dataset

## Usage

``` r
get_new_tmp_var(dataset, prefix = "tmp_var")
```

## Arguments

- dataset:

  The input dataset

  Default value

  :   none

- prefix:

  The prefix of the new temporary variable name to create

  Default value

  :   `"tmp_var"`

## Value

The name of a new temporary variable as a symbol

## Details

The function returns a new unique temporary variable name to be used
inside `dataset`. The temporary variable names have the structure
`prefix_n` where `n` is an integer, e.g. `tmp_var_1`. If there is
already a variable inside `datset` with a given `prefix` then the suffix
is increased by 1, e.g. if `tmp_var_1` already exists then
`get_new_tmp_var()` will return `tmp_var_2`.

## See also

[`remove_tmp_vars()`](https://pharmaverse.github.io/admiraldev/reference/remove_tmp_vars.md)

## Examples

``` r
library(dplyr, warn.conflicts = FALSE)
dm <- tribble(
  ~DOMAIN,  ~STUDYID,      ~USUBJID,
  "DM",    "STUDY X", "01-701-1015",
  "DM",    "STUDY X", "01-701-1016",
)

tmp_var <- get_new_tmp_var(dm)
mutate(dm, !!tmp_var := NA)
#> # A tibble: 2 × 4
#>   DOMAIN STUDYID USUBJID     tmp_var_1
#>   <chr>  <chr>   <chr>       <lgl>    
#> 1 DM     STUDY X 01-701-1015 NA       
#> 2 DM     STUDY X 01-701-1016 NA       
```
