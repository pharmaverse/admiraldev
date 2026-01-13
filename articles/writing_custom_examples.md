# Writing Custom Examples

## Introduction

This vignette serves as a primer to help write detailed and consistent
Examples Sections in function documentation using the custom
[`rdx_roclet()`](https://pharmaverse.github.io/admiraldev/reference/rdx_roclet.md)
, which lives in the {admiraldev} package functionality - please see
[`demo_fun()`](https://pharmaverse.github.io/admiraldev/reference/demo_fun.md)
for a dummy example and [`derive_extreme_records.R` in
admiral](https://github.com/pharmaverse/admiral/blob/main/R/derive_extreme_records.R)
for an example of this in action. These examples are often beneficial
for the more complex {admiral} functions to help answer questions like:
“what does this function do?” or “how does this argument work?”.

In practice, the guidance shown below cannot always be applied to the
letter, because each function and its context are different and may have
varying requirements. As such, developers are encouraged to treat these
directives heuristically and always apply their judgment when
constructing Examples Sections.

## How to use the `@caption`, `@info` and `@code` tags together in a “block”

The Examples Section should consist of a series of example blocks,
usually made up of one call each to `@caption`, `@info` and `@code`. See
the example below:

``` r
#' @examplesx
#'
#' @caption Showcasing the first functionality of `fun()` (`arg1`)
#'
#' @info This is the detailed text for the first example.
#'
#' @code
#'
#' fun(arg1 = TRUE)
#'
#' @caption Showcasing the second functionality of `fun()` (`arg2`)
#'
#' @info This is the detailed text for the first example.
#'
#' @code
#'
#' fun(arg2 = FALSE)
```

Within each block:

- The `@caption` tag should be used to provide a brief description of
  the example. This is the text which will show up in the table of
  contents on the right hand side of the function documentation. If
  possible and/or relevant, the text should specify which argument(s)
  are being showcased in that example.
- The `@info` tag should be used to provide a more detailed description
  of the example. If relevant, it should contain some context behind the
  example (i.e.  **why** this may be a relevant scenario to consider).
- The `@code` tag should be used to provide the code for the example.
  The code should be as self-contained as possible. The dataset/object
  being created should be printed at the end of the section.

Note that a more complex block may also have multiple `@info` and`@code`
sections after the `@caption` if it is particularly involved.

![Here is what a block and table of contents look like (taken from
admiral::derive_vars_dt().](custom_roclet_example.png)

Here is what a block and table of contents look like (taken from
`admiral::derive_vars_dt()`.

## How to sequence your blocks

Successive example blocks should build in complexity. The first examples
should showcase the most “minimal” execution of the function, with only
the required arguments being triggered and the default values discussed.
The data in these examples should be as concise as possible and may not
be ADaM compliant, e.g., `STUDYID` may not be included or `AVISITN` may
be present without `AVISIT`.

Later blocks should then bring in one/a few more arguments at a time as
the use-case becomes more involved. If possible, they should build on
top of earlier blocks (i.e. use the same data but changing the scope of
the function call to add complexity), but if this is not possible, then
new scenarios can be considered.

As mentioned previously, all example blocks should answer questions like
“what does this function do?” or “how does this argument work?”.

## Data sections

If all examples can be run on the same/similar data, you may wish to
(optionally) include a “Data setup” block at the start of the Examples
Section to create the dummy dataset(s) that can then be used in each
block. Please see
[derive_summary_records()](https://pharmaverse.github.io/admiral/main/reference/derive_summary_records.html#examples)
as an example.
