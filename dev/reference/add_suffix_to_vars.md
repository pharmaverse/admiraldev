# Add a Suffix to Variables in a List of Expressions

Add a suffix to variables in a list of expressions

## Usage

``` r
add_suffix_to_vars(order, vars, suffix)
```

## Arguments

- order:

  List of expressions

  Permitted values

  :   list of variables or `desc(<variable>)` function calls created by
      [`exprs()`](https://rlang.r-lib.org/reference/defusing-advanced.html),
      e.g., `exprs(ADT, desc(AVAL))`

  Default value

  :   none

- vars:

  Variables to change

  Permitted values

  :   list of variables created by
      [`exprs()`](https://rlang.r-lib.org/reference/defusing-advanced.html),
      e.g., `exprs(USUBJID, VISIT)`

  Default value

  :   none

- suffix:

  Suffix

  Permitted values

  :   a character scalar, i.e., a character vector of length one

  Default value

  :   none

## Value

The list of expression where for each element the suffix (`suffix`) is
added to every symbol specified for `vars`

## See also

Helpers for working with Quosures:
[`expr_c()`](https://pharmaverse.github.io/admiraldev/dev/reference/expr_c.md),
[`replace_symbol_in_expr()`](https://pharmaverse.github.io/admiraldev/dev/reference/replace_symbol_in_expr.md),
[`replace_values_by_names()`](https://pharmaverse.github.io/admiraldev/dev/reference/replace_values_by_names.md)

## Examples

``` r
library(dplyr, warn.conflicts = FALSE)
library(rlang)

add_suffix_to_vars(exprs(ADT, desc(AVAL), AVALC), vars = exprs(AVAL), suffix = ".join")
#> [[1]]
#> ADT
#> 
#> [[2]]
#> desc(AVAL.join)
#> 
#> [[3]]
#> AVALC
#> 
```
