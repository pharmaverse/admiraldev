# lifecycle_admiral Test 1:  Simple message is sent to user

    Code
      example_fun(data)
    Message
      `example_fun()` was deprecated in admiraldev 1.0.0.
      i Please use `example_fun2()` instead.
    Code
      example_fun(data)
    Message
      `example_fun()` was deprecated in admiraldev 1.0.0.
      i Please use `example_fun2()` instead.

# lifecycle_admiral Test 2:  Spicier message is sent to user

    Code
      example_fun(data)
    Message
      `example_fun()` was deprecated in admiraldev 1.0.0.
      i Please use `example_fun2()` instead.
      x This message will turn into a warning with release of 1.1.0
      i See admiral's deprecation guidance: https://pharmaverse.github.io/admiraldev/dev/articles/programming_strategy.html#deprecation
    Code
      example_fun(data)
    Message
      `example_fun()` was deprecated in admiraldev 1.0.0.
      i Please use `example_fun2()` instead.
      x This message will turn into a warning with release of 1.1.0
      i See admiral's deprecation guidance: https://pharmaverse.github.io/admiraldev/dev/articles/programming_strategy.html#deprecation

