library(lintr)

source("R/linters.R")

linters <- admiral_linters()

exclusions <- list(
  "R/data.R" = Inf,
  "inst" = list(undesirable_function_linter = Inf),
  "vignettes" = list(undesirable_function_linter = Inf)
)
