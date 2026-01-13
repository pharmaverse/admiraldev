# Get Constant Variables

Get Constant Variables

## Usage

``` r
get_constant_vars(dataset, by_vars, ignore_vars = NULL)
```

## Arguments

- dataset:

  A data frame.

  Default value

  :   none

- by_vars:

  By variables The groups defined by the by variables are considered
  separately. I.e., if a variable is constant within each by group, it
  is returned.

  Default value

  :   none

- ignore_vars:

  Variables to ignore The specified variables are not considered, i.e.,
  they are not returned even if they are constant (unless they are
  included in the by variables).

  Permitted values

  :   A list of variable names or selector function calls like
      `starts_with("EX")`

  Default value

  :   `NULL`

## Value

Variable vector.

## See also

Brings something to you!?!:
[`get_dataset()`](https://pharmaverse.github.io/admiraldev/reference/get_dataset.md),
[`get_duplicates()`](https://pharmaverse.github.io/admiraldev/reference/get_duplicates.md),
[`get_source_vars()`](https://pharmaverse.github.io/admiraldev/reference/get_source_vars.md)
