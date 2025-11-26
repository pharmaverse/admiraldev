# Enumerate Multiple Elements

Enumerate multiple elements of a vector or list.

## Usage

``` r
enumerate(x, quote_fun = backquote, conjunction = "and")
```

## Arguments

- x:

  A vector or list

  Default value

  :   none

- quote_fun:

  Quoting function, defaults to `backquote`. If set to `NULL`, the
  elements are not quoted.

  Default value

  :   `backquote`

- conjunction:

  Character to be used in the message, defaults to `"and"`.

  Default value

  :   `"and"`

## Value

A `character` vector

## See also

Helpers for working with Quotes and Quoting:
[`backquote()`](https://pharmaverse.github.io/admiraldev/dev/reference/backquote.md),
[`dquote()`](https://pharmaverse.github.io/admiraldev/dev/reference/dquote.md),
[`squote()`](https://pharmaverse.github.io/admiraldev/dev/reference/squote.md)

## Examples

``` r
enumerate(c("one", "two", "three"))
#> Warning: `enumerate()` was deprecated in admiraldev 1.1.0.
#> ℹ This function was primarily used in error messaging, and can be replaced with
#>   'cli' functionality: `cli::cli_abort('{.val {letters[1:3]}}')`
#> [1] "`one`, `two` and `three`"

enumerate(c(1, 2, 3), quote_fun = NULL)
#> [1] "1, 2 and 3"
```
