#' Creates proportion or q1, q2, q3 plot
#' @description internal function used by server.R for plot in tab Comparison.
#'
#' `r lifecycle::badge("deprecated")`
#'
#' @author Fredrik Sandin, RCC Mellansverige
#' @keywords internal
#' @export
fIndPlot <-
  function(
    group = NULL,
    group_hide_less_than = FALSE,
    group_hide_less_than_label = "(otillr\u00e4cklig data)",
    group_maxchars = NULL,
    ind = NULL,
    period = NULL,
    max_periods = 99,
    ind_type = class(ind),
    ind_numeric = ind_type %in% c("difftime", "numeric", "integer"),
    ind_numeric_exclude_neg = TRUE,
    ind_numeric_percentiles = c(0.25, 0.5, 0.75),
    ind_factor_hide = NULL,
    ind_factor_sortbycols = NULL,
    ind_factor_shownN = ifelse(!is.null(ind_factor_hide), TRUE, FALSE),
    legend_ncol = NULL,
    legend_fixedtextwidth = TRUE,
    ind_showpct = ifelse(ind_type == "factor", FALSE, TRUE),
    ind_title = ifelse(ind_numeric, "Median", "Procent"),
    ind_noofcasestxt = "Antal fall",
    ind_noofcasestxt_nOfN = "av",
    col = NULL,
    border = TRUE,
    x_max = if (ind_numeric) {
      NULL
    } else {
      100
    },
    x_by = NULL,
    title = NULL,
    subtitle1 = NULL,
    subtitle2 = NULL,
    x_lab = ifelse(ind_numeric, "Median samt kvartilavst\u00e5nd", "Procent"),
    all_lab = "RIKET",
    emph_lab = NULL,
    text_cex = 1,
    point_cex = 2.25,
    target_values = NULL,
    target_values_high = NULL,
    target_values_labels = c("Mellanniv\u00e5 av m\u00e5luppfyllelse", "H\u00f6g niv\u00e5 av m\u00e5luppfyllelse"),
    funnelplot = FALSE,
    funnelplot_probs = c(0.05, 0.01),
    sort = TRUE,
    subset = NULL,
    subset_lab = "SUBSET"
  ) {

    lifecycle::deprecate_stop("1.8.0", "rccShiny::fIndPlot()", "rccShiny::rcc2PlotInd()")

}
