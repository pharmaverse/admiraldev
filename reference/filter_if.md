# Optional Filter

Filters the input dataset if the provided expression is not `NULL`

## Usage

``` r
filter_if(dataset, filter)
```

## Arguments

- dataset:

  Input dataset

  Default value

  :   none

- filter:

  A filter condition. Must be an expression.

  Default value

  :   none

## Value

A `data.frame` containing all rows in `dataset` matching `filter` or
just `dataset` if `filter` is `NULL`

## See also

Developer Utility Functions:
[`%notin%()`](https://pharmaverse.github.io/admiraldev/reference/grapes-notin-grapes.md),
[`contains_vars()`](https://pharmaverse.github.io/admiraldev/reference/contains_vars.md),
[`convert_dtm_to_dtc()`](https://pharmaverse.github.io/admiraldev/reference/convert_dtm_to_dtc.md),
[`extract_vars()`](https://pharmaverse.github.io/admiraldev/reference/extract_vars.md),
[`vars2chr()`](https://pharmaverse.github.io/admiraldev/reference/vars2chr.md)
