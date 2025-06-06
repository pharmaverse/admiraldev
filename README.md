<!-- Please do not edit the README.md file as it is auto-generated. Only edit the README.Rmd file -->

# admiraldev <img src="man/figures/logo.png" align="right" alt="" width="120" />

Utility Functions and Development Tools for the Admiral Package Family

<!-- start badges -->

[![CRAN
status](https://www.r-pkg.org/badges/version/admiraldev)](https://CRAN.R-project.org/package=admiraldev)
[![Test
Coverage](https://raw.githubusercontent.com/pharmaverse/admiraldev/badges/main/test-coverage.svg)](https://github.com/pharmaverse/admiraldev/actions/workflows/common.yml)

<!-- end badges -->

## Purpose

Functions, tools and documentation for developing core `{admiral}` and extension
package functions. Most functions in `{admiraldev}` are around testing inputs
going into functions. There are also additional quality of life functions to
assist developers of `{admiral}` or `{admiral}` extension packages, functions to
help with rendering documentation, a custom roclet for a better structured
documentation, and Developer Guides on developing function and using GitHub,
GitHub Actions.

**NOTE:** This package is not intended for standalone use but rather as
a central dependency for `{admiral}` and its extension packages

## Installation

The package is available from CRAN and can be installed by running
`install.packages("admiraldev")`.

To install the latest development version of the package directly from
GitHub use the following code:

    if (!requireNamespace("remotes", quietly = TRUE)) {
      install.packages("remotes")
    }

    remotes::install_github("pharmaverse/admiraldev")

## Release Schedule

`{admiraldev}` is to be released to CRAN at the same time as an official
release of `{admiral}`. You can find the release schedule for
`{admiral}` packages
[here](https://pharmaverse.github.io/admiral/#release-schedule).

## Acknowledgments

Along with the authors and contributors, thanks to the following people for their work on the package: Ania Golab, Samia Kabi, Pooja Kumari, Syed Mubasheer, Thomas Neitmann, Ondrej Slama, Kangjie Zhang and Zelos Zhu. 
