# Is this string a valid DTC?

Is this string a valid DTC?

## Usage

``` r
is_valid_dtc(arg, check_dtc = FALSE)
```

## Arguments

- arg:

  The string to check.

  Permitted values

  :   a character scalar, i.e., a character vector of length one

  Default value

  :   none

- check_dtc:

  If `TRUE`, the function will check if the string is a real, date or
  datetime (e.g. "2020-02-31" is not real). Note that `NA` is a valid
  datetime.

  Permitted values

  :   `TRUE`, `FALSE`

  Default value

  :   `FALSE`

## Value

`TRUE` if the argument is a valid `--DTC` string, `FALSE` otherwise

## Details

If `check_dtc` is `FALSE`, the function only checks if the format of the
string is valid, i.e. it will not check if the actual date/datetime is
real, so calls such as `is_valid_dtc("2020-13", check_dtc = FALSE))` and
`is_valid_dtc("2020-12-01T25:00:00", check_dtc = FALSE)` will
return`TRUE`.

## See also

Identifies type of Object with return of TRUE/FALSE:
[`is_auto()`](https:/pharmaverse.github.io/admiraldev/505_enhance_is_valid_dtc/dev/reference/is_auto.md),
[`is_order_vars()`](https:/pharmaverse.github.io/admiraldev/505_enhance_is_valid_dtc/dev/reference/is_order_vars.md)
