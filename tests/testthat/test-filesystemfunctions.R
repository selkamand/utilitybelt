test_that("directory creation works", {
  existing_dirpath=system.file("filesfortesting/dir_created", package = "utilitybelt")
  inst_path=system.file(package = "utilitybelt")
  existing_dirpath=paste0(inst_path, "/dir_created")
  new_dirpath=paste0(existing_dirpath, "/newdir")
  
  if(!dir.exists(existing_dirpath)) dir.create(path = existing_dirpath, recursive = TRUE)
  if(dir.exists(new_dirpath)) unlink(new_dirpath, recursive = TRUE)
  
  expect_error(dir_create(existing_dirpath))
  expect_identical(dir_create(new_dirpath), new_dirpath)
  expect_true(file.exists(new_dirpath), new_dirpath)
  expect_error(dir_create(new_dirpath, force_overwrite = TRUE), NA)
  
  unlink(new_dirpath)
})

test_that("file creation works", {
  
  #Errors when overwriting exising path without force_overwrite
  file_preexisting.path = system.file("filesfortesting/file_create/existing_file", package="utilitybelt")
  expect_error(file_create(file_preexisting.path, force_overwrite = FALSE), "exists")
  
  
  #No error when creating new file
  file_new.path = paste0(
    system.file("filesfortesting/file_create", package="utilitybelt"),
    "/new_file"
  )
  
  unlink(file_new.path) #Make sure if a previous test crashes, the file is cleaned up
  
  expect_error(
    file_create(file_path = file_new.path, force_overwrite = TRUE),
    NA
  )
  
  #File was actually created
  expect_true(file.exists(file_new.path))
  
  #File can be succesfully overwritten
  expect_error(
    file_create(file_path = file_new.path, force_overwrite = TRUE),
    NA
  )
  
  unlink(file_new.path)
  
  #Cleanup side effects
})

test_that("file existence functions work",{
  file1.path = system.file("filesfortesting/do_files_exist/file1", package="utilitybelt")
  file2.path = system.file("filesfortesting/do_files_exist/file3", package="utilitybelt")
  fake_file.path = system.file("filesfortesting/do_files_exist", package="utilitybelt") %>% paste0("/filewhichdoesntexist")
  
  testthat::expect_true(files_exist_all(file1.path))
  testthat::expect_true(files_exist_all(file2.path))
  testthat::expect_false(files_exist_all(fake_file.path))
  
  testthat::expect_true(files_exist_all(c(file1.path, file2.path)))
  testthat::expect_false(files_exist_all(c(file1.path, file2.path, fake_file.path)))
  
  testthat::expect_equivalent(files_exist_which(c(file1.path, file2.path, fake_file.path)), c(TRUE, TRUE, FALSE))
  testthat::expect_equivalent(files_exist_which(c(fake_file.path, file2.path, file1.path)), c(FALSE, TRUE, TRUE))
  
  })