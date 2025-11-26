# Extract All Symbols from a List of Expressions

Extract All Symbols from a List of Expressions

## Usage

``` r
extract_vars(x, side = "lhs")
```

## Arguments

- x:

  An `R` object

  Default value

  :   none

- side:

  One of `"lhs"` (the default) or `"rhs"` for formulas

  Default value

  :   `"lhs"`

## Value

A list of expressions

## See also

Developer Utility Functions:
[`%notin%()`](https://pharmaverse.github.io/admiraldev/dev/reference/grapes-notin-grapes.md),
[`%or%()`](https://pharmaverse.github.io/admiraldev/dev/reference/grapes-or-grapes.md),
[`arg_name()`](https://pharmaverse.github.io/admiraldev/dev/reference/arg_name.md),
[`contains_vars()`](https://pharmaverse.github.io/admiraldev/dev/reference/contains_vars.md),
[`convert_dtm_to_dtc()`](https://pharmaverse.github.io/admiraldev/dev/reference/convert_dtm_to_dtc.md),
[`filter_if()`](https://pharmaverse.github.io/admiraldev/dev/reference/filter_if.md),
[`friendly_type_of()`](https://pharmaverse.github.io/admiraldev/dev/reference/friendly_type_of.md),
[`valid_time_units()`](https://pharmaverse.github.io/admiraldev/dev/reference/valid_time_units.md),
[`vars2chr()`](https://pharmaverse.github.io/admiraldev/dev/reference/vars2chr.md)

## Examples

``` r
library(rlang)
extract_vars(exprs(PARAMCD, (BASE - AVAL) / BASE + 100))
#> [[1]]
#> PARAMCD
#> 
#> [[2]]
#> BASE
#> 
#> [[3]]
#> AVAL
#> 
extract_vars(AVAL ~ ARMCD + AGEGR1)
#> [[1]]
#> AVAL
#> 
extract_vars(AVAL ~ ARMCD + AGEGR1, side = "rhs")
#> [[1]]
#> ARMCD
#> 
#> [[2]]
#> AGEGR1
#> 
```
