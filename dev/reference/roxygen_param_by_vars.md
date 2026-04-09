# Standard Text for the `by_vars` Argument

This function provides standardized documentation text for the `by_vars`
argument used in `{admiral}` functions.

## Usage

``` r
roxygen_param_by_vars(rename = FALSE)
```

## Arguments

- rename:

  Should the renaming feature be documented?

  If `TRUE`, the text includes information about renaming variables
  using named elements in `by_vars`.

  Permitted values

  :   `TRUE`, `FALSE`

  Default value

  :   `FALSE`

## Value

A character string with the standardized documentation text for the
`by_vars` argument

## Details

The benefits of having a programmatic way to write documentation is that
if any changes need to be made, modifying this function scales across
the codebase, can be tested, and is less prone to user-error such as
typos or grammar mistakes.

## See also

Other documentation:
[`roxygen_order_na_handling()`](https://pharmaverse.github.io/admiraldev/dev/reference/roxygen_order_na_handling.md),
[`roxygen_param_dataset()`](https://pharmaverse.github.io/admiraldev/dev/reference/roxygen_param_dataset.md),
[`roxygen_save_memory()`](https://pharmaverse.github.io/admiraldev/dev/reference/roxygen_save_memory.md)

## Examples

``` r
roxygen_param_by_vars()
#> [1] ""

roxygen_param_by_vars(rename = TRUE)
#> [1] "Variables can be renamed by naming the element, i.e. \n`by_vars = exprs(<name in input dataset> = <name in additional dataset>)`, similar to the `dplyr` joins."
```
