# Asserts That a Parameter is Provided in the Expected Unit

Checks if a parameter (`PARAMCD`) in a dataset is provided in the
expected unit.

## Usage

``` r
assert_unit(
  dataset,
  param,
  required_unit = NULL,
  get_unit_expr,
  arg_name = rlang::caller_arg(required_unit),
  message = NULL,
  class = "assert_unit",
  call = parent.frame()
)
```

## Arguments

- dataset:

  Dataset to be checked

  The variable `PARAMCD` and those used in `get_unit_expr` are expected.

  Default value

  :   none

- param:

  Parameter code of the parameter to check

  Default value

  :   none

- required_unit:

  Expected unit(s)

  If the argument is set to `NULL`, it is checked only whether the unit
  is unique within the parameter.

  Permitted values

  :   A character vector or `NULL`

  Default value

  :   `NULL`

- get_unit_expr:

  Expression used to provide the unit of `param`

  Default value

  :   none

- arg_name:

  string indicating the label/symbol of the object being checked.

  Default value

  :   `rlang::caller_arg(arg)`

- message:

  string passed to `cli::cli_abort(message)`. When `NULL`, default
  messaging is used (see examples for default messages). `"{arg_name}"`
  can be used in messaging.

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

The function throws an error

- if there is more than one non-missing unit in the dataset or

- if the unit variable differs from the expected unit for any
  observation of the parameter in the input dataset.

Otherwise, the dataset is returned invisibly.

## See also

Checks for valid input and returns warning or errors messages:
[`assert_atomic_vector()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_atomic_vector.md),
[`assert_character_scalar()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_character_scalar.md),
[`assert_character_vector()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_character_vector.md),
[`assert_data_frame()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_data_frame.md),
[`assert_date_vector()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_date_vector.md),
[`assert_expr()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_expr.md),
[`assert_expr_list()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_expr_list.md),
[`assert_filter_cond()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_filter_cond.md),
[`assert_function()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_function.md),
[`assert_integer_scalar()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_integer_scalar.md),
[`assert_list_element()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_list_element.md),
[`assert_list_of()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_list_of.md),
[`assert_logical_scalar()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_logical_scalar.md),
[`assert_named()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_named.md),
[`assert_numeric_vector()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_numeric_vector.md),
[`assert_one_to_one()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_one_to_one.md),
[`assert_param_does_not_exist()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_param_does_not_exist.md),
[`assert_s3_class()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_s3_class.md),
[`assert_same_type()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_same_type.md),
[`assert_symbol()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_symbol.md),
[`assert_vars()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_vars.md),
[`assert_varval_list()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_varval_list.md)

## Examples

``` r
library(dplyr)

advs <- tribble(
  ~USUBJID, ~VSTESTCD, ~VSTRESN, ~VSSTRESU, ~PARAMCD, ~AVAL,
  "P01",    "WEIGHT",      80.1, "kg",      "WEIGHT",  80.1,
  "P02",    "WEIGHT",      85.7, "kg",      "WEIGHT",  85.7
)

assert_unit(advs, param = "WEIGHT", required_unit = "kg", get_unit_expr = VSSTRESU)

try(
  assert_unit(
    advs,
    param = "WEIGHT",
    required_unit = c("g", "mg"),
    get_unit_expr = VSSTRESU
  )
)
#> Error in eval(expr, envir) : 
#>   It is expected that "WEIGHT" has unit of "g" or "mg". In the input
#> dataset the unit is "kg".

# Checking uniqueness of unit only
advs <- tribble(
  ~USUBJID, ~VSTESTCD, ~VSTRESN, ~VSSTRESU, ~PARAMCD, ~AVAL,
  "P01",    "WEIGHT",      80.1, "kg",      "WEIGHT",  80.1,
  "P02",    "WEIGHT",     85700, "g",       "WEIGHT", 85700
)

try(
  assert_unit(advs, param = "WEIGHT", get_unit_expr = VSSTRESU)
)
#> Error in eval(expr, envir) : 
#>   Multiple units "kg" and "g" found for "WEIGHT". Please review and update
#> the units.
```
