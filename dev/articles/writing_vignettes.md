# Writing Vignettes

## Introduction

This guidance ensures consistency across the vignettes in the
[admiral](https://pharmaverse.github.io/admiral/) package in terms of
content, structure and code execution. As a general rule, the vignette
workflow defined in [r-pkgs.org](https://r-pkgs.org/vignettes.html) is
followed.

## Metadata

Each vignette in [admiral](https://pharmaverse.github.io/admiral/)
should start with the following metadata.

    ---
    title: "<Title>"
    output:  rmarkdown::html_vignette:
    vignette: >
      %\VignetteIndexEntry{<Title>}
      %\VignetteEngine{knitr::rmarkdown}
    ---

The `<Title>` of the vignette should be meaningful.

## Markdown

### Default Options

If any chunks are used within the vignette, the following options should
be set after the metadata to ensure that the chunks are rendered
consistently across all vignettes.

    ```{r setup, include=FALSE}
    knitr::opts_chunk$set(
      collapse = TRUE,
      comment = "#>"
    )
    ```

### Format Sections

#### Table of Contents

Headings must be title case and start from Heading 1:

    # Heading 1
    This is the description of my first section.

    ## Heading 1.1
    This is the description of my first sub-section within my first section.

    ## Heading 1.2
    This is the description of my second sub-section within my first section.

The first section gives a brief introduction of the vignette. The last
sub-section of the introduction should describe the packages required to
run the [admiral](https://pharmaverse.github.io/admiral/) functions. The
[admiral](https://pharmaverse.github.io/admiral/) package should be
described first.

    # Introduction

    This is the introduction of my vignette.

    ## Required Packages

    ```{r, warning=FALSE, message=FALSE}
    library(admiral)
    # <all packages used in the vignette>
    ```

The `warning=FALSE` and `message=FALSE` options are there to prevent the
usual messages:

Attaching package: ‘xxxx’The following objects are masked from
‘package:yyyyy’ fun1, fun2

#### Conventions

##### General Conventions

- Any new vignette must be added to the `_pkgdown.yml` file in the
  relevant section.

- Any variable name, dataset name, function, argument name must be
  quoted with backticks: e.g.

&nbsp;

      The `date` parameter of the `derive_my_var()` function expects a date variable, e.g., `ADT`.

- Functions must also end with `()`.

- Variables and datasets name are expected to be uppercase.

- All the codes must be described, executed and the output result
  displayed once the code is executed. Use:

      ```{r}
      #<code>
      ```

- Any output created must clearly show what the function has derived. It
  should at least show the variables/records used as input to the
  function and the derived variables/records. If a dataset must be
  displayed, it will be formatted using the
  [`dataset_vignette()`](https://pharmaverse.github.io/admiraldev/dev/reference/dataset_vignette.md)
  function so that it is displayed consistently across the
  vignettes.E.g.

  - Description and execution of the code used to derive the
    variable/record

``` r
vs1 <- vs %>%
  derive_vars_dt(
    new_vars_prefix = "A",
    dtc = VSDTC,
    date_imputation = "first"
  )
```

- Output dataset formatted using
  [`dataset_vignette()`](https://pharmaverse.github.io/admiraldev/dev/reference/dataset_vignette.md)…

Note: The call to get the formatted dataset would be:

      ``` r
      dataset_vignette(
        vs1,
        display_vars = exprs(USUBJID, VSTESTCD, VISIT, VSDTC, ADT),
        filter = VSTESTCD == "WEIGHT"
      )
      ```
      

Displaying many big datasets on a vignette, may require a long time to
load the page and may cause messages from the browser that the page is
not responsive. In this case the number of displayed observations should
be restricted either by restricting the source datasets at the beginning
of the vignette or in the call of
[`dataset_vignette()`](https://pharmaverse.github.io/admiraldev/dev/reference/dataset_vignette.md)
if only some calls are affected.

##### Using Footnotes

Footnotes can be useful to add context without adding clutter to the
primary subject matter of the vignette being written.

To use footnotes, add a caret and an identifier inside brackets
e.g. `([^1])`. The identifiers can be numbers or words, but they can’t
contain spaces or tabs.

The following markdown text will render as follows:

    Here is an example [^1]

    [^1]: Cool note about the example.

Here is an example [¹](#fn1)

##### Conventions for ADaM Workflow

For vignettes describing an ADaM workflow,

- the second section will summarize the programming workflow. The first
  sub-section within this workflow will always describe the data read to
  demonstrate the use of the
  [admiral](https://pharmaverse.github.io/admiral/) functions,

- Each sub-section within the programming workflow should be tagged
  (e.g. \[Step1\] (#step)), so that the user can go on the relevant
  section from the programming workflow (in addition to the Table of
  contents). Don’t use a tag with a number but use a meaningful name
  (e.g. do not use `(#link1)`, but use `(#this_action)`)

- the last section should link to a template script.

&nbsp;

    # Programming Workflow

    * [Read in Data](#readdata)
    * [Derive/Impute End and Start Analysis Date/time and Relative Day](#datetime)
    * ...
    * [Assign `ASEQ`](#aseq)

    ## Read in Data {#readdata}
    ## Derive/Impute End and Start Analysis Date/time and Relative Day {#datetime}
    ## ...
    ## Assign `ASEQ` {#aseq}

    # Another Section

    # Example Script
    ADaM | Sample Code
    ---- | --------------
    ADxx | [ad_adxx.R](https://github.com/pharmaverse/admiral/blob/main/inst/templates/ad_adxx.R){target="_blank"}

- `ADSL` variables

  All `ADSL` variables which are required for any derivation are merged
  to the SDTM dataset before the first derivation. These `ADSL`
  variables have to be added to the by-variables for derivations which
  add observations. This ensures that the `ADSL` variables are populated
  `for` the new observations. A `adsl_vars` variable should be created
  at the beginning of the script and added to the `by_vars` parameter
  for derivations which add observations.

  `ADSL` variables which should be in the final dataset but are not
  required for any derivation are merged to the dataset after the last
  derivation.

------------------------------------------------------------------------

1.  Cool note about the example.
