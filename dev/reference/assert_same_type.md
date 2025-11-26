# Are All Arguments of the Same Type?

Checks if all arguments are of the same type.

## Usage

``` r
assert_same_type(
  ...,
  .message = c("Arguments {.arg {arg_names}} must be the same type.", i =
    paste("Argument types are", paste0("{.arg ", arg_names, "} {.cls ", types, "}",
    collapse = ", "))),
  .class = "assert_same_type",
  .call = parent.frame()
)
```

## Arguments

- ...:

  Arguments to be checked

  Default value

  :   none

- .message:

  character vector passed to `cli_abort(message)` when assertion fails.

  Default value

  :   `c("Arguments {.arg {arg_names}} must be the same type.", i = paste( "Argument types are", paste0("{.arg ", arg_names, "} {.cls ", types, "}", collapse = ", ")))`

- .class:

  character vector passed to `cli_abort(class)` when assertion fails.

  Default value

  :   `"assert_same_type"`

- .call:

  environment passed to `cli_abort(call)` when assertion fails.

  Default value

  :   [`parent.frame()`](https://rdrr.io/r/base/sys.parent.html)

## Value

The function throws an error if not all arguments are of the same type.

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
[`assert_symbol()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_symbol.md),
[`assert_unit()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_unit.md),
[`assert_vars()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_vars.md),
[`assert_varval_list()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_varval_list.md)

## Examples

``` r
example_fun <- function(true_value, false_value, missing_value) {
  assert_same_type(true_value, false_value, missing_value)
}

example_fun(
  true_value = "Y",
  false_value = "N",
  missing_value = NA_character_
)

try(example_fun(
  true_value = 1,
  false_value = 0,
  missing_value = "missing"
))
#> Error in example_fun(true_value = 1, false_value = 0, missing_value = "missing") : 
#>   Arguments `true_value`, `false_value`, and `missing_value` must be the
#> same type.
#> ℹ Argument types are `true_value` <double>, `false_value` <double>,
#>   `missing_value` <character>
```
