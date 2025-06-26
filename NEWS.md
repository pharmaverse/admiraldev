# admiraldev 1.3.1

- Replace unicode characters in .Rd files (#499)

# admiraldev 1.3.0

## New Features

- The `rdx_roclet()` extends the standard `{roxygen2}` roclet by the `@permitted`
and `@default` tags to specify the permitted and default values and the
`@caption`, `@info`, and `@code` tags for examples with a caption and a
description. (#484)

- `replace_symbol_in_expr()` and `add_suffix_to_vars()` no longer fail if the
expression contains `NA`. (#490)

## Updates of Existing Functions

## Breaking Changes

- The following function arguments are entering the next phase of the [deprecation process](https://pharmaverse.github.io/admiraldev/articles/programming_strategy.html#deprecation): (#2487) (#2595)

    **Phase 1 (message)**
  
    **Phase 2 (warning)**
    
    **Phase 3 (error)**
    
    **Phase 4 (removed)**

## Documentation

## Various

# admiraldev 1.2.0

## New Features

- New Function `deprecate_inform()` is a wrapper around 
  `lifecycle::deprecate_soft()` to allow for more control over messaging. (#466)

## Updates of Existing Functions

- Objects passed to `assert_list_element()` via the `...` argument can now be
used in the glue expression specified for the `message_text` argument. (#469)

- The `required_unit` argument of `assert_unit()` has been enhanced. It is now
possible to specify more than one unit or not specify it at all. In the latter
case only the uniqueness of the unit is checked. (#468)

- The `assert_numeric_vector()` function gained an optional `length` argument to
check whether the vector has a specific length. (#473)

## Breaking Changes

  - `{admiraldev}` is only compatible with R version >=4.1 (#456)
  
  - The following function arguments are entering the next phase of the [deprecation process](https://pharmaverse.github.io/admiraldev/articles/programming_strategy.html#deprecation): (#459)

      **Phase 1 (message)**
      
      No functions or arguments in this Phase

      **Phase 2 (warning)**
      
      No functions or arguments in this Phase

      **Phase 3 (error)**
      
      No functions or arguments in this Phase

      **Phase 4 (removed)**
      - The argument `quosures` was removed in the functions `vars2chr(quosures)`, `replace_values_by_names(quosures)`, and `get_source_vars(quosures)`
      - Removed at v1.0.0 `assert_named_expr()`
      - Removed at v1.0.0 `assert_has_variables()`
      - Removed at v1.0.0 `assert_function_param()`

## Documentation
  - Deprecation Strategy updated for the long haul! (#466)

## Other
  - `devcontainer` files removed (#480)

# admiraldev 1.1.0

## Updates of Existing Functions

* Updated `arg_name` parameter in `assert_filter_cond`, `assert_symbol`, and `assert_expr` with  `gsub("^enexpr\\((\\w+)\\)$", "\\1", rlang::caller_arg(arg))` argument so that  error messages return a quoted argument without `enexpr()`, e.g. `filter_add` instead of `enexpr(filter_add)`. (#2404)

* Error messaging throughout the package have been updated from `rlang::abort()` to `cli::cli_abort()`. As a part of the update, each of the `assert_*()` functions have new arguments `assert_*(message, arg_name, call, class).` (#367)

* Warning messaging has also been updated to use `{cli}` messaging.

## Breaking Changes

* `renv` and related files have been removed. (#360)

* No longer exporting `is_named()` function. (#401)

* `pharmaversesdtm` removed as a dependency. (#434)

* As a part of the error messaging update, the following changes were made.

    - The `assert_s3_class(class)` argument has been renamed to `assert_s3_class(cls)`. (#367)

    - Functions `arg_name()`, `enumerate()`, `what_is_it()`, and `friendly_type_of()` have been deprecated and a warning is returned to any developer using these functions. As these are developer functions (as opposed to functions for typical admiral users), we will use a short deprecation cycle.

## Documentation

- The "Release Strategy" vignette was updated with respect to the new branching
strategy. (#353)

- The "Release Strategy" vignette now contains a short new "Release Tracking" section linking to an external dashboard for CRAN packages that are awaiting release. (#358)

## Other

- Removed dependencies not needed to build package or package documentation. (#426)

- Increased minimum R version required to 4.0 to match {admiral}. (#382)

- `addin_format_testthat` addin has been moved to `{pharmaverse4devs}` package. (#419)


# admiraldev 1.0.0

## New Features

## Updates of Existing Functions

- `assert_function()` now accepts all function arguments if ellipsis, `...` is in the function formals (#339)

## Breaking Changes

- The following functions have been deprecated from previous admiral versions using the next phase of the deprecation process
  - `assert_function_param()`
  - `assert_named_expr()`
  - `assert_has_variables()`

## Documentation

- New documentation in programming strategy around quoting/expressions and standardizing roxygen texts (#233, #332)
- New documentation on how to use footnotes when writing vignettes (#324)
- Updated language and images to adopt GitHub Flow Strategy (#349)

## Various

# admiraldev 0.5.0

## New Features

- Calls for `admiral.test` have been swapped with `pharmaversesdtm` (#321)
- New vignette for package writing extensions is now available (#295, #312)
- New vignette for creating test data is now available (#282)

## Updates of Existing Functions

- The messaging for `warn_if_invalid_dtc()` was updated to align with what the date/datetime functions in `admiral` currently do. (#316)

## Breaking Changes

- The following functions/arguments have been deprecated from previous admiral versions using the next phase of the deprecation process: (#288)
  - `assert_order_vars()`
  - `quo_c()`
  - `quo_not_missing()`
  - `replace_symbol_in_quo()`
  - The `quosures` argument was replaced by the `expressions` argument in `replace_values_by_names()`, `get_source_vars()`, and `vars2chr()`. (#288)
- `assert_function_param()` was deprecated in favor of `assert_function()`. (#264)
- `assert_named_expr()` was deprecated in favor of `assert_expr_list()`. (#264)
- `assert_has_variables()` was deprecated in favor of `assert_data_frame()`. (#264)

## Documentation

- Guidance around issues and merging updated (#286)
- Common R CMD troubleshooting made into separate vignette (#286)
- Documentation of `get_dataset()` was improved. (#271)
- Minor updates to programming strategy were added (#213, #240, #260)
- Updated unit testing vignette with snapshot testing guidance. (#302)
- Documentation of `friendly_type_of()` was provided (#22)
- Minor updates to pull request review guidance were added (#201, #292)
- Documentation of singular versus plural function argument names was added into the programming strategy vignette. Also documentation on the common arguments `missing_value` and `missing_values` was added. (#296)
- Documentation highlighting the difference between `set_values_to` and `keep_source_vars` (#318)
- List of common arguments was updated (#306)

## Various

# admiraldev 0.4.0

## New Features

- New function `assert_named()` to check if all elements of an argument are
named (#241)
- New function `assert_expr_list()` to check if an argument is a list of
expressions (#241)

- Added a **Report a bug** link on `admiraldev` website (#257)

## Updates of Existing Functions

## Breaking Changes

- `assert_order_vars()` was deprecated in favor of `assert_expr_list()`. (#241)
- The following functions have been deprecated from previous admiral versions using the next phase of the deprecation process: (#272)

  - `quo_c()`
  - `quo_not_missing()`
  - `replace_symbol_in_quo()`
- The `quosures` argument was replaced by the `expressions` argument in `replace_values_by_names()`.

## Documentation

- The deprecation strategy was updated regarding unit tests for deprecated
functions/arguments in phase 1. (#247)

- The programming strategy was updated regarding permitted values and calling functions from package dependencies (#72, #253)

# admiraldev 0.3.0

## New Features
  - New function `process_set_values_to()` for creating the variables specified
  by the `set_value_to` argument and catching errors (#70)
  
## Updates of Existing Functions
  - Using testthat3e (testthat 3rd edition) for unit testing. This is stricter 
  in that messages must be addressed and deprecated functions throw errors. 
  (#230)
  - Slight boost to test coverage for `dev_utilities` (#102)
  - Fix datatable styling for documentation (#197)
  - The `assert_character_vector()` function gained a `named` argument to check
  that all elements of the vector are named. (#70)
  - The `assert_list_of()` function gained a `named` argument to check that all
  elements of the list are named. (#203)
  - The `quote_fun` argument of `enumerate()` was extended such that `NULL` can
  be specified to request no quoting of the elements. (#203)
  - The `assert_list_of()` function was enhanced such that it also considers the
  type of the element, e.g., to check if a value is a list of symbols. (#208)

## Breaking Changes
- The default value of the `optional` argument in `assert_date_vector()`,
`assert_list_of()`, and `assert_s3_class()` was changed from `TRUE` to `FALSE`
to make the default behavior consistent. (#87)
- admiral functions no longer expect list of quosures created by `vars()` but
list of expressions created by `exprs()`. Thus the following functions and
arguments were deprecated:
    - `quo_c()` and `replace_symbol_in_quo()`
    - the `quosures` argument in `get_source_vars()`,
    `replace_values_by_names()`, and `vars2chr()`

## Documentation
  - New section in programming strategy regarding comments (#71)
  - Removed requirement to add `@author` tags to code scripts from programming 
  strategy, as we will only be tracking authors in the DESCRIPTION file. Authors
  have been removed from function documentation in line with this update. 
  (#206, #210)
  - Removed On-boarding Issue Template (#225)
  - Increased clarity for the scope of the package (#232)

# admiraldev 0.2.0

## New Features
  - Developer addin for formatting tests to admiral programming standards (#73)
  - New functions `replace_symbol_in_quo()` and `add_suffix_to_vars()` (#106)
  - New function `assert_atomic_vector()` (#98)
  - New keyword/family `create_aux` for functions creating auxiliary datasets (#126)
  - New function `assert_date_vector()` (#129)
  - New function `assert_same_type()` (#176)
  - Remove dependency on `{assertthat}` (#149)
  - Test coverage for `admiraldev` have increased from 45% to approximately 100% (#94, #95, #96, #98, #101, #103)
  - _Environment_ objects were consolidated into a single `admiraldev_environment` object under `R/admiraldev_environment.R`. (#179)

## Updates of Existing Functions
  - `expect_names` argument added to `assert_vars()` to check if all variables are named (#117)
  - Remove `dplyr` function exports and migration of user facing function `negate_vars()` to admiral  (#83)
  
## Breaking Changes
  - No longer compatible with admiral (<0.9)
  
## Documentation
  - New vignette for our package release strategy (#79) 
  - Updated multiple roxygen headers (#116, #133, #134, #141, #145, #172)
  - Description on how admiral options work for certain function inputs, i.e `subject_keys` (#133)

## Various
  - PR Checklist Template updated (#172)
  - New authors/contributors (#158)

# admiraldev 0.1.0

## New Features

  - Developer specific functions brought over from `{admiral}`
  - Developer specific vignettes brought over from `{admiral}`
  - New `{admiraldev}` website created

## Updates of Existing Functions
  - NA
  
## Breaking Changes
  - NA

## Documentation
  - NA

## Various
  - NA

