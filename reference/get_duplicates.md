# Get Duplicates From a Vector

Get Duplicates From a Vector

## Usage

``` r
get_duplicates(x)
```

## Arguments

- x:

  An atomic vector

  Default value

  :   none

## Value

A vector of the same type as `x` contain duplicate values

## See also

Brings something to you!?!:
[`get_constant_vars()`](https://pharmaverse.github.io/admiraldev/reference/get_constant_vars.md),
[`get_dataset()`](https://pharmaverse.github.io/admiraldev/reference/get_dataset.md),
[`get_source_vars()`](https://pharmaverse.github.io/admiraldev/reference/get_source_vars.md)

## Examples

``` r
get_duplicates(1:10)
#> integer(0)

get_duplicates(c("a", "a", "b", "c", "d", "d"))
#> [1] "a" "d"
```
