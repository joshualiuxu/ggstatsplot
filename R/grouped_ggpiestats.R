#' @title Grouped pie charts with statistical tests
#' @name grouped_ggpiestats
#' @description Helper function for `ggstatsplot::ggpiestats` to apply this
#'   function across multiple levels of a given factor and combining the
#'   resulting plots using `ggstatsplot::combine_plots`.
#'
#' @inheritParams ggpiestats
#' @inheritParams grouped_ggbetweenstats
#' @inheritDotParams ggpiestats -title
#'
#' @importFrom dplyr select
#' @importFrom rlang enquo quo_name ensym
#' @importFrom purrr map
#'
#' @seealso \code{\link{ggbarstats}}, \code{\link{ggpiestats}},
#'  \code{\link{grouped_ggbarstats}}
#'
#' @inherit ggpiestats return references
#' @inherit ggpiestats return details
#' @inherit ggpiestats return return
#'
#' @examples
#' \donttest{
#' # grouped one-sample proportion test
#' # let's skip statistical analysis
#' ggstatsplot::grouped_ggpiestats(
#'   data = mtcars,
#'   grouping.var = am,
#'   x = cyl,
#'   results.subtitle = FALSE
#' )
#' }
#' @export

# defining the function
grouped_ggpiestats <- function(data,
                               x,
                               y = NULL,
                               counts = NULL,
                               grouping.var,
                               title.prefix = NULL,
                               output = "plot",
                               ...,
                               plotgrid.args = list(),
                               title.text = NULL,
                               title.args = list(size = 16, fontface = "bold"),
                               caption.text = NULL,
                               caption.args = list(size = 10),
                               sub.text = NULL,
                               sub.args = list(size = 12)) {

  # ======================== preparing dataframe =============================

  # if `title.prefix` is not provided, use the variable `grouping.var` name
  if (is.null(title.prefix)) title.prefix <- rlang::as_name(rlang::ensym(grouping.var))

  # creating a dataframe
  df <-
    dplyr::select(.data = data, {{ grouping.var }}, {{ x }}, {{ y }}, {{ counts }}) %>%
    grouped_list(data = ., grouping.var = {{ grouping.var }})

  # ==================== creating a list of return objects ===================

  # creating a list of plots using `pmap`
  plotlist_purrr <-
    purrr::pmap(
      .l = list(data = df, title = paste0(title.prefix, ": ", names(df))),
      .f = ggstatsplot::ggpiestats,
      # put common parameters here
      x = {{ x }},
      y = {{ y }},
      counts = {{ counts }},
      output = output,
      ...
    )

  # combining the list of plots into a single plot
  if (output == "plot") {
    return(ggstatsplot::combine_plots2(
      plotlist = plotlist_purrr,
      plotgrid.args = plotgrid.args,
      title.text = title.text,
      title.args = title.args,
      caption.text = caption.text,
      caption.args = caption.args,
      sub.text = sub.text,
      sub.args = sub.args
    ))
  } else {
    return(plotlist_purrr) # subtitle list
  }
}
