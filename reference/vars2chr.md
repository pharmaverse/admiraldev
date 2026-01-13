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
[`%notin%()`](https://pharmaverse.github.io/admiraldev/reference/grapes-notin-grapes.md),
[`contains_vars()`](https://pharmaverse.github.io/admiraldev/reference/contains_vars.md),
[`convert_dtm_to_dtc()`](https://pharmaverse.github.io/admiraldev/reference/convert_dtm_to_dtc.md),
[`extract_vars()`](https://pharmaverse.github.io/admiraldev/reference/extract_vars.md),
[`filter_if()`](https://pharmaverse.github.io/admiraldev/reference/filter_if.md)

## Examples

``` r
library(dplyr, warn.conflicts = FALSE)
library(rlang)

vars2chr(exprs(USUBJID, AVAL))
#>                     
#> "USUBJID"    "AVAL" 
```
