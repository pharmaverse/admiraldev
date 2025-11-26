# Retrieve a Dataset from the `admiraldev_environment` environment

Retrieve a Dataset from the `admiraldev_environment` environment

## Usage

``` r
get_dataset(name)
```

## Arguments

- name:

  The name of the dataset to retrieve

  Default value

  :   none

## Value

A `data.frame`

## Details

Sometimes, developers may want to provide information to users which
does not fit into a warning or error message. For example, if the input
dataset of a function contains unexpected records, these can be stored
in a separate dataset, which users can access to investigate the issue.

To achieve this, R has a data structure known as an 'environment'. These
environment objects are created at build time, but can be populated with
values after the package has been loaded and update those values over
the course of an R session.

As so, the establishment of `admiraldev_environment` allows us to create
dynamic data/objects based on user-inputs that need modification. The
purpose of `get_dataset` is to retrieve the datasets contained inside
`admiraldev_environment`.

Currently we only support two datasets inside our
`admiraldev_environment` object:

- `one_to_many`

- `many_to_one`

## See also

Brings something to you!?!:
[`get_constant_vars()`](https://pharmaverse.github.io/admiraldev/dev/reference/get_constant_vars.md),
[`get_duplicates()`](https://pharmaverse.github.io/admiraldev/dev/reference/get_duplicates.md),
[`get_source_vars()`](https://pharmaverse.github.io/admiraldev/dev/reference/get_source_vars.md)
