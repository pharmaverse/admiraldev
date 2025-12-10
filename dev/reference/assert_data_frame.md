# Is an Argument a Data Frame?

Checks if an argument is a data frame and (optionally) whether is
contains a set of required variables

## Usage

``` r
assert_data_frame(
  arg,
  required_vars = NULL,
  check_is_grouped = TRUE,
  check_is_rowwise = TRUE,
  optional = FALSE,
  arg_name = rlang::caller_arg(arg),
  message = NULL,
  class = "assert_data_frame",
  call = parent.frame()
)
```

## Arguments

- arg:

  A function argument to be checked

  Default value

  :   none

- required_vars:

  A list of variables created using
  [`exprs()`](https://rlang.r-lib.org/reference/defusing-advanced.html)

  Default value

  :   `NULL`

- check_is_grouped:

  Throws an error if `dataset` is grouped

  Default value

  :   `TRUE`

- check_is_rowwise:

  Throws an error if `dataset` is rowwise

  Default value

  :   `TRUE`

- optional:

  Is the checked argument optional? If set to `FALSE` and `arg` is
  `NULL` then an error is thrown

  Default value

  :   `FALSE`

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

The function throws an error if `arg` is not a data frame or if `arg` is
a data frame but misses any variable specified in `required_vars`.
Otherwise, the input is returned invisibly.

## See also

Checks for valid input and returns warning or errors messages:
[`assert_atomic_vector()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_atomic_vector.md),
[`assert_character_scalar()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_character_scalar.md),
[`assert_character_vector()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_character_vector.md),
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
[`assert_unit()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_unit.md),
[`assert_vars()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_vars.md),
[`assert_varval_list()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_varval_list.md)

## Examples

``` r
library(dplyr)
library(rlang)
dm <- tribble(
  ~STUDYID, ~USUBJID,
  "XYZ",    "1",
  "XYZ",    "2"
)

example_fun <- function(dataset) {
  assert_data_frame(dataset, required_vars = exprs(STUDYID, USUBJID))
}

example_fun(dm)

try(example_fun(select(dm, -STUDYID)))
#> Error in example_fun(select(dm, -STUDYID)) : 
#>   Required variable `STUDYID` is missing in `dataset`

try(example_fun("Not a dataset"))
#> Error in example_fun("Not a dataset") : 
#>   Argument `dataset` must be class <data.frame>, but is a string.

try(example_fun(group_by(dm, USUBJID)))
#> Error in example_fun(group_by(dm, USUBJID)) : 
#>   Argument `dataset` must not be a grouped dataset, please
#> `dplyr::ungroup()` it.
```
