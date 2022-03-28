"
File that facilitates easy deployment at shinyapps.io.
Run rsconnect::deployApp() to share your app with your users.

See https://mastering-shiny.org/scaling-packaging.html#deploying-your-app-package
"

pkgload::load_all(".")
run_app()
