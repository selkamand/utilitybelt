test_that("function argument counting works", {
  # Calling from outside a named function
  fun = function(a, b, c) { return(a+b-c) }
  expect_equal(fun_count_arguments(fun), 3)

  # Calling from outside an anonymous
  expect_equal(fun_count_arguments(function(a, b, c) { return(a+b+c) }), 3) 

  # Calling from inside a named function
  my_function <- function(a, b, c, d, e, f, g) { return(fun_count_arguments(my_function)) }
  expect_equal(my_function(), 7)
  
  #Intentionally Error
  expect_error(fun_count_arguments("STRING"))
  expect_error(fun_count_arguments(5))
})

