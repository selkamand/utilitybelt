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

test_that("assert_non_empty_string works", {
  valid_string="Billy"
  valid_string_single_char="A"
  number = 5
  character = c("Billy", "Bob")
  empty_string=""
  expect_true(assert_non_empty_string(valid_string))
  expect_true(assert_non_empty_string(valid_string, msg = "Does adding a message anything this up?"))
  expect_true(assert_non_empty_string(valid_string_single_char))
  expect_error(assert_non_empty_string(number), "numeric")
  expect_error(assert_non_empty_string(character), "character")
  expect_error(assert_non_empty_string(empty_string), "empty")
  expect_error(assert_non_empty_string(empty_string, msg = "THIS IS MY ERROR MESSAGE"), "THIS IS MY ERROR MESSAGE")
  expect_error(assert_non_empty_string(character, msg = "THIS IS MY ERROR MESSAGE"), "THIS IS MY ERROR MESSAGE")
  })


test_that("assert_is_whole_number works", {
  expect_true(assert_is_whole_number(1))
  expect_true(assert_is_whole_number(10))
  expect_true(assert_is_whole_number(100.000))
  expect_true(assert_is_whole_number(-10))
  expect_true(assert_is_whole_number(-10.0))
  expect_error(assert_is_whole_number("STRING"))
  expect_error(assert_is_whole_number(1.2))
  expect_error(assert_is_whole_number(10000.5))
  expect_error(assert_is_whole_number(c(1, 2)))
  expect_error(assert_is_whole_number(list(1, 2)))
  expect_error(assert_is_whole_number("string", msg = "THIS IS MY ERROR MESSAGE"), "THIS IS MY ERROR MESSAGE")
})