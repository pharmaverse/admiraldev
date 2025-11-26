# Get Started

## Dear Developers

[admiraldev](https://pharmaverse.github.io/admiraldev/) is a set of
tools intended for you, the developer, to help make developing within
the admiral family easier, consistently robust across all packages and
maybe even fun!

Tools are loosely defined as follows:

- Utility Functions used in
  [admiral](https://pharmaverse.github.io/admiral/) and
  [admiral](https://pharmaverse.github.io/admiral/) extension packages
  for doing custom checks and providing custom messages, warnings and
  errors. These custom messages, warnings and errors are succinct, but
  helpful messaging around what a function expects as inputs. The inputs
  to admiral functions are many, but generally fit into three
  categories: datasets, variables and arguments. Most of the functions
  start with `assert_`, `is_` or `get_`.

- A roclet extending the standard
  [roxygen2](https://roxygen2.r-lib.org/) roclet:

  - The `@permitted` tag is provided to document the permitted values
    for an argument.
  - The default value is added automatically to the argument
    description. It can be overwritten by specifying the `@default` tag.
  - The `@caption`, `@info`, and `@code` tags can be used to create a
    better structured example section. They allow to add a caption and
    TOC entry for each example and a description of the example.

  See
  [`rdx_roclet()`](https://pharmaverse.github.io/admiraldev/dev/reference/rdx_roclet.md),
  the example function
  [`demo_fun()`](https://pharmaverse.github.io/admiraldev/dev/reference/demo_fun.md),
  and Function Header Documentation in our Programming Strategy for more
  details.

- Utility functions that help with documentation, testing and checking
  on health of the code base in all admiral packages.

- Vignettes on working on
  [admiral](https://pharmaverse.github.io/admiral/) functions,
  developing unit testing, releases process, vignette writing and other
  documentation needs. These vignettes are intended for use across all
  admiral packages.

## Why have a separate development package?

As the [admiral](https://pharmaverse.github.io/admiral/) package
function base has grown it was decided to create extension packages for
use within companies and specific TAs to help with specific problems. We
intended these extension packages to follow the same processes as
[admiral](https://pharmaverse.github.io/admiral/) core, e.g. Unit
Testing, Roxygen Documentation, Function Design. A standalone
development package allows us to keep an up to date development process
for all developers across the family. We also feel that a lot of the
developer functions are not user-specific and gives us more freedom to
create and release utility tools specific to our family of packages and
reduces non-user facing functions within the admiral family of packages.

## How to add new tools to `{admiraldev}`?

- Just like in [admiral](https://pharmaverse.github.io/admiral/), we
  follow the same procedures of adding issues to discuss feature
  requests, bugs and documentation updates. We then develop those issues
  in branches and do a Pull Request with a Code Review.

- Experimental tools are highly encouraged to help reduce repetitive
  patterns and automating the boring stuff.

## When to add a function to `{admiraldev}`?

### **Scenario One: {admiral} core**

A developer working on [admiral](https://pharmaverse.github.io/admiral/)
core implements a new type of derivation function for a BDS-Findings
ADaM dataset. The new derivation function has two new `assert` custom
checking functions for inputs as well as a helper function.

Loose guidelines:

1.  The derivation function should always live in
    [admiral](https://pharmaverse.github.io/admiral/) core.
2.  The helper function should be looked at to see it should be made
    available within
    [admiraldev](https://pharmaverse.github.io/admiraldev/) for other
    extension packages needs and so reduce repetitive coding across the
    family of [admiral](https://pharmaverse.github.io/admiral/). If it
    cannot be generalized, then it should remain in
    [admiral](https://pharmaverse.github.io/admiral/).
3.  The `assert` custom checking functions should always live within
    [admiraldev](https://pharmaverse.github.io/admiraldev/) to stay with
    the family of `assertion` functions.

### **Scenario Two: {admiral} extension**

A developer working on
[admiralonco](https://pharmaverse.github.io/admiralonco/) implements a
new type of derivation function for adding certain parameters to an
oncology specific ADaM dataset. The new derivation function has one new
`assert` custom checking function.

Loose guidelines:

1.  The derivation function should be closely looked at to see if it can
    be generalized to other ADaM datasets. If that is the case, then it
    should be moved to [admiral](https://pharmaverse.github.io/admiral/)
    core. If the function is very specific to oncology needs, then it
    should remain in
    [admiralonco](https://pharmaverse.github.io/admiralonco/).
2.  The `assert` custom checking functions follow a similar principle -
    if they can be generalized to other therapeutic areas then move to
    [admiraldev](https://pharmaverse.github.io/admiraldev/), whereas if
    very specific to oncology needs, then they should remain in
    [admiralonco](https://pharmaverse.github.io/admiralonco/).
