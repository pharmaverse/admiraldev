# Replace Symbols in an Expression

Replace symbols in an expression

## Usage

``` r
replace_symbol_in_expr(expression, target, replace)
```

## Arguments

- expression:

  Expression

  Permitted values

  :   a quoted expression, e.g., created by
      [`expr()`](https://rlang.r-lib.org/reference/expr.html)

  Default value

  :   none

- target:

  Target symbol

  Permitted values

  :   an unquoted symbol, e.g., `AVAL`

  Default value

  :   none

- replace:

  Replacing symbol

  Permitted values

  :   an unquoted symbol, e.g., `AVAL`

  Default value

  :   none

## Value

The expression where every occurrence of the symbol `target` is replaced
by `replace`

## See also

Helpers for working with Quosures:
[`add_suffix_to_vars()`](https://pharmaverse.github.io/admiraldev/dev/reference/add_suffix_to_vars.md),
[`expr_c()`](https://pharmaverse.github.io/admiraldev/dev/reference/expr_c.md),
[`replace_values_by_names()`](https://pharmaverse.github.io/admiraldev/dev/reference/replace_values_by_names.md)

## Author

Stefan Bundfuss

## Examples

``` r
library(rlang)

replace_symbol_in_expr(expr(AVAL), target = AVAL, replace = AVAL.join)
#> AVAL.join
replace_symbol_in_expr(expr(AVALC), target = AVAL, replace = AVAL.join)
#> AVALC
replace_symbol_in_expr(expr(desc(AVAL)), target = AVAL, replace = AVAL.join)
#> desc(AVAL.join)
replace_symbol_in_expr(expr(if_else(AVAL > 0, AVAL, NA)), AVAL, AVAL.join)
#> if_else(AVAL.join > 0, AVAL.join, NA)
```
