test_that("directory creation", {
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
