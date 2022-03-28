#' Run the statline app
#'
#' @param ... Other arguments passed to \code{\link[shiny]{shinyApp}} in the
#'   Shiny package.
#' @return Nothing
#'
#' @import shiny
#' @importFrom magrittr %>%
#'
#' @export
#'
#' @examples
#' \dontrun{
#' run_app()
#' }
#'
run_app <- function(...) {
  # This is the statline dashboard

  ##################################### Data preparatie #############################################
  # get all catalogs
  df <- cbsodataR::cbs_get_datasets(catalog=NULL)


  # define link
  base_urls <- data.frame(
    Catalog = c(
      "CBS",
      "MKB",
      "IV3",
      "MLZ",
      "JM",
      "RIVM",
      "Politie",
      "MVStat",
      "AZW",
      "InterReg"
    ),
    base_url = c(
      "https://opendata.cbs.nl/statline/#/CBS/",
      "https://mkbstatline.cbs.nl/#/MKB/",
      "https://iv3statline.cbs.nl/#/IV3/",
      "https://mlzopendata.cbs.nl/#/MLZ/",
      "https://jmopendata.cbs.nl/#/JM/",
      "https://statline.rivm.nl/#/RIVM/",
      "https://data.politie.nl/#/Politie/",
      "https://mvstat.cbs.nl/#/MVstat/",
      "https://azwstatline.cbs.nl/#/AZW/",
      "https://opendata.grensdata.eu/#/InterReg/"
    )
  )

  # merge
  df <- merge(df, base_urls)

  # link
  df[["link"]] <- do.call(sprintf, c(df[c("base_url", "Language", "Identifier")], "%s%s/dataset/%s"))

  # hyperlink
  df$Identifier <- paste0(
    "<a href='", df$link, "' target='_blank' rel='noopener noreferrer'>",
    df$Identifier,
    "</a"
  )

  # set datatype as factor
  for (filter in c("OutputStatus", "Language", "Catalog", "Frequency")) {
    df[[filter]] <- as.factor(df[[filter]])
  }

  # remove columns that are no longer needed and select most important columns only
  df <- df[
    c(
      "Title",
      "Catalog",
      "Identifier",
      "Updated",
      #      "Modified",
      "OutputStatus",
      #      "Source",
      "Language",
      "Frequency",
      "Period",
      "ShortDescription"
    )
  ]

  www <- system.file(file.path("dashboard", "www"), package="statline")

  addResourcePath("www", system.file(file.path("dashboard", "www"), package="statline"))


  ##################################### UI gedeelte #################################################

  ui <- fillPage(
    tags$head(tags$title("CBS statline searchtool")),
    tags$head(tags$link(rel="shortcut icon", href="www/favicon.ico")),
    tags$head(
      # Note the wrapping of the string in HTML()
      # To set the search boxes in the datatable to 100px explicitly
      tags$style(HTML("
      td[data-type='factor'] input {
        width: 100px !important;
      }"))
    ),
    shinyjs::useShinyjs(),
    includeCSS(file.path(www, "vng_style.css")),
    div(
      class="table container",
      topbarPanel(),
      mainPanel()
    )
  )


  ######################################## server gedeelte ##########################################

  # Define server logic
  server <- function(input, output, session) {

    # listen to table row selection
    observeEvent(
      input$statline_table_cells_selected,
      {
        if (nrow(input$statline_table_cells_selected) > 0) {
          showModal(modalDialog(
            style = "max-height: 600px; overflow-y: scroll;",
            size = "l",
            title = df[input$statline_table_cells_selected[1, 1], "Title"],
            p(
              style = "white-space: pre-wrap; word-break: normal;",
              df[input$statline_table_cells_selected[1, 1], "ShortDescription"]
            ),
            easyClose = TRUE,
            footer = modalButton("Dismiss")
          ))

        }

        # reset selection of rows
        DT::selectCells(proxy_statline_table, selected = NULL)
      },
      ignoreInit = TRUE
    )


    # table output
    output$statline_table <- DT::renderDT(
      DT::datatable(
        isolate(df),
        filter = "top",
        escape = 1,
        rownames= FALSE,
        selection = list(mode="single", target="cell"),
        options=list(
          columnDefs = list(list(visible=FALSE, targets=-1))
        )
      ) %>%
        DT::formatDate(
          columns = 4,
          method = 'toDateString'
        )
    )

    # create a table proxy
    proxy_statline_table <- DT::dataTableProxy("statline_table")
  }

  ######################################## application ##########################################

  # Run the application
  shinyApp(ui = ui, server = server, ...)

}
