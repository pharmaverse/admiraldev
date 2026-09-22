# Execute Example Code

This function executes the example code and captures the output and
messages. If the example code issues an unexpected message, an error is
issued.

## Usage

``` r
execute_example(code, expected_cnds = NULL, env = caller_env())
```

## Arguments

- code:

  The example code

  The code is expected to be a character vector of R code lines.

  Permitted values

  :   A character vector

  Default value

  :   none

- expected_cnds:

  Expected conditions

  Permitted values

  :   A character vector

  Default value

  :   `NULL`

- env:

  The environment in which to evaluate the example code

  Permitted values

  :   An environment

  Default value

  :   [`caller_env()`](https://rlang.r-lib.org/reference/stack.html)

## Value

A character vector of the input code and the output and messages created
by the code. Output and messages are prefixed by `"#>"`.

## Examples

### Execute Example Code

    suppressWarnings(admiraldev:::execute_example("1 + 1"))
    #> [1] "1 + 1\n#> [1] 2"

    suppressWarnings(admiraldev:::execute_example("log(-1)"))
    #> [1] "log(-1)\n#> [1] NaN"

    suppressWarnings(admiraldev:::execute_example("log(-1)", expected_cnds = "warning"))
    #> [1] "log(-1)\n#> [1] NaN"
