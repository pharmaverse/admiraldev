# Is Argument a Function?

Checks if the argument is a function and if all expected arguments are
provided by the function.

## Usage

``` r
assert_function(
  arg,
  params = NULL,
  optional = FALSE,
  arg_name = rlang::caller_arg(arg),
  message = NULL,
  class = "assert_function",
  call = parent.frame()
)
```

## Arguments

- arg:

  A function

  The function to be checked

  Default value

  :   none

- params:

  A character vector

  A character vector of expected argument names for the aforementioned
  function in `arg`. If ellipsis, `...`, is included in the function
  formals of the function in `arg`, this argument, `params` will be
  ignored, accepting all values of the character vector.

  Default value

  :   `NULL`

- optional:

  Is the checked argument optional?

  If set to `FALSE` and `arg` is `NULL` then an error is thrown.

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

The function throws an error

- if the argument is not a function or

- if the function does not provide all arguments as specified for the
  `params` argument (assuming ellipsis is not in function formals)

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
[`assert_vars()`](https://pharmaverse.github.io/admiraldev/reference/assert_vars.md),
[`assert_varval_list()`](https://pharmaverse.github.io/admiraldev/reference/assert_varval_list.md)

## Examples

``` r
example_fun <- function(fun) {
  assert_function(fun, params = c("x"))
}

example_fun(mean)

try(example_fun(1))
#> Error in example_fun(1) : 
#>   Argument `fun` must be a function, but is a number.

try(example_fun(sum))
#> Error in example_fun(sum) : 
#>   "x" is not an argument of the function specified for `fun`.
```
