# Capture Output and Messages

The function captures both output and expected messages from an R
expression. If the expression results in an unexpected message, an error
is issued.

## Usage

``` r
capture_output(expr, srcref = NULL, expected_cnds = NULL, env = caller_env())
```

## Arguments

- expr:

  An R expression to evaluate

  Permitted values

  :   An unquoted R expression

  Default value

  :   none

- srcref:

  The source reference of the expression

  Default value

  :   `NULL`

- expected_cnds:

  A character vector of expected conditions

  If the expression issues a condition of a class that is in this
  vector, the condition is ignored but added to the return value.

  Otherwise, an error is issued.

  Default value

  :   `NULL`

- env:

  The environment in which to evaluate the expression

  Default value

  :   [`caller_env()`](https://rlang.r-lib.org/reference/stack.html)

## Value

A character vector of captured output and messages

## Examples

### Capture Output and Messages

    capture_output(1 + 1)
    #> [1] "[1] 2"

    capture_output(log(-1))
    #> Error in capture_output(log(-1)) : The expression
    #> > log(-1)
    #> issued an unexpected condition:
    #> NaNs produced
    #> If this is expected, add any of the classes "simpleWarning", "warning", and
    #> "condition" to the argument `expected_cnds`.

    capture_output(log(-1), expected_cnds = "warning")
    #> [1] "[1] NaN"                            "Warning in log(-1) : NaNs produced"
