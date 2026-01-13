# Return English-friendly messaging for object-types

**\[deprecated\]**

This function is *deprecated*, please use `cli` functionality instead.

## Usage

``` r
friendly_type_of(x, value = TRUE, length = FALSE)
```

## Arguments

- x:

  Any R object.

  Default value

  :   none

- value:

  Whether to describe the value of `x`.

  Default value

  :   `TRUE`

- length:

  Whether to mention the length of vectors and lists.

  Default value

  :   `FALSE`

## Value

A string describing the type. Starts with an indefinite article, e.g.
"an integer vector".

## Details

This helper function aids us in forming user-friendly messages that gets
called through
[`what_is_it()`](https://pharmaverse.github.io/admiraldev/dev/reference/what_is_it.md),
which is often used in the assertion functions to identify what
object-type the user passed through an argument instead of an
expected-type.

## See also

Other deprecated:
[`%or%()`](https://pharmaverse.github.io/admiraldev/dev/reference/grapes-or-grapes.md),
[`arg_name()`](https://pharmaverse.github.io/admiraldev/dev/reference/arg_name.md),
[`enumerate()`](https://pharmaverse.github.io/admiraldev/dev/reference/enumerate.md),
[`valid_time_units()`](https://pharmaverse.github.io/admiraldev/dev/reference/valid_time_units.md),
[`what_is_it()`](https://pharmaverse.github.io/admiraldev/dev/reference/what_is_it.md)
