# Is an Argument a List of Variables?

Checks if an argument is a valid list of symbols (e.g., created by
[`exprs()`](https://rlang.r-lib.org/reference/defusing-advanced.html))

## Usage

``` r
assert_vars(
  arg,
  expect_names = FALSE,
  optional = FALSE,
  arg_name = rlang::caller_arg(arg),
  message = NULL,
  class = "assert_vars",
  call = parent.frame()
)
```

## Arguments

- arg:

  A function argument to be checked

  Default value

  :   none

- expect_names:

  If the argument is set to `TRUE`, it is checked if all variables are
  named, e.g., `exprs(APERSDT = APxxSDT, APEREDT = APxxEDT)`.

  Default value

  :   `FALSE`

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

The function throws an error if `arg` is not a list of symbols (e.g.,
created by
[`exprs()`](https://rlang.r-lib.org/reference/defusing-advanced.html)
and returns the input invisibly otherwise.

## See also

Checks for valid input and returns warning or errors messages:
[`assert_atomic_vector()`](https://pharmaverse.github.io/admiraldev/reference/assert_atomic_vector.md),
[`assert_character_scalar()`](https://pharmaverse.github.io/admiraldev/reference/assert_character_scalar.md),
[`assert_character_vector()`](https://pharmaverse.github.io/admiraldev/reference/assert_character_vector.md),
[`assert_data_frame()`](https://pharmaverse.github.io/admiraldev/reference/assert_data_frame.md),
[`assert_date_vector()`](https://pharmaverse.github.io/admiraldev/reference/assert_date_vector.md),
[`assert_expr()`](https://pharmaverse.github.io/admiraldev/reference/assert_expr.md),
[`assert_expr_list()`](https://pharmaverse.github.io/admiraldev/reference/assert_expr_list.md),
[`assert_filter_cond()`](https://pharmaverse.github.io/admiraldev/reference/assert_filter_cond.md),
[`assert_function()`](https://pharmaverse.github.io/admiraldev/reference/assert_function.md),
[`assert_integer_scalar()`](https://pharmaverse.github.io/admiraldev/reference/assert_integer_scalar.md),
[`assert_list_element()`](https://pharmaverse.github.io/admiraldev/reference/assert_list_element.md),
[`assert_list_of()`](https://pharmaverse.github.io/admiraldev/reference/assert_list_of.md),
[`assert_logical_scalar()`](https://pharmaverse.github.io/admiraldev/reference/assert_logical_scalar.md),
[`assert_named()`](https://pharmaverse.github.io/admiraldev/reference/assert_named.md),
[`assert_numeric_vector()`](https://pharmaverse.github.io/admiraldev/reference/assert_numeric_vector.md),
[`assert_one_to_one()`](https://pharmaverse.github.io/admiraldev/reference/assert_one_to_one.md),
[`assert_param_does_not_exist()`](https://pharmaverse.github.io/admiraldev/reference/assert_param_does_not_exist.md),
[`assert_s3_class()`](https://pharmaverse.github.io/admiraldev/reference/assert_s3_class.md),
[`assert_same_type()`](https://pharmaverse.github.io/admiraldev/reference/assert_same_type.md),
[`assert_symbol()`](https://pharmaverse.github.io/admiraldev/reference/assert_symbol.md),
[`assert_unit()`](https://pharmaverse.github.io/admiraldev/reference/assert_unit.md),
[`assert_varval_list()`](https://pharmaverse.github.io/admiraldev/reference/assert_varval_list.md)

## Examples

``` r
library(dplyr, warn.conflicts = FALSE)
library(rlang)

example_fun <- function(by_vars) {
  assert_vars(by_vars)
}

example_fun(exprs(USUBJID, PARAMCD))

try(example_fun(quos(USUBJID, PARAMCD)))
#> Error in example_fun(quos(USUBJID, PARAMCD)) : 
#>   Each element of the list in argument `by_vars` must be class/type
#> <symbol>.
#> ℹ But, element 1 is a <quosure> object, and element 2 is a <quosure> object

try(example_fun(c("USUBJID", "PARAMCD", "VISIT")))
#> Error in example_fun(c("USUBJID", "PARAMCD", "VISIT")) : 
#>   Argument `by_vars` must be class <list>, but is a character vector.

try(example_fun(exprs(USUBJID, toupper(PARAMCD), desc(AVAL))))
#> Error in example_fun(exprs(USUBJID, toupper(PARAMCD), desc(AVAL))) : 
#>   Each element of the list in argument `by_vars` must be class/type
#> <symbol>.
#> ℹ But, element 2 is a call, and element 3 is a call

example_fun_name <- function(by_vars) {
  assert_vars(by_vars, expect_names = TRUE)
}

example_fun_name(exprs(APERSDT = APxxSDT, APEREDT = APxxEDT))

try(example_fun_name(exprs(APERSDT = APxxSDT, APxxEDT)))
#> Error in example_fun_name(exprs(APERSDT = APxxSDT, APxxEDT)) : 
#>   All elements of `by_vars` argument must be named.
#> ℹ The indices of the unnamed elements are 2
```
