# Is an Argument a List of Objects of a Specific S3 Class or Type?

Checks if an argument is a `list` of objects inheriting from the S3
class or type specified.

## Usage

``` r
assert_list_of(
  arg,
  cls,
  named = FALSE,
  optional = TRUE,
  arg_name = rlang::caller_arg(arg),
  message = NULL,
  class = "assert_list_of",
  call = parent.frame()
)
```

## Arguments

- arg:

  A function argument to be checked

  Default value

  :   none

- cls:

  The S3 class or type to check for

  Default value

  :   none

- named:

  If set to `TRUE`, an error is issued if not all elements of the list
  are named.

  Default value

  :   `FALSE`

- optional:

  Is the checked argument optional? If set to `FALSE` and `arg` is
  `NULL` then an error is thrown

  Default value

  :   `TRUE`

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

The function throws an error if `arg` is not a list or if `arg` is a
list but its elements are not objects inheriting from `class` or of type
`class`. Otherwise, the input is returned invisibly.

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
example_fun <- function(list) {
  assert_list_of(list, "data.frame")
}

example_fun(list(mtcars, iris))

try(example_fun(list(letters, 1:10)))
#> Error in example_fun(list(letters, 1:10)) : 
#>   Each element of the list in argument `list` must be class/type
#> <data.frame>.
#> ℹ But, element 1 is a character vector, and element 2 is an integer vector

try(example_fun(c(TRUE, FALSE)))
#> Error in example_fun(c(TRUE, FALSE)) : 
#>   Argument `list` must be class <list>, but is a logical vector.

example_fun2 <- function(list) {
  assert_list_of(list, "numeric", named = TRUE)
}
try(example_fun2(list(1, 2, 3, d = 4)))
#> Error in example_fun2(list(1, 2, 3, d = 4)) : 
#>   All elements of `list` argument must be named.
#> ℹ The indices of the unnamed elements are 1, 2, and 3
```
