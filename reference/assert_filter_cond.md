# Is an Argument a Filter Condition?

Is an Argument a Filter Condition?

## Usage

``` r
assert_filter_cond(
  arg,
  optional = FALSE,
  arg_name = gsub("^enexpr\\((.*)\\)$", "\\1", rlang::caller_arg(arg)),
  message = NULL,
  class = "assert_filter_cond",
  call = parent.frame()
)
```

## Arguments

- arg:

  Quosure - filtering condition.

  Default value

  :   none

- optional:

  Logical - is the argument optional?

  Default value

  :   `FALSE`

- arg_name:

  By default the expression specified for `arg` is used. If it is of the
  form `enexpr(<argument name>)`, the
  [`enexpr()`](https://rlang.r-lib.org/reference/defusing-advanced.html)
  part is removed. For example if `arg = enexpr(filter_add)` is
  specified, `arg_name` defaults to `"filter_add"`

  Default value

  :   `gsub("^enexpr\((.*)\)$", "\1", rlang::caller_arg(arg))`

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

Performs necessary checks and returns `arg` if all pass. Otherwise
throws an informative error.

## Details

Check if `arg` is a suitable filtering condition to be used in functions
like `subset` or
[`dplyr::filter`](https://dplyr.tidyverse.org/reference/filter.html).

## See also

Checks for valid input and returns warning or errors messages:
[`assert_atomic_vector()`](https://pharmaverse.github.io/admiraldev/reference/assert_atomic_vector.md),
[`assert_character_scalar()`](https://pharmaverse.github.io/admiraldev/reference/assert_character_scalar.md),
[`assert_character_vector()`](https://pharmaverse.github.io/admiraldev/reference/assert_character_vector.md),
[`assert_data_frame()`](https://pharmaverse.github.io/admiraldev/reference/assert_data_frame.md),
[`assert_date_vector()`](https://pharmaverse.github.io/admiraldev/reference/assert_date_vector.md),
[`assert_expr()`](https://pharmaverse.github.io/admiraldev/reference/assert_expr.md),
[`assert_expr_list()`](https://pharmaverse.github.io/admiraldev/reference/assert_expr_list.md),
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
library(dplyr, warn.conflicts = FALSE)
library(rlang)
dm <- dplyr::tribble(
  ~DOMAIN,  ~STUDYID,      ~USUBJID, ~AGE,
  "DM",    "STUDY X", "01-701-1015",   64,
  "DM",    "STUDY X", "01-701-1016",   65,
)

# typical usage in a function as an argument check
example_fun <- function(dat, x) {
  x <- assert_filter_cond(enexpr(x), arg_name = "x")
  filter(dat, !!x)
}

example_fun(dm, AGE == 64)
#> # A tibble: 1 × 4
#>   DOMAIN STUDYID USUBJID       AGE
#>   <chr>  <chr>   <chr>       <dbl>
#> 1 DM     STUDY X 01-701-1015    64

try(assert_filter_cond(mtcars))
#> Error in eval(expr, envir) : 
#>   Argument `mtcars` must be a filter condition, but is a data frame
```
