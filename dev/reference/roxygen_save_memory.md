# Standard Note for Memory-Intensive Functions

This function provides a standardized note about memory consumption for
functions that create large temporary datasets.

## Usage

``` r
roxygen_save_memory()
```

## Value

A character string with the standardized note about memory usage

## Details

The benefits of having a programmatic way to write documentation is that
if any changes need to be made, modifying this function scales across
the codebase, can be tested, and is less prone to user-error such as
typos or grammar mistakes.

## See also

Other documentation:
[`roxygen_order_na_handling()`](https://pharmaverse.github.io/admiraldev/dev/reference/roxygen_order_na_handling.md),
[`roxygen_param_by_vars()`](https://pharmaverse.github.io/admiraldev/dev/reference/roxygen_param_by_vars.md),
[`roxygen_param_dataset()`](https://pharmaverse.github.io/admiraldev/dev/reference/roxygen_param_dataset.md)

## Examples

``` r
roxygen_save_memory()
#> [1] "**Note:** This function creates temporary datasets which may be much bigger\nthan the input datasets. If this causes memory issues, please try setting\nthe admiral option `save_memory` to `TRUE` (see `set_admiral_options()`).\nThis reduces the memory consumption but increases the run-time."
```
