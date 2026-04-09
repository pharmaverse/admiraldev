# Standard Text for NA Handling in Sorting Variables

This function provides standardized documentation text about the
handling of `NA` values in sorting variables.

## Usage

``` r
roxygen_order_na_handling()
```

## Value

A character string with the standardized documentation text about NA
handling in sort order

## Details

The benefits of having a programmatic way to write documentation is that
if any changes need to be made, modifying this function scales across
the codebase, can be tested, and is less prone to user-error such as
typos or grammar mistakes.

## See also

Other documentation:
[`roxygen_param_by_vars()`](https://pharmaverse.github.io/admiraldev/dev/reference/roxygen_param_by_vars.md),
[`roxygen_param_dataset()`](https://pharmaverse.github.io/admiraldev/dev/reference/roxygen_param_dataset.md),
[`roxygen_save_memory()`](https://pharmaverse.github.io/admiraldev/dev/reference/roxygen_save_memory.md)

## Examples

``` r
roxygen_order_na_handling()
#> [1] "For handling of `NA`s in sorting variables see the \"Sort Order\" section in `vignette(\"generic\")`."
```
