# admiraldev

Utility Functions and Development Tools for the Admiral Package Family

*Explore all the other packages in the [{admiral}
ecosystem](https://pharmaverse.org/e2eclinical/adam/) to learn more
about ADaM programming in R.*

## Purpose

Functions, tools and documentation for developing core
[admiral](https://pharmaverse.github.io/admiral/) and extension package
functions. Most functions in
[admiraldev](https://pharmaverse.github.io/admiraldev/) are around
testing inputs going into functions. There are also additional quality
of life functions/Addins to assist developers of
[admiral](https://pharmaverse.github.io/admiral/) or
[admiral](https://pharmaverse.github.io/admiral/) extension packages,
functions to help with rendering documentation, Developer Guides on
developing function and using GitHub, GitHub Actions.

**NOTE:** This package is not intended for standalone use but rather as
a central dependency for
[admiral](https://pharmaverse.github.io/admiral/) and its extension
packages

## Installation

The package is available from CRAN and can be installed by running
`install.packages("admiraldev")`.

To install the latest development version of the package directly from
GitHub use the following code:

``` R
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}

remotes::install_github("pharmaverse/admiraldev")
```

## Release Schedule

[admiraldev](https://pharmaverse.github.io/admiraldev/) is to be
released to CRAN at the same time as an official release of
[admiral](https://pharmaverse.github.io/admiral/). You can find the
release schedule for [admiral](https://pharmaverse.github.io/admiral/)
packages
[here](https://pharmaverse.github.io/admiral/#release-schedule).
