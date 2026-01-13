# Is an Element of a List of Lists/Classes Fulfilling a Condition?

Checks if the elements of a list of named lists/classes fulfill a
certain condition. If not, an error is issued and all elements of the
list not fulfilling the condition are listed.

## Usage

``` r
assert_list_element(
  list,
  element,
  condition,
  message_text,
  arg_name = rlang::caller_arg(list),
  message = NULL,
  class = "assert_list_element",
  call = parent.frame(),
  ...
)
```

## Arguments

- list:

  A list to be checked A list of named lists or classes is expected.

  Default value

  :   none

- element:

  The name of an element of the lists/classes A character scalar is
  expected.

  Default value

  :   none

- condition:

  Condition to be fulfilled The condition is evaluated for each element
  of the list. The element of the lists/classes can be referred to by
  its name, e.g., `censor == 0` to check the `censor` field of a class.

  Default value

  :   none

- message_text:

  Text to be displayed in the error message above the listing of values
  that do not meet the condition. The text should describe the condition
  to be fulfilled, e.g.,
  `"Error in {arg_name}: the censor values must be zero."`. If `message`
  argument is specified, that text will be displayed and `message_text`
  is ignored.

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

- ...:

  Objects required to evaluate the condition or the message text

  If the condition or the message text contains objects apart from the
  element, they have to be passed to the function. See the second
  example below.

  Default value

  :   none

## Value

An error if the condition is not met. The input otherwise.

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
[`assert_vars()`](https://pharmaverse.github.io/admiraldev/reference/assert_vars.md),
[`assert_varval_list()`](https://pharmaverse.github.io/admiraldev/reference/assert_varval_list.md)

## Examples

``` r
death <- list(
  dataset_name = "adsl",
  date = "DTHDT",
  censor = 0
)

lstalv <- list(
  dataset_name = "adsl",
  date = "LSTALVDT",
  censor = 1
)

events <- list(death, lstalv)

try(assert_list_element(
  list = events,
  element = "censor",
  condition = censor == 0,
  message_text = "For events the censor values must be zero."
))
#> Error in eval(expr, envir) : 
#>   For events the censor values must be zero.
#> ℹ But, `events[[2]]$censor = 1`

try(assert_list_element(
  list = events,
  element = "dataset_name",
  condition = dataset_name %in% c("adrs", "adae"),
  valid_datasets = c("adrs", "adae"),
  message_text = paste(
    "The dataset name must be one of the following: {.val {valid_datasets}}"
  )
))
#> Error in eval(expr, envir) : 
#>   The dataset name must be one of the following: "adrs" and "adae"
#> ℹ But, `events[[1]]$dataset_name = adsl`, and `events[[2]]$dataset_name = adsl`
```
