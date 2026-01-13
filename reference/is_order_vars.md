# Is order vars?

Check if inputs are created using
[`exprs()`](https://rlang.r-lib.org/reference/defusing-advanced.html) or
calls involving
[`desc()`](https://dplyr.tidyverse.org/reference/desc.html)

## Usage

``` r
is_order_vars(arg)
```

## Arguments

- arg:

  An R object

  Default value

  :   none

## Value

`FALSE` if the argument is not a list of order vars

## See also

Identifies type of Object with return of TRUE/FALSE:
[`is_auto()`](https://pharmaverse.github.io/admiraldev/reference/is_auto.md),
[`is_valid_dtc()`](https://pharmaverse.github.io/admiraldev/reference/is_valid_dtc.md)
