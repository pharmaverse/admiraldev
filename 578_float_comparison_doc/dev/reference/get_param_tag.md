# Get the content of the `@param` tag

This function adds the permitted values and the default value to the
description of the `@param` tag. They are added as a definition list
(`\describe{}`).

## Usage

``` r
get_param_tag(act_param, defaults)
```

## Arguments

- act_param:

  The content of the argument description to format

  A list with three named elements is expected:

  - `tag`: The `@param` tag

  - `permitted`: The permitted values

  - `default`: The default value

  Default value

  :   none

- defaults:

  A list of default values from the function call

  Default value

  :   none

## Value

The formatted `@param` tag
