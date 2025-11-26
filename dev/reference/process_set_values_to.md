# Process `set_values_to` Argument

The function creates the variables specified by the `set_values_to`
argument, catches errors, provides user friendly error messages, and
optionally checks the type of the created variables.

## Usage

``` r
process_set_values_to(dataset, set_values_to = NULL, expected_types = NULL)
```

## Arguments

- dataset:

  Input dataset

  Default value

  :   none

- set_values_to:

  Variables to set

  A named list returned by
  [`exprs()`](https://rlang.r-lib.org/reference/defusing-advanced.html)
  defining the variables to be set, e.g.
  `exprs(PARAMCD = "OS", PARAM = "Overall Survival")` is expected. The
  values must be symbols, character strings, numeric values,
  expressions, or `NA`.

  Default value

  :   `NULL`

- expected_types:

  If the argument is specified, the specified variables are checked
  whether the specified type matches the type of the variables created
  by `set_values_to`.

  Permitted values

  :   A character vector with values `"numeric"` or `"character"`

  Default value

  :   `NULL`

## Value

The input dataset with the variables specified by `set_values_to`
added/updated

## Examples

``` r
library(dplyr)
data <- tribble(
  ~AVAL,
  20
)

try(
  process_set_values_to(
    data,
    set_values_to = exprs(
      PARAMCD = BMI
    )
  )
)
#> Error in process_set_values_to(data, set_values_to = exprs(PARAMCD = BMI)) : 
#>   Assigning variables failed!
#> • `set_values_to = exprs(PARAMCD = BMI)`
#> See error message below:
#> ℹ In argument: `PARAMCD = BMI`. Caused by error: ! object 'BMI' not found

try(
  process_set_values_to(
    data,
    set_values_to = exprs(
      PARAMCD = 42
    ),
    expected_types = c(PARAMCD = "character")
  )
)
#> Error in process_set_values_to(data, set_values_to = exprs(PARAMCD = 42),  : 
#>   The following variables have an unexpected type:
#> • PARAMCD: expected is <character>, but it is <numeric>.
```
