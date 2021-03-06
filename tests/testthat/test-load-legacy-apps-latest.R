library(shinytest)

test_that("loading legacy1-latest works", {
  appdir <- file.path("apps", "sv", "legacy1-latest")
  expect_pass(testApp(appdir, "load-app", compareImages = FALSE, interactive = FALSE, suffix = shinytest_suffix()))
})

test_that("loading legacy1hc-latest works", {
  skip_on_os("linux")

  appdir <- file.path("apps", "sv", "legacy1hc-latest")
  expect_pass(testApp(appdir, "load-app", compareImages = FALSE, interactive = FALSE, suffix = shinytest_suffix()))
})

test_that("loading legacy2-latest (sv) works", {
  appdir <- file.path("apps", "sv", "legacy2-latest")
  expect_pass(testApp(appdir, "load-app", compareImages = FALSE, interactive = FALSE, suffix = shinytest_suffix()))
})

test_that("loading legacy2-latest (en) works", {
  appdir <- file.path("apps", "en", "legacy2-latest")
  expect_pass(testApp(appdir, "load-app", compareImages = FALSE, interactive = FALSE, suffix = shinytest_suffix()))
})
