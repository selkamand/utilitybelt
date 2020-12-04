test_that("directory creation", {
  existing_dirpath="filesfortesting/dir_created"
  new_dirpath="filesfortesting/dir_created/newdir"
  if(dir.exists(new_dirpath)) unlink(new_dirpath, recursive = TRUE)
  
  expect_error(dir_create(existing_dirpath))
  expect_identical(dir_create(new_dirpath), new_dirpath)
  expect_true(file.exists(new_dirpath), new_dirpath)
  expect_error(dir_create(new_dirpath, force_overwrite = TRUE), NA)
  
  unlink(new_dirpath)
})
