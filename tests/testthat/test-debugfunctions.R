test_that("get_calling_function works", {
  wrapper <- function(n_function_calls_ago=1, verbose=TRUE){
    get_calling_function(n_function_calls_ago, verbose)
  }
  
  expect_equal(wrapper(), "wrapper()")
  
  wrapper_wrapper <- function(n_function_calls_ago=1, verbose=TRUE){
    wrapper(n_function_calls_ago, verbose=verbose)
  }
  
  expect_true(assertthat::is.string(wrapper()))
  expect_equal(wrapper_wrapper(), "wrapper(n_function_calls_ago, verbose = verbose)")
  expect_equal(wrapper_wrapper(2), "wrapper_wrapper(2)")
  expect_equal(wrapper_wrapper(100, verbose=FALSE), "base")
  expect_message(wrapper_wrapper(100, verbose=TRUE))
  expect_error(wrapper_wrapper("100"))
  expect_error(wrapper_wrapper(1:10)) #Errors now but maybe one day will return a vector of strings.
  
})
