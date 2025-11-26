# Warn If a Vector Contains Unknown Datetime Format

Warn if the vector contains unknown datetime format such as
"2003-12-15T-:15:18", "2003-12-15T13:-:19","–12-15","—–T07:15"

## Usage

``` r
warn_if_invalid_dtc(dtc, is_valid = is_valid_dtc(dtc))
```

## Arguments

- dtc:

  a character vector containing the dates

  Default value

  :   none

- is_valid:

  a logical vector indicating whether elements in `dtc` are valid

  Default value

  :   `is_valid_dtc(dtc)`

## Value

No return value, called for side effects

## See also

Function that provide users with custom warnings
[`suppress_warning()`](https://pharmaverse.github.io/admiraldev/dev/reference/suppress_warning.md),
[`warn_if_incomplete_dtc()`](https://pharmaverse.github.io/admiraldev/dev/reference/warn_if_incomplete_dtc.md),
[`warn_if_inconsistent_list()`](https://pharmaverse.github.io/admiraldev/dev/reference/warn_if_inconsistent_list.md),
[`warn_if_vars_exist()`](https://pharmaverse.github.io/admiraldev/dev/reference/warn_if_vars_exist.md)

## Examples

``` r
## No warning as `dtc` is a valid date format
warn_if_invalid_dtc(dtc = "2021-04-06")

## Issues a warning
warn_if_invalid_dtc(dtc = "2021-04-06T-:30:30")
```
