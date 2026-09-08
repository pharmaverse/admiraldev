# Parse Code

The function parses the code and returns a list of expressions and
source references.

## Usage

``` r
parse_code(code)
```

## Arguments

- code:

  The code to parse

  Permitted values

  :   A character vector

  Default value

  :   none

## Value

A list of expressions and source references

Each item of the list is a list with the following elements:

- `expr`: The expression

- `srcref`: The source reference

- `eval`: A logical indicating whether the expression should be
  evaluated, i.e., it is not a comment or an empty line.

## Examples

``` r
parse_code("1+1\n2*2")
#> [[1]]
#> [[1]]$expr
#> 1 + 1
#> 
#> [[1]]$srcref
#> [1] "1+1"
#> 
#> [[1]]$eval
#> [1] TRUE
#> 
#> 
#> [[2]]
#> [[2]]$expr
#> 2 * 2
#> 
#> [[2]]$srcref
#> [1] "2*2"
#> 
#> [[2]]$eval
#> [1] TRUE
#> 
#> 

parse_code(c("# sum:", "sum(\n  1, #first\n  2\n)"))
#> [[1]]
#> [[1]]$expr
#> NULL
#> 
#> [[1]]$srcref
#> [1] "# sum:"
#> 
#> [[1]]$eval
#> [1] FALSE
#> 
#> 
#> [[2]]
#> [[2]]$expr
#> sum(1, 2)
#> 
#> [[2]]$srcref
#> [1] "sum("        "  1, #first" "  2"         ")"          
#> 
#> [[2]]$eval
#> [1] TRUE
#> 
#> 
```
