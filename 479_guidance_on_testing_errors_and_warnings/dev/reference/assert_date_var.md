# Is a Variable in a Dataset a Date or Datetime Variable?

Checks if a variable in a dataset is a date or datetime variable

## Usage

``` r
assert_date_var(
  dataset,
  var,
  dataset_name = rlang::caller_arg(dataset),
  var_name = rlang::caller_arg(var),
  message = NULL,
  class = "assert_date_var",
  call = parent.frame()
)
```

## Arguments

- dataset:

  The dataset where the variable is expected

  Default value

  :   none

- var:

  The variable to check

  Default value

  :   none

- dataset_name:

  The name of the dataset. If the argument is specified, the specified
  name is displayed in the error message.

  Default value

  :   `rlang::caller_arg(dataset)`

- var_name:

  The name of the variable. If the argument is specified, the specified
  name is displayed in the error message.

  Default value

  :   `rlang::caller_arg(var)`

- message:

  (`string`)  
  string passed to `cli::cli_abort(message)`. When `NULL`, default
  messaging is used (see examples for default messages). `"var_name"`
  and `"dataset_name"`, can be used in messaging.

  Default value

  :   `NULL`

- class:

  Subclass of the condition.

- call:

  The execution environment of a currently running function, e.g.
  `call = caller_env()`. The corresponding function call is retrieved
  and mentioned in error messages as the source of the error.

  You only need to supply `call` when throwing a condition from a helper
  function which wouldn't be relevant to mention in the message.

  Can also be `NULL` or a [defused function
  call](https://rlang.r-lib.org/reference/topic-defuse.html) to
  respectively not display any call or hard-code a code to display.

  For more information about error calls, see [Including function calls
  in error
  messages](https://rlang.r-lib.org/reference/topic-error-call.html).

## Value

The function throws an error if `var` is not a date or datetime variable
in `dataset` and returns the input invisibly otherwise.

## Examples

``` r
library(lubridate)
#> 
#> Attaching package: ‘lubridate’
#> The following objects are masked from ‘package:base’:
#> 
#>     date, intersect, setdiff, union
library(dplyr)
library(rlang)

example_fun <- function(dataset, var) {
  var <- assert_symbol(enexpr(var))
  assert_date_var(dataset = dataset, var = !!var)
}

my_data <- tribble(
  ~USUBJID, ~ADT,
  "1",      ymd("2020-12-06"),
  "2",      ymd("")
)

example_fun(
  dataset = my_data,
  var = ADT
)

try(example_fun(
  dataset = my_data,
  var = USUBJID
))
#> Error in example_fun(dataset = my_data, var = USUBJID) : 
#>   Column "USUBJID" in dataset `dataset` must be a date or datetime, but is
#> a character vector.

example_fun2 <- function(dataset, var) {
  var <- assert_symbol(enexpr(var))
  assert_date_var(
    dataset = dataset,
    var = !!var,
    dataset_name = "your_data",
    var_name = "your_var"
  )
}

try(example_fun2(
  dataset = my_data,
  var = USUBJID
))
#> Error in example_fun2(dataset = my_data, var = USUBJID) : 
#>   Column "your_var" in dataset `your_data` must be a date or datetime, but
#> is a character vector.
```
