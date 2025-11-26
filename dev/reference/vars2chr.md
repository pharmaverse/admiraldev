# Turn a List of Expressions into a Character Vector

Turn a List of Expressions into a Character Vector

## Usage

``` r
vars2chr(expressions)
```

## Arguments

- expressions:

  A `list` of expressions created using
  [`exprs()`](https://rlang.r-lib.org/reference/defusing-advanced.html)

  Default value

  :   none

## Value

A character vector

## See also

Developer Utility Functions:
[`%notin%()`](https://pharmaverse.github.io/admiraldev/dev/reference/grapes-notin-grapes.md),
[`%or%()`](https://pharmaverse.github.io/admiraldev/dev/reference/grapes-or-grapes.md),
[`arg_name()`](https://pharmaverse.github.io/admiraldev/dev/reference/arg_name.md),
[`contains_vars()`](https://pharmaverse.github.io/admiraldev/dev/reference/contains_vars.md),
[`convert_dtm_to_dtc()`](https://pharmaverse.github.io/admiraldev/dev/reference/convert_dtm_to_dtc.md),
[`extract_vars()`](https://pharmaverse.github.io/admiraldev/dev/reference/extract_vars.md),
[`filter_if()`](https://pharmaverse.github.io/admiraldev/dev/reference/filter_if.md),
[`friendly_type_of()`](https://pharmaverse.github.io/admiraldev/dev/reference/friendly_type_of.md),
[`valid_time_units()`](https://pharmaverse.github.io/admiraldev/dev/reference/valid_time_units.md)

## Examples

``` r
library(dplyr, warn.conflicts = FALSE)
library(rlang)

vars2chr(exprs(USUBJID, AVAL))
#>                     
#> "USUBJID"    "AVAL" 
```
