# Join Functions

The `*_join()` functions from `{dplyr}` without a warning on different
attributes in datasets.

## Usage

``` r
anti_join(x, y, by = NULL, copy = FALSE, ...)

inner_join(x, y, by = NULL, copy = FALSE, suffix = c(".x", ".y"), ...)

left_join(x, y, by = NULL, copy = FALSE, suffix = c(".x", ".y"), ...)
```

## Arguments

- x:

  `data.frame`

  Default value

  :   none

- y:

  `data.frame`

  Default value

  :   none

- by:

  `character` vector

  Default value

  :   `NULL`

- copy:

  `logical`

  Default value

  :   `FALSE`

- ...:

  Additional arguments

  Default value

  :   none

- suffix:

  `character` vector

  Default value

  :   `NULL`

## Value

`data.frame`
