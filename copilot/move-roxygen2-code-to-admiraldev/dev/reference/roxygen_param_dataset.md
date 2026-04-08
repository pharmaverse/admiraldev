# Standard Text for the `dataset` Argument

This function provides standardized documentation text for the `dataset`
argument used in `{admiral}` functions.

## Usage

``` r
roxygen_param_dataset(expected_vars = NULL)
```

## Arguments

- expected_vars:

  Variables expected in the dataset

  A character vector of variable names expected to be present in the
  `dataset` argument.

  Permitted values

  :   A character vector or `NULL`

  Default value

  :   `NULL`

## Value

A character string with the standardized documentation text for the
`dataset` argument

## Details

The benefits of having a programmatic way to write documentation is that
if any changes need to be made, modifying this function scales across
the codebase, can be tested, and is less prone to user-error such as
typos or grammar mistakes.

## See also

Other documentation:
[`roxygen_order_na_handling()`](https:/pharmaverse.github.io/admiraldev/copilot/move-roxygen2-code-to-admiraldev/dev/reference/roxygen_order_na_handling.md),
[`roxygen_param_by_vars()`](https:/pharmaverse.github.io/admiraldev/copilot/move-roxygen2-code-to-admiraldev/dev/reference/roxygen_param_by_vars.md),
[`roxygen_save_memory()`](https:/pharmaverse.github.io/admiraldev/copilot/move-roxygen2-code-to-admiraldev/dev/reference/roxygen_save_memory.md)

## Examples

``` r
roxygen_param_dataset()
#> [1] "Input dataset"

roxygen_param_dataset(expected_vars = c("by_vars"))
#> [1] "Input dataset \n \nThe variables specified by the `by_vars` argument are expected to be in the dataset."
```
