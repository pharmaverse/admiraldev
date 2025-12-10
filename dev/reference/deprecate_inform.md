# Deprecation with Soft Message

Wrapper around
[`lifecycle::deprecate_soft()`](https://lifecycle.r-lib.org/reference/deprecate_soft.html)
that messages users about deprecated features and functions instead of
warning.

## Usage

``` r
deprecate_inform(
  when,
  what,
  with = NULL,
  details = NULL,
  id = NULL,
  env = rlang::caller_env(),
  user_env = rlang::caller_env(2)
)
```

## Arguments

- when:

  A string giving the version when the behaviour was deprecated.

- what:

  A string describing what is deprecated:

  - Deprecate a whole function with `"foo()"`.

  - Deprecate an argument with `"foo(arg)"`.

  - Partially deprecate an argument with
    `"foo(arg = 'must be a scalar integer')"`.

  - Deprecate anything else with a custom message by wrapping it in
    [`I()`](https://rdrr.io/r/base/AsIs.html).

  You can optionally supply the namespace: `"ns::foo()"`, but this is
  usually not needed as it will be inferred from the caller environment.

- with:

  An optional string giving a recommended replacement for the deprecated
  behaviour. This takes the same form as `what`.

- details:

  In most cases the deprecation message can be automatically generated
  from `with`. When it can't, use `details` to provide a hand-written
  message.

  `details` can either be a single string or a character vector, which
  will be converted to a [bulleted
  list](https://cli.r-lib.org/reference/cli_bullets.html). By default,
  info bullets are used. Provide a named vectors to override.

- id:

  The id of the deprecation. A warning is issued only once for each
  `id`. Defaults to the generated message, but you should give a unique
  ID when the message in `details` is built programmatically and depends
  on inputs, or when you'd like to deprecate multiple functions but warn
  only once for all of them.

- env, user_env:

  Pair of environments that define where `deprecate_*()` was called
  (used to determine the package name) and where the function called the
  deprecating function was called (used to determine if
  `deprecate_soft()` should message).

  These are only needed if you're calling `deprecate_*()` from an
  internal helper, in which case you should forward `env = caller_env()`
  and `user_env = caller_env(2)`.

## Value

`NULL`, invisibly.

## Examples

``` r
# A Phase 1 deprecated function with custom bulleted list:
deprecate_inform(
  when = "1.0.0",
  what = "foo()",
  details = c(
    x = "This message will turn into a warning with release of x.y.z",
    i = "See admiral's deprecation guidance:
https://pharmaverse.github.io/admiraldev/dev/articles/programming_strategy.html#deprecation"
  )
)
```
