test_that("assert_that wrapper works", {
  expect_true(utilitybelt::assert_that(is.character("Hi friends")))
  expect_true(utilitybelt::assert_that(is.numeric(5)))
  expect_true(utilitybelt::assert_that(is.data.frame(data.frame(hi=1:5, alpha = LETTERS[1:5]))))
  expect_error(utilitybelt::assert_that(is.double(c("Hi", "Friends"))))
  
  #Test output is invisible (see ?invisible())
  logfile.path = paste0(system.file(package="utilitybelt"), "/assert_that_unit_test.log")
  sink(logfile.path)
  utilitybelt::assert_that(is.character("Hi friends"))
  sink()
  expect_true(file.size(logfile.path)==0)
  file.remove(logfile.path)
})
