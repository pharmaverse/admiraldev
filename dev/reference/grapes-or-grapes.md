# Or

Or

## Usage

``` r
lhs %or% rhs
```

## Arguments

- lhs:

  Any valid R expression

  Default value

  :   none

- rhs:

  Any valid R expression

  Default value

  :   none

## Value

Either the result of evaluating `lhs`, `rhs` or an error

## Details

The function evaluates the expression `lhs` and if this expression
results in an error, it catches that error and proceeds with evaluating
the expression `rhs` and returns that result.

## See also

Developer Utility Functions:
[`%notin%()`](https://pharmaverse.github.io/admiraldev/dev/reference/grapes-notin-grapes.md),
[`arg_name()`](https://pharmaverse.github.io/admiraldev/dev/reference/arg_name.md),
[`contains_vars()`](https://pharmaverse.github.io/admiraldev/dev/reference/contains_vars.md),
[`convert_dtm_to_dtc()`](https://pharmaverse.github.io/admiraldev/dev/reference/convert_dtm_to_dtc.md),
[`extract_vars()`](https://pharmaverse.github.io/admiraldev/dev/reference/extract_vars.md),
[`filter_if()`](https://pharmaverse.github.io/admiraldev/dev/reference/filter_if.md),
[`friendly_type_of()`](https://pharmaverse.github.io/admiraldev/dev/reference/friendly_type_of.md),
[`valid_time_units()`](https://pharmaverse.github.io/admiraldev/dev/reference/valid_time_units.md),
[`vars2chr()`](https://pharmaverse.github.io/admiraldev/dev/reference/vars2chr.md)
