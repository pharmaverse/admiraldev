# Suppress Specific Warnings

Suppress certain warnings issued by an expression.

## Usage

``` r
suppress_warning(expr, regexpr)
```

## Arguments

- expr:

  Expression to be executed

  Default value

  :   none

- regexpr:

  Regular expression matching warnings to suppress

  Default value

  :   none

## Value

Return value of the expression

## Details

All warnings which are issued by the expression and match the regular
expression are suppressed.

## See also

Function that provide users with custom warnings
[`warn_if_incomplete_dtc()`](https://pharmaverse.github.io/admiraldev/reference/warn_if_incomplete_dtc.md),
[`warn_if_inconsistent_list()`](https://pharmaverse.github.io/admiraldev/reference/warn_if_inconsistent_list.md),
[`warn_if_invalid_dtc()`](https://pharmaverse.github.io/admiraldev/reference/warn_if_invalid_dtc.md),
[`warn_if_vars_exist()`](https://pharmaverse.github.io/admiraldev/reference/warn_if_vars_exist.md)
