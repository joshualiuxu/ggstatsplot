% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ggcoefstats.R
\name{ggcoefstats}
\alias{ggcoefstats}
\title{Dot-and-whisker plots for regression analyses}
\usage{
ggcoefstats(
  x,
  output = "plot",
  statistic = NULL,
  conf.int = TRUE,
  conf.level = 0.95,
  k = 2L,
  exclude.intercept = FALSE,
  effsize = "eta",
  meta.analytic.effect = FALSE,
  meta.type = "parametric",
  bf.message = TRUE,
  sort = "none",
  xlab = "regression coefficient",
  ylab = "term",
  title = NULL,
  subtitle = NULL,
  caption = NULL,
  only.significant = FALSE,
  point.args = list(size = 3, color = "blue"),
  errorbar.args = list(height = 0),
  vline = TRUE,
  vline.args = list(size = 1, linetype = "dashed"),
  stats.labels = TRUE,
  stats.label.color = NULL,
  stats.label.args = list(size = 3, direction = "y"),
  package = "RColorBrewer",
  palette = "Dark2",
  ggtheme = ggplot2::theme_bw(),
  ggstatsplot.layer = TRUE,
  ...
)
}
\arguments{
\item{x}{A model object to be tidied, or a tidy data frame containing results
from a regression model. Function internally uses
\code{parameters::model_parameters} to get a tidy dataframe. If
a data frame is used, it \emph{must} contain columns named \code{term} (names of
predictors) and \code{estimate} (corresponding estimates of coefficients or
other quantities of interest).}

\item{output}{Character describing the expected output from this function:
\code{"plot"} (visualization of regression coefficients) or \code{"tidy"} (tidy
dataframe of results \code{parameters::model_parameters}) or \code{"glance"} (object
from \code{performance::model_performance}).}

\item{statistic}{Which statistic is to be displayed (either \code{"t"} or \code{"f"}or
\code{"z"} or \code{"chi"}) in the label. This is relevant if the \code{x} argument is a
\emph{dataframe}.}

\item{conf.int}{Logical. Decides whether to display confidence intervals as
error bars (Default: \code{TRUE}).}

\item{conf.level}{Numeric deciding level of confidence or credible intervals
(Default: \code{0.95}).}

\item{k}{Number of digits after decimal point (should be an integer)
(Default: \code{k = 2L}).}

\item{exclude.intercept}{Logical that decides whether the intercept should be
excluded from the plot (Default: \code{FALSE}).}

\item{effsize}{Character describing the effect size to be displayed: \code{"eta"}
(default) or \code{"omega"}. This argument is relevant only for models objects
of class \code{aov}, \code{anova}, \code{aovlist}, \code{"Gam"}, and \code{"manova"}.}

\item{meta.analytic.effect}{Logical that decides whether subtitle for
meta-analysis via linear (mixed-effects) models (default: \code{FALSE}). If
\code{TRUE}, input to argument \code{subtitle} will be ignored. This will be mostly
relevant if a data frame with estimates and their standard errors is
entered.}

\item{meta.type}{Type of statistics used to carry out random-effects
meta-analysis. If \code{"parametric"} (default), \code{metafor::rma} function will be
used. If \code{"robust"}, \code{metaplus::metaplus} function will be used. If
\code{"bayes"}, \code{metaBMA::meta_random} function will be used.}

\item{bf.message}{Logical that decides whether results from running a
Bayesian meta-analysis assuming that the effect size \emph{d} varies across
studies with standard deviation \emph{t} (i.e., a random-effects analysis)
should be displayed in caption. Defaults to \code{TRUE}.}

\item{sort}{If \code{"none"} (default) do not sort, \code{"ascending"} sort by
increasing coefficient value, or \code{"descending"} sort by decreasing
coefficient value.}

\item{xlab, ylab}{Labels for \code{x}- and \code{y}- axis variables, respectively
(Defaults: \code{"regression coefficient"} and \code{"term"}).}

\item{title}{The text for the plot title.}

\item{subtitle}{The text for the plot subtitle. The input to this argument
will be ignored if \code{meta.analytic.effect} is set to \code{TRUE}.}

\item{caption}{Text to display as caption. This argument is relevant only
when \code{output = "caption"}.}

\item{only.significant}{If \code{TRUE}, only stats labels for significant effects
is shown (Default: \code{FALSE}). This can be helpful when a large number of
regression coefficients are to be displayed in a single plot. Relevant only
when the \code{output} is a plot.}

\item{point.args}{Additional arguments that will be passed to
\code{ggplot2::geom_point} geom. Please see documentation for that function to
know more about these arguments.}

\item{errorbar.args}{Additional arguments that will be passed to
\code{ggplot2::geom_errorbarh} geom. Please see documentation for that function
to know more about these arguments.}

\item{vline}{Decides whether to display a vertical line (Default: \code{"TRUE"}).}

\item{vline.args}{Additional arguments that will be passed to
\code{ggplot2::geom_vline} geom. Please see documentation for that function to
know more about these arguments.}

\item{stats.labels}{Logical. Decides whether the statistic and \emph{p}-values for
each coefficient are to be attached to each dot as a text label using
\code{ggrepel} (Default: \code{TRUE}).}

\item{stats.label.color}{Color for the labels. If set to \code{NULL}, colors will
be chosen from the specified \code{package} (Default: \code{"RColorBrewer"}) and
\code{palette} (Default: \code{"Dark2"}).}

\item{stats.label.args}{Additional arguments that will be passed to
\code{ggrepel::geom_label_repel} geom. Please see documentation for that
function to know more about these arguments.}

\item{package}{Name of the package from which the given palette is to
be extracted. The available palettes and packages can be checked by running
\code{View(paletteer::palettes_d_names)}.}

\item{palette}{Name of the package from which the given palette is to
be extracted. The available palettes and packages can be checked by running
\code{View(paletteer::palettes_d_names)}.}

\item{ggtheme}{A function, \code{ggplot2} theme name. Default value is
\code{ggplot2::theme_bw()}. Any of the \code{ggplot2} themes, or themes from
extension packages are allowed (e.g., \code{ggthemes::theme_fivethirtyeight()},
\code{hrbrthemes::theme_ipsum_ps()}, etc.).}

\item{ggstatsplot.layer}{Logical that decides whether \code{theme_ggstatsplot}
theme elements are to be displayed along with the selected \code{ggtheme}
(Default: \code{TRUE}). \code{theme_ggstatsplot} is an opinionated theme layer that
override some aspects of the selected \code{ggtheme}.}

\item{...}{Additional arguments to tidying method. For more, see
\code{parameters::model_parameters}.}
}
\value{
Plot with the regression coefficients' point estimates as dots with
confidence interval whiskers and other statistical details included as
labels.
}
\description{
Dot-and-whisker plots for regression analyses
}
\note{
\enumerate{
\item All rows of regression estimates where either of the following
quantities is \code{NA} will be removed if labels are requested: \code{estimate},
\code{statistic}, \code{p.value}.
\item Given the rapid pace at which new methods are added to these packages, it
is recommended that you install the GitHub versions of \code{parameters} and
\code{performance} in order to make most of this function.
}
}
\examples{
\donttest{
# for reproducibility
set.seed(123)

# -------------- with model object --------------------------------------

# model object
mod <- lm(formula = mpg ~ cyl * am, data = mtcars)

# to get a plot
ggstatsplot::ggcoefstats(x = mod, output = "plot")

# to get a tidy dataframe
ggstatsplot::ggcoefstats(x = mod, output = "tidy")

# to get a glance summary
ggstatsplot::ggcoefstats(x = mod, output = "glance")

# -------------- with custom dataframe -----------------------------------

# creating a dataframe
df <-
  structure(
    list(
      term = structure(
        c(3L, 4L, 1L, 2L, 5L),
        .Label = c(
          "Africa",
          "Americas", "Asia", "Europe", "Oceania"
        ),
        class = "factor"
      ),
      estimate = c(
        0.382047603321706,
        0.780783111514665,
        0.425607573765058,
        0.558365541235078,
        0.956473848429961
      ),
      std.error = c(
        0.0465576338644502,
        0.0330218199731529,
        0.0362834986178494,
        0.0480571500648261,
        0.062215818388157
      ),
      statistic = c(
        8.20590677855356,
        23.6444603038067,
        11.7300588415607,
        11.6187818146078,
        15.3734833553524
      ),
      conf.low = c(
        0.290515146096969,
        0.715841986960399,
        0.354354575031406,
        0.46379116008131,
        0.827446138277154
      ),
      conf.high = c(
        0.473580060546444,
        0.845724236068931,
        0.496860572498711,
        0.652939922388847,
        1.08550155858277
      ),
      p.value = c(
        3.28679518728519e-15,
        4.04778497135963e-75,
        7.59757330804449e-29,
        5.45155840151592e-26,
        2.99171217913312e-13
      ),
      df.error = c(
        394L, 358L, 622L,
        298L, 22L
      )
    ),
    row.names = c(NA, -5L),
    class = c(
      "tbl_df",
      "tbl", "data.frame"
    )
  )

# plotting the dataframe
ggstatsplot::ggcoefstats(
  x = df,
  statistic = "t",
  meta.analytic.effect = TRUE,
  k = 3
)
}
}
\references{
\url{https://indrajeetpatil.github.io/ggstatsplot/articles/web_only/ggcoefstats.html}
}
