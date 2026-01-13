# Is an Argument a Character Scalar (String)?

Checks if an argument is a character scalar and (optionally) whether it
matches one of the provided `values`.

## Usage

``` r
assert_character_scalar(
  arg,
  values = NULL,
  case_sensitive = TRUE,
  optional = FALSE,
  arg_name = rlang::caller_arg(arg),
  message = NULL,
  class = "assert_character_scalar",
  call = parent.frame()
)
```

## Arguments

- arg:

  A function argument to be checked

  Default value

  :   none

- values:

  A `character` vector of valid values for `arg`. Values is converted to
  a lower case vector if case_sensitive = FALSE is used.

  Default value

  :   `NULL`

- case_sensitive:

  Should the argument be handled case-sensitive? If set to `FALSE`, the
  argument is converted to lower case for checking the permitted values
  and returning the argument.

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

The function throws an error if `arg` is not a character vector or if
`arg` is a character vector but of length \> 1 or if its value is not
one of the `values` specified. Otherwise, the input is returned
invisibly.

## See also

Checks for valid input and returns warning or errors messages:
[`assert_atomic_vector()`](https://pharmaverse.github.io/admiraldev/reference/assert_atomic_vector.md),
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
[`assert_vars()`](https://pharmaverse.github.io/admiraldev/reference/assert_vars.md),
[`assert_varval_list()`](https://pharmaverse.github.io/admiraldev/reference/assert_varval_list.md)

## Examples

``` r
example_fun <- function(msg_type) {
  assert_character_scalar(msg_type, values = c("warning", "error"))
}

example_fun("warning")

try(example_fun("message"))
#> Error in example_fun("message") : 
#>   Argument `msg_type` must be equal to one of "warning" or "error".

try(example_fun(TRUE))
#> Error in example_fun(TRUE) : 
#>   Argument `msg_type` must be a scalar of class <character>, but is
#> `TRUE`.

# handling arguments case-insensitive
example_fun2 <- function(msg_type) {
  msg_type <- assert_character_scalar(
    msg_type,
    values = c("warning", "error"),
    case_sensitive = FALSE
  )
  if (msg_type == "warning") {
    print("A warning was requested.")
  }
}

example_fun2("Warning")
#> [1] "A warning was requested."
```
