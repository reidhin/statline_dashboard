# This consists of a list of modals
modal_colofon <- function(filename) {
  modalDialog(
    title = "Colofon",
    includeMarkdown(filename),
    easyClose = TRUE,
    footer = modalButton("Close")
  )
}

