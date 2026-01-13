# Output a Dataset in a Vignette in the admiral Format

Output a dataset in a vignette with the pre-specified admiral format.

## Usage

``` r
dataset_vignette(dataset, display_vars = NULL, filter = NULL)
```

## Arguments

- dataset:

  Dataset to output in the vignette

  Default value

  :   none

- display_vars:

  Variables selected to demonstrate the outcome of the derivation

  If `display_vars` is not NULL, only the selected variables are visible
  in the vignette while the other variables are hidden. They can be made
  visible by clicking the`Choose the columns to display` button.

  Permitted values

  :   list of variables created by
      [`exprs()`](https://rlang.r-lib.org/reference/defusing-advanced.html),
      e.g., `exprs(USUBJID, VISIT)`

  Default value

  :   `NULL`

- filter:

  Filter condition

  The specified condition is applied to the dataset before it is
  displayed.

  Permitted values

  :   a condition

  Default value

  :   `NULL`

## Value

A HTML table
