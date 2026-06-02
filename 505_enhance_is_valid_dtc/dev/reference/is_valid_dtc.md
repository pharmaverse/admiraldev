# Is this string a valid DTC

Is this string a valid DTC

## Usage

``` r
is_valid_dtc(arg, valid_full_date = FALSE, valid_full_datetime = FALSE)
```

## Arguments

- arg:

  A `character` vector

  Default value

  :   none

- valid_full_date:

  If `TRUE`, the function will check if the string is a full date (i.e.
  it is exactly of the form `"yyyy-mm-dd"` and can be parsed by
  [`ymd()`](https://lubridate.tidyverse.org/reference/ymd.html)).

  Default value

  :   `FALSE`

- valid_full_datetime:

  If `TRUE`, the function will check if the string is a full datetime
  (i.e. it is exactly of the form `"yyyy-mm-ddThh:mm:ss"` and can be
  parsed by
  [`ymd_hms()`](https://lubridate.tidyverse.org/reference/ymd_hms.html)).

  Default value

  :   `FALSE`

## Value

`TRUE` if the argument is a valid `--DTC` string, `FALSE` otherwise

## Details

If both `check_full_date` and `check_full_time` are set to `FALSE`, the
function will only check if the string is a valid DTC string, which can
also be a partial date (e.g. `"2024"` or `"2024-05"`) or a partial
datetime (e.g. `"2024-05-01T12"`).

## See also

Identifies type of Object with return of TRUE/FALSE:
[`is_auto()`](https:/pharmaverse.github.io/admiraldev/505_enhance_is_valid_dtc/dev/reference/is_auto.md),
[`is_order_vars()`](https:/pharmaverse.github.io/admiraldev/505_enhance_is_valid_dtc/dev/reference/is_order_vars.md)
