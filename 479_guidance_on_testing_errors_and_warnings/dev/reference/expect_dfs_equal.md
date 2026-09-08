# Expectation: Are Two Datasets Equal?

Uses
[`diffdf::diffdf()`](https://gowerc.github.io/diffdf/latest-tag/reference/diffdf.html)
to compares 2 datasets for any differences. This function can be thought
of as an R-equivalent of SAS proc compare and a useful tool for unit
testing as well.

## Usage

``` r
expect_dfs_equal(base, compare, keys, ...)
```

## Arguments

- base:

  Input dataset

  Permitted values

  :   A dataset, i.e., a `data.frame` or tibble.

  Default value

  :   none

- compare:

  Comparison dataset

  Default value

  :   none

- keys:

  `character` vector of variables that define a unique row in the `base`
  and `compare` datasets

  Default value

  :   none

- ...:

  Additional arguments passed onto
  [`diffdf::diffdf()`](https://gowerc.github.io/diffdf/latest-tag/reference/diffdf.html)

  Default value

  :   none

## Value

An error if `base` and `compare` do not match or `NULL` invisibly if
they do

## Examples

``` r
library(dplyr, warn.conflicts = FALSE)

tbl1 <- tribble(
  ~USUBJID, ~AGE, ~SEX,
  "1001", 18, "M",
  "1002", 19, "F",
  "1003", 20, "M",
  "1004", 18, "F"
)

tbl2 <- tribble(
  ~USUBJID, ~AGE, ~SEX,
  "1001", 18, "M",
  "1002", 18.9, "F",
  "1003", 20, NA
)

try(expect_dfs_equal(tbl1, tbl2, keys = "USUBJID"))
#> Error : Differences found between the objects!
#> 
#> Summary of BASE and COMPARE
#>   ==================================================================
#>     PROPERTY             BASE                       COMP            
#>   ------------------------------------------------------------------
#>       Name               base                      compare          
#>      Class     "tbl_df, tbl, data.frame"  "tbl_df, tbl, data.frame" 
#>     Rows(#)                4                          3             
#>    Columns(#)              3                          3             
#>   ------------------------------------------------------------------
#> 
#> 
#> There are rows in BASE that are not in COMPARE !!
#>   =========
#>    USUBJID 
#>   ---------
#>     1004   
#>   ---------
#> 
#> 
#> Not all Values Compared Equal
#>   =============================
#>    Variable  No of Differences 
#>   -----------------------------
#>      AGE             1         
#>      SEX             1         
#>   -----------------------------
#> 
#> 
#>   ==================================
#>    VARIABLE  USUBJID  BASE  COMPARE 
#>   ----------------------------------
#>      AGE      1002     19    18.9   
#>   ----------------------------------
#> 
#> 
#>   ==================================
#>    VARIABLE  USUBJID  BASE  COMPARE 
#>   ----------------------------------
#>      SEX      1003     M     <NA>   
#>   ----------------------------------
#> 
#> 

tlb3 <- tribble(
  ~USUBJID, ~AGE, ~SEX,
  "1004", 18, "F",
  "1003", 20, "M",
  "1002", 19, "F",
  "1001", 18, "M",
)

# Note the sorting order of the keys is not required
expect_dfs_equal(tbl1, tlb3, keys = "USUBJID")
```
