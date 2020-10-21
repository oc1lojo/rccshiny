file_remove_if_exists <- function(x) {
  if (file.exists(x)) file.remove(x)
}

shinytest_suffix <- function() {

  sysname <- tolower(Sys.info()[["sysname"]])

  if (identical(Sys.getenv("APPVEYOR"), "True")) {
    suffix <- "appveyor"
  } else if (sysname == "windows") {
    suffix <- "windows"
  } else if (sysname %in% c("darwin", "linux")) {
    suffix <- "mac"
  } else {
    suffix <- NULL
  }

  suffix
}