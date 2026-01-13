# A Demo Function

This function is used to demonstrate the custom tags of the
[`rdx_roclet()`](https://pharmaverse.github.io/admiraldev/reference/rdx_roclet.md).

## Usage

``` r
demo_fun(x, number = 1, letter = "a")
```

## Arguments

- x:

  An argument

  Default value

  :   none

- number:

  A number

  Permitted values

  :   A number

  Default value

  :   `1`

- letter:

  A letter

  Permitted values

  :   a character scalar, i.e., a character vector of length one

  Default value

  :   The first letter of the alphabet

## Examples

This is the introduction.

### A simple example

This is a simple example showing the default behaviour.

    demo_fun(1)
    #> [1] 42

### An example with a different letter

This example shows that the `letter` argument doesn't affect the output.

    demo_fun(1, letter = "b")
    #> [1] 42
