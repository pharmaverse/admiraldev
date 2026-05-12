# Process `@permitted` and `@default` tags

This function processes the `@permitted` and `@default` tags and moves
them into the `@param` tag. The default value is taken from the function
call if not specified.

## Usage

``` r
transform_param(block, rdx_permitted_values)
```

## Arguments

- block:

  A block of roxygen tags of one function

  Default value

  :   none

- rdx_permitted_values:

  A list of permitted values

  The name of the list item can be referenced in the `@permitted` tag by
  specifying the name in square brackets, e.g., `@permitted [mode]`.

  Default value

  :   none

## Value

The block with the transformed tags
