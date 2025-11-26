# What Kind of Object is This?

Returns a string describing what kind of object the input is.

## Usage

``` r
what_is_it(x)
```

## Arguments

- x:

  Any R object

  Default value

  :   none

## Value

A `character` description of the type of `x`

## Examples

``` r
what_is_it("abc")
#> Warning: `what_is_it()` was deprecated in admiraldev 1.1.0.
#> ℹ This function was primarily used in error messaging, and can be replaced with
#>   'cli' functionality: `cli::cli_abort('{.obj_type_friendly {letters}}')`.
#> [1] "`\"abc\"`"
what_is_it(1L)
#> [1] "`1`"
what_is_it(1:10)
#> [1] "an integer vector"
what_is_it(mtcars)
#> [1] "a data frame"
```
