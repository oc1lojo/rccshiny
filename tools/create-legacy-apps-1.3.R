# remotes::install_bitbucket("cancercentrum/rccshiny", ref = "1.3", type = "binary")

library(shiny)
library(rccShiny)

if (packageVersion("rccShiny") == "1.3") {

  # Create legacy1-1.3
  # Adopted from https://bitbucket.org/cancercentrum/rccshiny/src/1.6.0/R/rccShiny2.R#lines-94
  rccShiny2(
    data = rccShinyData,
    folder = "legacy1-1.3",
    path = file.path("tests", "testthat", "apps"),
    outcome = paste0("outcome", 1:3),
    outcomeTitle = c("Dikotom", "Kontinuerlig", "Kategorisk"),
    description = c("Har beskrivs indikatorn.", "Viktig information!", "Information om variabler etc."),
    varOther = list(
      list(
        var = "age",
        label = "Alder vid diagnos"
      ),
      list(
        var = "stage",
        label = "Stadium",
        choices = c("I", "II"),
        selected = "I",
        multiple = TRUE,
        showInTitle = TRUE
      )
    )
  )

  # Create legacy2-1.3
  # Adopted from https://bitbucket.org/cancercentrum/rccshiny/src/1.6.0/R/rccShiny2.R#lines-124
  rccShinyData$outcome1_en <- rccShinyData$outcome1
  rccShiny2(
    language = c("sv", "en"),
    data = rccShinyData,
    folder = "legacy2-1.3",
    path = file.path("tests", "testthat", "apps"),
    outcome = "outcome1",
    outcomeTitle = list("Kontaktsjukskoterska", "Contact nurse"),
    textBeforeSubtitle = c("Nagot pa svenska", "Something in English"),
    description = list(
      c("Har beskrivs indikatorn.", "Viktig information!", "Information om variabler etc."),
      c("Description of the indicator", "Important information!", "Information on variables etc.")
    ),
    varOther = list(
      list(
        var = "age",
        label = c("Alder vid diagnos", "Age at diagnosis"),
        choices = c(0, 120)
      )
    ),
    targetValues = c(95, 99)
  )
}
