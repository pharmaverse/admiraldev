library(lintr)

source("inst/lintr/linters.R")

linters <- admiral_linters(cyclocomp = cyclocomp_linter(complexity_limit = 21))

exclusions <- list(
  "R/data.R" = Inf,
  "inst" = list(undesirable_function_linter = Inf),
  "vignettes" = list(undesirable_function_linter = Inf)
)
