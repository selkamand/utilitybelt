test_that("positiveControl_checkScriptsDeclareTheirLocation", {
  testthat::expect_true(checkScriptsDeclareTheirLocation("filesfortesting/here_positive_control"))
  testthat::expect_true(checkScriptsDeclareTheirLocation("filesfortesting/here_positive_control/"))
})

test_that("negativeControl_checkScriptsDeclareTheirLocation", {
  testthat::expect_false(checkScriptsDeclareTheirLocation("filesfortesting/here_negative_control"))
  testthat::expect_false(checkScriptsDeclareTheirLocation("filesfortesting/here_negative_control/"))
})

test_that("negativeControl_nestedDirectories_checkScriptsDeclareTheirLocation", {
  testthat::expect_false(checkScriptsDeclareTheirLocation("filesfortesting/here_negative_control_nested"))
  testthat::expect_false(checkScriptsDeclareTheirLocation("filesfortesting/here_negative_control_nested/"))
})

test_that("getpathProjectRootDirectory returns package home", {
 testthat::expect_identical(getpathProjectRootDirectory(), tools::file_path_as_absolute("../../"))
})

test_that("path_processing works",{
  testthat::expect_identical(path_process("/root/bla/bla2/file.tsv",extract_basename = TRUE, remove_extension = FALSE), "file.tsv")
  testthat::expect_identical(path_process("/root/bla/bla2/file.tsv",extract_basename = TRUE, remove_extension = TRUE), "file")
  testthat::expect_identical(path_process("/root/bla/bla2/file.tsv",extract_basename = FALSE, remove_extension = TRUE), "/root/bla/bla2/file")
  testthat::expect_identical(path_process("/root/bla/bla2/file.tsv",extract_basename = FALSE, remove_extension = TRUE), "/root/bla/bla2/file")
  testthat::expect_error(path_process("/root/bla/bla2/file.tsv",extract_basename = FALSE, remove_extension = FALSE))
  testthat::expect_identical(path_process("/root/bla/bla2/file.bob.tsv.gz",extract_basename = FALSE, remove_extension = TRUE), "/root/bla/bla2/file.bob")
  testthat::expect_identical(path_process("/root/bla/bla2/file.bob.tsv.gz",extract_basename = TRUE, remove_extension = TRUE), "file.bob")
})