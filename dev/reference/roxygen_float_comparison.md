# Standard Text for Floating Point Comparisons in Conditions

This function provides standardized documentation text about comparing
floating point numbers in conditions, e.g., `PCHG <= -90`.

## Usage

``` r
roxygen_float_comparison()
```

## Value

A character string with the standardized documentation text about
floating point comparisons in conditions

## Details

The benefits of having a programmatic way to write documentation is that
if any changes need to be made, modifying this function scales across
the codebase, can be tested, and is less prone to user-error such as
typos or grammar mistakes.

## See also

Other documentation:
[`roxygen_order_na_handling()`](https://pharmaverse.github.io/admiraldev/dev/reference/roxygen_order_na_handling.md),
[`roxygen_param_by_vars()`](https://pharmaverse.github.io/admiraldev/dev/reference/roxygen_param_by_vars.md),
[`roxygen_param_dataset()`](https://pharmaverse.github.io/admiraldev/dev/reference/roxygen_param_dataset.md),
[`roxygen_save_memory()`](https://pharmaverse.github.io/admiraldev/dev/reference/roxygen_save_memory.md)

## Examples

``` r
roxygen_float_comparison()
#> [1] "Comparing derived numeric variables to fixed values, e.g., `PCHG <= -90`, may give unexpected results due to floating point representation. For details and solutions see the \"Floating Point Comparisons\" section in `vignette(\"concepts_conventions\")`."
```
