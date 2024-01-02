"
This is the UI of the statline search tool
"


topbarPanel <- function() {
  # This is the topbar panel

  div(
    class="table-row header",
    div(
      class="headerbox",
      div(
        class="linker_header",
        style="float: left;",
        div(
          style = "float: left;",
          actionLink(
            "logo",
            img(
              src = "www/favicon.png",
              alt = "Reidhin",
            ),
          )
        ),
        div(
          style = "overflow: hidden; padding-left: 24px;",
          div(
            h1("CBS statline searchtool")
          ),
        )
      ),
      div(
        class="rechter_header",
        style="float: right; display: flex; align-items: flex-end; justify-content: right;",
        actionLink(
          "colofon_link",
          "Colofon & explanation",
          style="margin-left: 40px; color: white; text-decoration: underline;",
          icon = icon("info-circle")
        )
      ),
      div(
        style="clear: both;"
      )
    )
  )
}


mainPanel <- function() {
  div(
    class="table-row body",
    div(
      class="table-cell body-content-outer-wrapper",
      div(
        class="body-content-inner-wrapper",
        id="scroll_div",
        div(
          class="body-content",
          div(
            class="mainPanel",
            div(
              class="box hoofdPanel",
              DT::DTOutput("statline_table")
            )
          )
        )
      )
    )
  )
}



