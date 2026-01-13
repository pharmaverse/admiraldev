# Or

**\[deprecated\]**

This function is *deprecated*. Please get in touch if you are using this
function!

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

Other deprecated:
[`arg_name()`](https://pharmaverse.github.io/admiraldev/dev/reference/arg_name.md),
[`enumerate()`](https://pharmaverse.github.io/admiraldev/dev/reference/enumerate.md),
[`friendly_type_of()`](https://pharmaverse.github.io/admiraldev/dev/reference/friendly_type_of.md),
[`valid_time_units()`](https://pharmaverse.github.io/admiraldev/dev/reference/valid_time_units.md),
[`what_is_it()`](https://pharmaverse.github.io/admiraldev/dev/reference/what_is_it.md)
