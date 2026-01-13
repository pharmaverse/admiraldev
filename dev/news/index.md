# Changelog

## admiraldev (development version)

### New Features

- Added custom [admiral](https://pharmaverse.github.io/admiral/) linter
  configuration function `admiral_linters()` under
  `inst/lintr/linters.R` to enable consistent lint programming standards
  across the [admiral](https://pharmaverse.github.io/admiral/) family of
  packages. New configurations include, for instance, enforcing the use
  of
  [`cli::cli_abort()`](https://cli.r-lib.org/reference/cli_abort.html)
  over [`stop()`](https://rdrr.io/r/base/stop.html) and enforcing the
  use of
  [`cli::cli_warn()`](https://cli.r-lib.org/reference/cli_abort.html)
  over [`warning()`](https://rdrr.io/r/base/warning.html).
  ([\#506](https://github.com/pharmaverse/admiraldev/issues/506))

### Updates of Existing Functions

- The
  [`rdx_roclet()`](https://pharmaverse.github.io/admiraldev/dev/reference/rdx_roclet.md)
  was updated such that it no longer fails if the documentation contains
  an R6 class.
  ([\#512](https://github.com/pharmaverse/admiraldev/issues/512))

- [`assert_data_frame()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_data_frame.md)
  was enhanced with the addition of a new argument `check_is_rowwise`
  which checks whether the input dataset is rowwise. This is set as
  `TRUE` by default, so may constitute a breaking change if rowwise
  datasets were being passed to
  [`assert_data_frame()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_data_frame.md).
  ([\#475](https://github.com/pharmaverse/admiraldev/issues/475))

### Breaking Changes

- Removed custom join functions
  ([`anti_join()`](https://dplyr.tidyverse.org/reference/filter-joins.html),
  [`inner_join()`](https://dplyr.tidyverse.org/reference/mutate-joins.html),
  [`left_join()`](https://dplyr.tidyverse.org/reference/mutate-joins.html))
  from [admiraldev](https://pharmaverse.github.io/admiraldev/). These
  functions were originally created to suppress warnings about different
  attributes on LHS and RHS of joins. With
  [dplyr](https://dplyr.tidyverse.org) \>= 1.1.1, this warning is no
  longer issued, making these wrapper functions redundant. Users should
  now use the standard [dplyr](https://dplyr.tidyverse.org) join
  functions directly. The minimum required version of
  [dplyr](https://dplyr.tidyverse.org) has been updated from 1.0.5 to
  1.1.1. ([\#530](https://github.com/pharmaverse/admiraldev/issues/530))

- The following function arguments are entering the next phase of the
  [deprecation
  process](https://pharmaverse.github.io/admiraldev/articles/programming_strategy.html#deprecation):
  ([\#2487](https://github.com/pharmaverse/admiraldev/issues/2487))
  ([\#2595](https://github.com/pharmaverse/admiraldev/issues/2595))

  **Phase 1 (message)**

  - `%or%` - Please get in touch if you are using this function!
  - [`valid_time_units()`](https://pharmaverse.github.io/admiraldev/dev/reference/valid_time_units.md) -
    Please get in touch if you are using this function!

  **Phase 2 (warning)**

  No functions or arguments in this Phase

  **Phase 3 (error)**

  - [`arg_name()`](https://pharmaverse.github.io/admiraldev/dev/reference/arg_name.md) -
    Use
    [`rlang::caller_arg()`](https://rlang.r-lib.org/reference/caller_arg.html)
    instead
  - [`enumerate()`](https://pharmaverse.github.io/admiraldev/dev/reference/enumerate.md) -
    Use `cli` functionality instead, e.g.,
    `cli::cli_abort('{.val {letters[1:3]}}')`
  - [`what_is_it()`](https://pharmaverse.github.io/admiraldev/dev/reference/what_is_it.md) -
    Use `cli` functionality instead, e.g.,
    `cli::cli_abort('{.obj_type_friendly {letters}}')`
  - [`friendly_type_of()`](https://pharmaverse.github.io/admiraldev/dev/reference/friendly_type_of.md) -
    Use `cli` functionality instead, e.g.,
    `cli::cli_abort('{.obj_type_friendly {letters}}')`

  **Phase 4 (removed)**

  No functions or arguments in this Phase

### Documentation

- Added the “Ask AI” widget to the the bottom right of each page. It
  enables users to ask questions about
  [admiraldev](https://pharmaverse.github.io/admiraldev/) and the rest
  of the [admiral](https://pharmaverse.github.io/admiral/) ecosystem and
  receive answers from an LLM. It is trained on the documentation of all
  [admiral](https://pharmaverse.github.io/admiral/) packages and
  provided by [kapa.ai](https://docs.kapa.ai/kapa-for-open-source).
  ([\#120](https://github.com/pharmaverse/admiraldev/issues/120))

- Added a new “Writing Custom Examples” vignette containing directives
  on how to build the “Examples” sections for functions which use the
  custom
  [`rdx_roclet()`](https://pharmaverse.github.io/admiraldev/dev/reference/rdx_roclet.md).
  ([\#503](https://github.com/pharmaverse/admiraldev/issues/503))

- The “Release Strategy” vignette was updated to remove inconsistencies
  in the “Hot Fix Release section”, and to improve its formatting.
  ([\#365](https://github.com/pharmaverse/admiraldev/issues/365))

- Added a note to the “Writing Vignettes” vignette to encourage users to
  include the full title of all linked resources to ensure that
  resources can be found if links become defunct or broken.
  ([\#463](https://github.com/pharmaverse/admiraldev/issues/463))

- Removed use of CODEOWNERS and discussion in Pull Request Guidance
  ([\#486](https://github.com/pharmaverse/admiraldev/issues/486))

### Various

- Added various unit tests to improve the test coverage of
  [admiraldev](https://pharmaverse.github.io/admiraldev/).
  ([\#524](https://github.com/pharmaverse/admiraldev/issues/524))

## admiraldev 1.3.1

CRAN release: 2025-06-25

- Replace unicode characters in .Rd files.
  ([\#499](https://github.com/pharmaverse/admiraldev/issues/499))

## admiraldev 1.3.0

CRAN release: 2025-06-24

### New Features

- The
  [`rdx_roclet()`](https://pharmaverse.github.io/admiraldev/dev/reference/rdx_roclet.md)
  extends the standard [roxygen2](https://roxygen2.r-lib.org/) roclet by
  the `@permitted` and `@default` tags to specify the permitted and
  default values and the `@caption`, `@info`, and `@code` tags for
  examples with a caption and a description.
  ([\#484](https://github.com/pharmaverse/admiraldev/issues/484))

- [`replace_symbol_in_expr()`](https://pharmaverse.github.io/admiraldev/dev/reference/replace_symbol_in_expr.md)
  and
  [`add_suffix_to_vars()`](https://pharmaverse.github.io/admiraldev/dev/reference/add_suffix_to_vars.md)
  no longer fail if the expression contains `NA`.
  ([\#490](https://github.com/pharmaverse/admiraldev/issues/490))

### Updates of Existing Functions

### Breaking Changes

- The following function arguments are entering the next phase of the
  [deprecation
  process](https://pharmaverse.github.io/admiraldev/articles/programming_strategy.html#deprecation):
  ([\#2487](https://github.com/pharmaverse/admiraldev/issues/2487))
  ([\#2595](https://github.com/pharmaverse/admiraldev/issues/2595))

  **Phase 1 (message)**

  **Phase 2 (warning)**

  **Phase 3 (error)**

  **Phase 4 (removed)**

### Documentation

### Various

## admiraldev 1.2.0

CRAN release: 2025-01-15

### New Features

- New Function
  [`deprecate_inform()`](https://pharmaverse.github.io/admiraldev/dev/reference/deprecate_inform.md)
  is a wrapper around
  [`lifecycle::deprecate_soft()`](https://lifecycle.r-lib.org/reference/deprecate_soft.html)
  to allow for more control over messaging.
  ([\#466](https://github.com/pharmaverse/admiraldev/issues/466))

### Updates of Existing Functions

- Objects passed to
  [`assert_list_element()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_list_element.md)
  via the `...` argument can now be used in the glue expression
  specified for the `message_text` argument.
  ([\#469](https://github.com/pharmaverse/admiraldev/issues/469))

- The `required_unit` argument of
  [`assert_unit()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_unit.md)
  has been enhanced. It is now possible to specify more than one unit or
  not specify it at all. In the latter case only the uniqueness of the
  unit is checked.
  ([\#468](https://github.com/pharmaverse/admiraldev/issues/468))

- The
  [`assert_numeric_vector()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_numeric_vector.md)
  function gained an optional `length` argument to check whether the
  vector has a specific length.
  ([\#473](https://github.com/pharmaverse/admiraldev/issues/473))

### Breaking Changes

- [admiraldev](https://pharmaverse.github.io/admiraldev/) is only
  compatible with R version \>=4.1
  ([\#456](https://github.com/pharmaverse/admiraldev/issues/456))

- The following function arguments are entering the next phase of the
  [deprecation
  process](https://pharmaverse.github.io/admiraldev/articles/programming_strategy.html#deprecation):
  ([\#459](https://github.com/pharmaverse/admiraldev/issues/459))

  **Phase 1 (message)**

  No functions or arguments in this Phase

  **Phase 2 (warning)**

  No functions or arguments in this Phase

  **Phase 3 (error)**

  No functions or arguments in this Phase

  **Phase 4 (removed)**

  - The argument `quosures` was removed in the functions
    `vars2chr(quosures)`, `replace_values_by_names(quosures)`, and
    `get_source_vars(quosures)`
  - Removed at v1.0.0 `assert_named_expr()`
  - Removed at v1.0.0 `assert_has_variables()`
  - Removed at v1.0.0 `assert_function_param()`

### Documentation

- Deprecation Strategy updated for the long haul!
  ([\#466](https://github.com/pharmaverse/admiraldev/issues/466))

### Other

- `devcontainer` files removed
  ([\#480](https://github.com/pharmaverse/admiraldev/issues/480))

## admiraldev 1.1.0

CRAN release: 2024-06-06

### Updates of Existing Functions

- Updated `arg_name` parameter in `assert_filter_cond`, `assert_symbol`,
  and `assert_expr` with
  `gsub("^enexpr\\((\\w+)\\)$", "\\1", rlang::caller_arg(arg))` argument
  so that error messages return a quoted argument without
  [`enexpr()`](https://rlang.r-lib.org/reference/defusing-advanced.html),
  e.g. `filter_add` instead of `enexpr(filter_add)`.
  ([\#2404](https://github.com/pharmaverse/admiraldev/issues/2404))

- Error messaging throughout the package have been updated from
  [`rlang::abort()`](https://rlang.r-lib.org/reference/abort.html) to
  [`cli::cli_abort()`](https://cli.r-lib.org/reference/cli_abort.html).
  As a part of the update, each of the `assert_*()` functions have new
  arguments `assert_*(message, arg_name, call, class).`
  ([\#367](https://github.com/pharmaverse/admiraldev/issues/367))

- Warning messaging has also been updated to use
  [cli](https://cli.r-lib.org) messaging.

### Breaking Changes

- `renv` and related files have been removed.
  ([\#360](https://github.com/pharmaverse/admiraldev/issues/360))

- No longer exporting
  [`is_named()`](https://rlang.r-lib.org/reference/is_named.html)
  function.
  ([\#401](https://github.com/pharmaverse/admiraldev/issues/401))

- `pharmaversesdtm` removed as a dependency.
  ([\#434](https://github.com/pharmaverse/admiraldev/issues/434))

- As a part of the error messaging update, the following changes were
  made.

  - The `assert_s3_class(class)` argument has been renamed to
    `assert_s3_class(cls)`.
    ([\#367](https://github.com/pharmaverse/admiraldev/issues/367))

  - Functions
    [`arg_name()`](https://pharmaverse.github.io/admiraldev/dev/reference/arg_name.md),
    [`enumerate()`](https://pharmaverse.github.io/admiraldev/dev/reference/enumerate.md),
    [`what_is_it()`](https://pharmaverse.github.io/admiraldev/dev/reference/what_is_it.md),
    and
    [`friendly_type_of()`](https://pharmaverse.github.io/admiraldev/dev/reference/friendly_type_of.md)
    have been deprecated and a warning is returned to any developer
    using these functions. As these are developer functions (as opposed
    to functions for typical admiral users), we will use a short
    deprecation cycle.

### Documentation

- The “Release Strategy” vignette was updated with respect to the new
  branching strategy.
  ([\#353](https://github.com/pharmaverse/admiraldev/issues/353))

- The “Release Strategy” vignette now contains a short new “Release
  Tracking” section linking to an external dashboard for CRAN packages
  that are awaiting release.
  ([\#358](https://github.com/pharmaverse/admiraldev/issues/358))

### Other

- Removed dependencies not needed to build package or package
  documentation.
  ([\#426](https://github.com/pharmaverse/admiraldev/issues/426))

- Increased minimum R version required to 4.0 to match {admiral}.
  ([\#382](https://github.com/pharmaverse/admiraldev/issues/382))

- `addin_format_testthat` addin has been moved to `{pharmaverse4devs}`
  package.
  ([\#419](https://github.com/pharmaverse/admiraldev/issues/419))

## admiraldev 1.0.0

CRAN release: 2023-12-15

### New Features

### Updates of Existing Functions

- [`assert_function()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_function.md)
  now accepts all function arguments if ellipsis, `...` is in the
  function formals
  ([\#339](https://github.com/pharmaverse/admiraldev/issues/339))

### Breaking Changes

- The following functions have been deprecated from previous admiral
  versions using the next phase of the deprecation process
  - `assert_function_param()`
  - `assert_named_expr()`
  - `assert_has_variables()`

### Documentation

- New documentation in programming strategy around quoting/expressions
  and standardizing roxygen texts
  ([\#233](https://github.com/pharmaverse/admiraldev/issues/233),
  [\#332](https://github.com/pharmaverse/admiraldev/issues/332))
- New documentation on how to use footnotes when writing vignettes
  ([\#324](https://github.com/pharmaverse/admiraldev/issues/324))
- Updated language and images to adopt GitHub Flow Strategy
  ([\#349](https://github.com/pharmaverse/admiraldev/issues/349))

### Various

## admiraldev 0.5.0

CRAN release: 2023-09-11

### New Features

- Calls for `admiral.test` have been swapped with `pharmaversesdtm`
  ([\#321](https://github.com/pharmaverse/admiraldev/issues/321))
- New vignette for package writing extensions is now available
  ([\#295](https://github.com/pharmaverse/admiraldev/issues/295),
  [\#312](https://github.com/pharmaverse/admiraldev/issues/312))
- New vignette for creating test data is now available
  ([\#282](https://github.com/pharmaverse/admiraldev/issues/282))

### Updates of Existing Functions

- The messaging for
  [`warn_if_invalid_dtc()`](https://pharmaverse.github.io/admiraldev/dev/reference/warn_if_invalid_dtc.md)
  was updated to align with what the date/datetime functions in
  `admiral` currently do.
  ([\#316](https://github.com/pharmaverse/admiraldev/issues/316))

### Breaking Changes

- The following functions/arguments have been deprecated from previous
  admiral versions using the next phase of the deprecation process:
  ([\#288](https://github.com/pharmaverse/admiraldev/issues/288))
  - `assert_order_vars()`
  - `quo_c()`
  - `quo_not_missing()`
  - `replace_symbol_in_quo()`
  - The `quosures` argument was replaced by the `expressions` argument
    in
    [`replace_values_by_names()`](https://pharmaverse.github.io/admiraldev/dev/reference/replace_values_by_names.md),
    [`get_source_vars()`](https://pharmaverse.github.io/admiraldev/dev/reference/get_source_vars.md),
    and
    [`vars2chr()`](https://pharmaverse.github.io/admiraldev/dev/reference/vars2chr.md).
    ([\#288](https://github.com/pharmaverse/admiraldev/issues/288))
- `assert_function_param()` was deprecated in favor of
  [`assert_function()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_function.md).
  ([\#264](https://github.com/pharmaverse/admiraldev/issues/264))
- `assert_named_expr()` was deprecated in favor of
  [`assert_expr_list()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_expr_list.md).
  ([\#264](https://github.com/pharmaverse/admiraldev/issues/264))
- `assert_has_variables()` was deprecated in favor of
  [`assert_data_frame()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_data_frame.md).
  ([\#264](https://github.com/pharmaverse/admiraldev/issues/264))

### Documentation

- Guidance around issues and merging updated
  ([\#286](https://github.com/pharmaverse/admiraldev/issues/286))
- Common R CMD troubleshooting made into separate vignette
  ([\#286](https://github.com/pharmaverse/admiraldev/issues/286))
- Documentation of
  [`get_dataset()`](https://pharmaverse.github.io/admiraldev/dev/reference/get_dataset.md)
  was improved.
  ([\#271](https://github.com/pharmaverse/admiraldev/issues/271))
- Minor updates to programming strategy were added
  ([\#213](https://github.com/pharmaverse/admiraldev/issues/213),
  [\#240](https://github.com/pharmaverse/admiraldev/issues/240),
  [\#260](https://github.com/pharmaverse/admiraldev/issues/260))
- Updated unit testing vignette with snapshot testing guidance.
  ([\#302](https://github.com/pharmaverse/admiraldev/issues/302))
- Documentation of
  [`friendly_type_of()`](https://pharmaverse.github.io/admiraldev/dev/reference/friendly_type_of.md)
  was provided
  ([\#22](https://github.com/pharmaverse/admiraldev/issues/22))
- Minor updates to pull request review guidance were added
  ([\#201](https://github.com/pharmaverse/admiraldev/issues/201),
  [\#292](https://github.com/pharmaverse/admiraldev/issues/292))
- Documentation of singular versus plural function argument names was
  added into the programming strategy vignette. Also documentation on
  the common arguments `missing_value` and `missing_values` was added.
  ([\#296](https://github.com/pharmaverse/admiraldev/issues/296))
- Documentation highlighting the difference between `set_values_to` and
  `keep_source_vars`
  ([\#318](https://github.com/pharmaverse/admiraldev/issues/318))
- List of common arguments was updated
  ([\#306](https://github.com/pharmaverse/admiraldev/issues/306))

### Various

## admiraldev 0.4.0

CRAN release: 2023-06-06

### New Features

- New function
  [`assert_named()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_named.md)
  to check if all elements of an argument are named
  ([\#241](https://github.com/pharmaverse/admiraldev/issues/241))

- New function
  [`assert_expr_list()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_expr_list.md)
  to check if an argument is a list of expressions
  ([\#241](https://github.com/pharmaverse/admiraldev/issues/241))

- Added a **Report a bug** link on `admiraldev` website
  ([\#257](https://github.com/pharmaverse/admiraldev/issues/257))

### Updates of Existing Functions

### Breaking Changes

- `assert_order_vars()` was deprecated in favor of
  [`assert_expr_list()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_expr_list.md).
  ([\#241](https://github.com/pharmaverse/admiraldev/issues/241))

- The following functions have been deprecated from previous admiral
  versions using the next phase of the deprecation process:
  ([\#272](https://github.com/pharmaverse/admiraldev/issues/272))

  - `quo_c()`
  - `quo_not_missing()`
  - `replace_symbol_in_quo()`

- The `quosures` argument was replaced by the `expressions` argument in
  [`replace_values_by_names()`](https://pharmaverse.github.io/admiraldev/dev/reference/replace_values_by_names.md).

### Documentation

- The deprecation strategy was updated regarding unit tests for
  deprecated functions/arguments in phase 1.
  ([\#247](https://github.com/pharmaverse/admiraldev/issues/247))

- The programming strategy was updated regarding permitted values and
  calling functions from package dependencies
  ([\#72](https://github.com/pharmaverse/admiraldev/issues/72),
  [\#253](https://github.com/pharmaverse/admiraldev/issues/253))

## admiraldev 0.3.0

CRAN release: 2023-03-06

### New Features

- New function
  [`process_set_values_to()`](https://pharmaverse.github.io/admiraldev/dev/reference/process_set_values_to.md)
  for creating the variables specified by the `set_value_to` argument
  and catching errors
  ([\#70](https://github.com/pharmaverse/admiraldev/issues/70))

### Updates of Existing Functions

- Using testthat3e (testthat 3rd edition) for unit testing. This is
  stricter in that messages must be addressed and deprecated functions
  throw errors.
  ([\#230](https://github.com/pharmaverse/admiraldev/issues/230))
- Slight boost to test coverage for `dev_utilities`
  ([\#102](https://github.com/pharmaverse/admiraldev/issues/102))
- Fix datatable styling for documentation
  ([\#197](https://github.com/pharmaverse/admiraldev/issues/197))
- The
  [`assert_character_vector()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_character_vector.md)
  function gained a `named` argument to check that all elements of the
  vector are named.
  ([\#70](https://github.com/pharmaverse/admiraldev/issues/70))
- The
  [`assert_list_of()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_list_of.md)
  function gained a `named` argument to check that all elements of the
  list are named.
  ([\#203](https://github.com/pharmaverse/admiraldev/issues/203))
- The `quote_fun` argument of
  [`enumerate()`](https://pharmaverse.github.io/admiraldev/dev/reference/enumerate.md)
  was extended such that `NULL` can be specified to request no quoting
  of the elements.
  ([\#203](https://github.com/pharmaverse/admiraldev/issues/203))
- The
  [`assert_list_of()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_list_of.md)
  function was enhanced such that it also considers the type of the
  element, e.g., to check if a value is a list of symbols.
  ([\#208](https://github.com/pharmaverse/admiraldev/issues/208))

### Breaking Changes

- The default value of the `optional` argument in
  [`assert_date_vector()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_date_vector.md),
  [`assert_list_of()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_list_of.md),
  and
  [`assert_s3_class()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_s3_class.md)
  was changed from `TRUE` to `FALSE` to make the default behavior
  consistent.
  ([\#87](https://github.com/pharmaverse/admiraldev/issues/87))
- admiral functions no longer expect list of quosures created by
  [`vars()`](https://dplyr.tidyverse.org/reference/vars.html) but list
  of expressions created by
  [`exprs()`](https://rlang.r-lib.org/reference/defusing-advanced.html).
  Thus the following functions and arguments were deprecated:
  - `quo_c()` and `replace_symbol_in_quo()`
  - the `quosures` argument in
    [`get_source_vars()`](https://pharmaverse.github.io/admiraldev/dev/reference/get_source_vars.md),
    [`replace_values_by_names()`](https://pharmaverse.github.io/admiraldev/dev/reference/replace_values_by_names.md),
    and
    [`vars2chr()`](https://pharmaverse.github.io/admiraldev/dev/reference/vars2chr.md)

### Documentation

- New section in programming strategy regarding comments
  ([\#71](https://github.com/pharmaverse/admiraldev/issues/71))
- Removed requirement to add `@author` tags to code scripts from
  programming strategy, as we will only be tracking authors in the
  DESCRIPTION file. Authors have been removed from function
  documentation in line with this update.
  ([\#206](https://github.com/pharmaverse/admiraldev/issues/206),
  [\#210](https://github.com/pharmaverse/admiraldev/issues/210))
- Removed On-boarding Issue Template
  ([\#225](https://github.com/pharmaverse/admiraldev/issues/225))
- Increased clarity for the scope of the package
  ([\#232](https://github.com/pharmaverse/admiraldev/issues/232))

## admiraldev 0.2.0

CRAN release: 2022-11-30

### New Features

- Developer addin for formatting tests to admiral programming standards
  ([\#73](https://github.com/pharmaverse/admiraldev/issues/73))
- New functions `replace_symbol_in_quo()` and
  [`add_suffix_to_vars()`](https://pharmaverse.github.io/admiraldev/dev/reference/add_suffix_to_vars.md)
  ([\#106](https://github.com/pharmaverse/admiraldev/issues/106))
- New function
  [`assert_atomic_vector()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_atomic_vector.md)
  ([\#98](https://github.com/pharmaverse/admiraldev/issues/98))
- New keyword/family `create_aux` for functions creating auxiliary
  datasets
  ([\#126](https://github.com/pharmaverse/admiraldev/issues/126))
- New function
  [`assert_date_vector()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_date_vector.md)
  ([\#129](https://github.com/pharmaverse/admiraldev/issues/129))
- New function
  [`assert_same_type()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_same_type.md)
  ([\#176](https://github.com/pharmaverse/admiraldev/issues/176))
- Remove dependency on `{assertthat}`
  ([\#149](https://github.com/pharmaverse/admiraldev/issues/149))
- Test coverage for `admiraldev` have increased from 45% to
  approximately 100%
  ([\#94](https://github.com/pharmaverse/admiraldev/issues/94),
  [\#95](https://github.com/pharmaverse/admiraldev/issues/95),
  [\#96](https://github.com/pharmaverse/admiraldev/issues/96),
  [\#98](https://github.com/pharmaverse/admiraldev/issues/98),
  [\#101](https://github.com/pharmaverse/admiraldev/issues/101),
  [\#103](https://github.com/pharmaverse/admiraldev/issues/103))
- *Environment* objects were consolidated into a single
  `admiraldev_environment` object under `R/admiraldev_environment.R`.
  ([\#179](https://github.com/pharmaverse/admiraldev/issues/179))

### Updates of Existing Functions

- `expect_names` argument added to
  [`assert_vars()`](https://pharmaverse.github.io/admiraldev/dev/reference/assert_vars.md)
  to check if all variables are named
  ([\#117](https://github.com/pharmaverse/admiraldev/issues/117))
- Remove `dplyr` function exports and migration of user facing function
  `negate_vars()` to admiral
  ([\#83](https://github.com/pharmaverse/admiraldev/issues/83))

### Breaking Changes

- No longer compatible with admiral (\<0.9)

### Documentation

- New vignette for our package release strategy
  ([\#79](https://github.com/pharmaverse/admiraldev/issues/79))
- Updated multiple roxygen headers
  ([\#116](https://github.com/pharmaverse/admiraldev/issues/116),
  [\#133](https://github.com/pharmaverse/admiraldev/issues/133),
  [\#134](https://github.com/pharmaverse/admiraldev/issues/134),
  [\#141](https://github.com/pharmaverse/admiraldev/issues/141),
  [\#145](https://github.com/pharmaverse/admiraldev/issues/145),
  [\#172](https://github.com/pharmaverse/admiraldev/issues/172))
- Description on how admiral options work for certain function inputs,
  i.e `subject_keys`
  ([\#133](https://github.com/pharmaverse/admiraldev/issues/133))

### Various

- PR Checklist Template updated
  ([\#172](https://github.com/pharmaverse/admiraldev/issues/172))
- New authors/contributors
  ([\#158](https://github.com/pharmaverse/admiraldev/issues/158))

## admiraldev 0.1.0

CRAN release: 2022-08-26

### New Features

- Developer specific functions brought over from
  [admiral](https://pharmaverse.github.io/admiral/)
- Developer specific vignettes brought over from
  [admiral](https://pharmaverse.github.io/admiral/)
- New [admiraldev](https://pharmaverse.github.io/admiraldev/) website
  created

### Updates of Existing Functions

- NA

### Breaking Changes

- NA

### Documentation

- NA

### Various

- NA
