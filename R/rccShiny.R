#' Shiny apps for RCC
#' @description returns shiny apps that can be used as a complement to the annual reports from the cancer quality registries in Sweden.
#'
#' `r lifecycle::badge("deprecated")`
#'
#' @param language vector giving the language for the app. Possible values are "sv" and "en". Default is "sv". See details.
#' @param data data frame containing the variables used.
#' @param outcome vector with names(s) of variable(s) in data containing the variable(s) to be presented in the app, for example a quality indicator. Variable(s) must be of type logical, factor or numeric. Default is "outcome". Observe that observations with missing values for outcome are not included in the output.
#' @param outcomeNumericExcludeNeg should negative values be excluded when presenting a numeric outcome? Particularly relevant for waiting times. Default is TRUE.
#' @param outcomeTitle label(s) of the outcome(s) shown in the app. Must be the same length as argument outcome. Default is argument outcome.
#' @param folder name of folder where the results are placed. Default is "ind".
#' @param folderLinkText name displayed in ready-to-use html link returned by the function. Default is NULL, which results in the use of arguments outcomeTitle, folder and language to construct a name depending on the number of outcomes.
#' @param path search path to folder returned by the function. Default is working directory.
#' @param textBeforeSubtitle optional text placed before the subtitles in the tabs.
#' @param textAfterSubtitle optional text placed after the subtitles in the tabs.
#' @param comment optional comment printed under the sidebar panel.
#' @param description vector of 3 character strings, or a list of vectors, one for each language, shown in the three subsections in the tab Beskrivning/Description. Default is c(NA, NA, NA).
#' @param geoUnitsHospital optional name of variable in data containing hospital names. Variable must be of type character. If NULL or if "sjukhus" is not found in 'data', hospital is not available as a level of presentation. At least one geoUnit must be given. To be implemented: Hospital codes.
#' @param geoUnitsCounty optional name of variable in data containing county codes. Variable must be of type numeric. Can be either county of residence for the patient or the county the hospital belongs to. See details for valid values. If NULL or if "landsting" is not found in 'data', county is not available as a level of presentation. At least one geoUnit must be given. To be implemented: Codes for county of hospital are fetched automatically from hospital codes.
#' @param geoUnitsRegion optional name of variable in data containing region codes (1=Stockholm, 2=Mellansverige, 3=Sydöstra, 4=Södra, 5=Västra, 6=Norra, NA=Uppgift saknas). Variable must be of type numeric. Can be either region of residence for the patient or the region the hospital belongs to. If NULL or if "region" is not found in 'data', region is not available as a level of presentation. At least one geoUnit must be given. To be implemented: Codes for region of hospital are fetched automatically from hospital codes.
#' @param geoUnitsPatient if geoUnitsCounty/geoUnitsRegion is county/region of residence for the patient (LKF). If FALSE and a hospital is chosen by the user in the sidebar panel the output is highlighted for the respective county/region that the hospital belongs to. Default is FALSE.
#' @param regionSelection adds a widget to the sidebar panel with the option to show only one region at a time. Default is TRUE.
#' @param regionLabel if regionSelection = TRUE label of widget shown in the sidebar panel. Default is "Begränsa till region", "Limit to region" depending on language.
#' @param period name of variable in data containing time periods, for example date or year of diagnosis. Variable must be of type numeric or Date. Default is "period". If period = NULL then no period variable is required and period will not be included anywhere in the Shiny app.
#' @param periodDateLevel If the variable in data containing time period is of type Date, how are the time periods going to be grouped? Allowed values are "year and "quarter", with default "year".
#' @param periodLabel label for the period widget in the sidebar panal. Default is "Diagnosår", "Year of diagnosis" depending on language.
#' @param varOther optional list of variable(s), other than period and geoUnits, to be shown in the sidebar panel. Arguments to the list are: var (name of variable in data), label (label shown over widget in sidebar panel), choices (which values of var should be shown, min, max for continuous variables), selected (which values should be selected when app is launched, default is all avalible values), multiple (should multiple choises be availible, default is TRUE), showInTitle (should selection be displayed in subtitle, default is TRUE). Observe that observations with missing values for varOthers are not included in the output.
#' @param targetValues optional vector or list of vectors (one for each outcome) with 1-2 target levels to be plotted in the tabs Jämförelse/Comparison and Trend for outcomes of type logical or numeric. If the outcome is numeric the target levels are shown when "Andel inom..."/"Proportion within..." is selected, and then only for the default propWithinValue.
#' @param funnelplot adds a widget to the sidebar panel with the option to show a funnel plot in the tab Jämförelse/Comparison. Only applicaple for dichotomous variables. Default is FALSE.
#' @param sortDescending should the bars in tab Jämförelse/Comparison be plotted in descending order? The argument could have the same length as argument outcome, giving different values for each outcome. Default is NULL, which sorts logical outcomes in descending order and continuous outcomes in ascending order.
#' @param propWithinShow display the choice "Andel inom..."/"Proportion within..." for numeric outcome(s). Default is TRUE.
#' @param propWithinUnit unit shown for numeric outcome when "Andel inom..."/"Proportion within..." is selected. Default is "dagar", "days" depending on language.
#' @param propWithinValue vector with default value(s) shown for numeric outcome(s) when "Andel inom..."/"Proportion within..." is selected. If the length of the vector is less than the number of numeric outcomes the values are recycled. Default is 30.
#' @param prob a vector of quantiles for summarizing indicator if indicator is numeric. Defaults to c(0.25,0.5,0.75).
#' @param hideLessThan value under which groups (cells) are supressed. Default is 5 and all values < 5 are set to 5.
#' @param showHide To be implemented: Should levels with values < 5 be shown but without values? Default is TRUE.
#' @param gaPath optional path to Google Analytics .js-file. Default is NULL.
#' @param npcrGroupPrivateOthers should private hospitals be grouped when displaying data for the entire country. Applicable for NPCR. Default is FALSE.
#'
#' @details Valid values for geoUnitsCounty are:
#'   \tabular{lll}{
#' \strong{geoUnitsPatient}   \tab \strong{!geoUnitsPatient} \tab \strong{Text shown}\cr
#' 1\tab 10,11 \tab  Stockholm\cr
#' 3\tab 12 \tab  Uppsala\cr
#' 4\tab 13 \tab  Södermanland\cr
#' 5\tab 21 \tab  Östergötland\cr
#' 6\tab 22 \tab Jönköping\cr
#' 7\tab 23 \tab  Kronoberg\cr
#' 8\tab 24,25 \tab  Kalmar\cr
#' 9\tab 26 \tab  Gotland\cr
#' 10\tab 27 \tab  Blekinge\cr
#' 12\tab 28,30,41   \tab  Skåne\cr
#' 13\tab 42 \tab  Halland\cr
#' 14\tab 50,51,52,53   \tab  Västra Götaland\cr
#' 17\tab 54 \tab  Värmland\cr
#' 18\tab 55 \tab  Örebro\cr
#' 19\tab 56 \tab  Västmanland\cr
#' 20\tab 57 \tab  Dalarna\cr
#' 21\tab 61 \tab  Gävleborg\cr
#' 22\tab 62 \tab  Västernorrland\cr
#' 23\tab 63 \tab  Jämtland\cr
#' 24\tab 64 \tab  Västerbotten\cr
#' 25\tab 65 \tab  Norrbotten\cr
#' -\tab 91,92,93,94,95,96 \tab  Övriga/privata - region\cr
#' NA\tab NA \tab  Uppgift saknas
#' }
#'
#'
#'
#' If language = c("sv", "en") the following applies to arguments: textBeforeSubtitle, textAfterSubtitle, comment,
#' regionLabel, label in list varOther: if there are two values the first is used in the Swedish version and the second in the English version. If there is only one value this is recycled in both versions.
#' The following applies to argument outcomeTitle, description: the arguments should be given in a list, the first listargument is used in the Swedish version and the second in the English version. The Swedish title(s) will be recycled if English is missing.
#' The following applies to arguments outcome, geoUnitsHospital, geoUnitsCounty, geoUnitsRegion, period, var in list varOther: in the English version the variable name with the suffix _en (for example "outcome_en") will be used if this exists and otherwise the Swedish variable name will be recycled.
#'
#' @author Fredrik Sandin, RCC Mellansverige
#'
#' @return A folder path/apps/sv|en/folder containing: global.R, server.R, ui.R, data/data.RData, docs/description.html.
#' @keywords internal
#' @export

rccShiny <-
  function(
    language = "sv",
    data = NULL,
    outcome = "outcome",
    outcomeNumericExcludeNeg = TRUE,
    outcomeTitle = outcome,
    folder = "ind",
    folderLinkText = NULL,
    path = getwd(),
    textBeforeSubtitle = NULL,
    textAfterSubtitle = NULL,
    comment = "",
    description = rep(NA,3),
    geoUnitsHospital = "sjukhus",
    geoUnitsCounty = "landsting",
    geoUnitsRegion = "region",
    geoUnitsPatient = FALSE,
    regionSelection = TRUE,
    regionLabel = rccShinyTXT(language = language)$limitRegion,
    period = "period",
    periodDateLevel = "year",
    periodLabel = rccShinyTXT(language = language)$dxYear,
    varOther = NULL,
    targetValues = NULL,
    funnelplot = FALSE,
    sortDescending = NULL,
    propWithinShow = TRUE,
    propWithinUnit = rccShinyTXT(language = language)$propWithinUnit,
    propWithinValue = 30,
    prob = c(0.25,0.50,0.75),
    hideLessThan = 5,
    showHide = TRUE,
    gaPath = NULL,
    npcrGroupPrivateOthers = FALSE

  ) {

    lifecycle::deprecate_stop("1.8.0", "rccShiny::rccShiny()", "rccShiny::rccShiny2()")

  }
