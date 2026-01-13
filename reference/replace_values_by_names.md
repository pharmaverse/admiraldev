# Replace Expression Value with Name

Replace Expression Value with Name

## Usage

``` r
replace_values_by_names(expressions)
```

## Arguments

- expressions:

  A list of expressions

  Default value

  :   none

## Value

A list of expressions

## See also

Helpers for working with Quosures:
[`add_suffix_to_vars()`](https://pharmaverse.github.io/admiraldev/reference/add_suffix_to_vars.md),
[`expr_c()`](https://pharmaverse.github.io/admiraldev/reference/expr_c.md),
[`replace_symbol_in_expr()`](https://pharmaverse.github.io/admiraldev/reference/replace_symbol_in_expr.md)

## Examples

``` r
library(rlang)
replace_values_by_names(exprs(AVAL, ADT = convert_dtc_to_dt(EXSTDTC)))
#> [[1]]
#> AVAL
#> 
#> $ADT
#> ADT
#> 
```
