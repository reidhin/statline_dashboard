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
        actionLink(
          "logo",
          img(
            src = "www/logo_vng_gs.png",
            alt = "VNG Logo",
          ),
          style = "float: left;"
        ),
        div(
          style = "overflow: hidden; padding-left: 24px;",
          h1("CBS statline searchtool")
        )
      ),
      div(
        class="rechter_header",
        style="float: right; display: flex; align-items: flex-end; justify-content: right;",

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
          ),
          colofonPanel()
        )
      )
    )
  )
}



colofonPanel <- function() {
  div(
    class = "colofonPanel",
    style = "margin-top: 80px;",
    div(
      class = "colofonbox",
      style = "justify-content: center; display: flex; align-items: center;",
      div(
        img(
          src = "www/logo_vng_gs.svg",
          alt = "VNG Logo",
          style = "height: 32px; margin-right: 8px;"
        )
      ),
      div(
        span("Ontwikkeld in opdracht van VNG")
      ),
      div(
        actionLink(
          "colofon_link",
          "Colofon & uitleg",
          style="margin-left: 40px; color: white; text-decoration: underline;",
          icon = icon("info-circle")
        )
      )
    )
  )
}
