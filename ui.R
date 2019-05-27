library(shiny)
library(dplyr)
library(shinycssloaders)
library(shinythemes)


ui <- fluidPage(fixedRow(
  column(9,
         img(src="logo5.png", hight=135, width=1192),
         fixedRow(navbarPage("",
                             id= "tabSelected",
                             source(file.path("ui", "tab-dataset.R"),  local = TRUE)$value,
                             source(file.path("ui", "tab-settings.R"),  local = TRUE)$value,
                             source(file.path("ui", "tab-analysis.R"),  local = TRUE)$value,
                             source(file.path("ui", "tab-models.R"),  local = TRUE)$value,
                             source(file.path("ui", "tab-results.R"),  local = TRUE)$value,
                             source(file.path("ui", "tab-about.R"),  local = TRUE)$value)
         )
  )
)
)