
tabPanel(
  title="Dataset",
  id    = "datasetTab",
  value = "datasetTab",
  name  = "datasetTab",
  class = "fade in",
  icon  = icon("table"),
  h2(strong("Please select data with MVC model to begin")),
  tabsetPanel(id = "datasetTabs", type = "tabs",
              tabPanel(title="Upload data",
                       id = "newDatasetTab",
                       sidebarPanel(
                           fileInput("file1", "Choose CSV File",
                                     multiple = FALSE,
                                     accept = c("text/csv",
                                                "text/comma-separated-values,text/plain",
                                                ".csv")),
                           tags$hr(),
                           checkboxInput("header", "Header", FALSE),
                           fluidRow(column(6, selectInput("encoding", "Encoding", 
                                                          choices = list("Windows 1251" = "CP1251", 
                                                                         "UTF-8" = "UTF-8"), selected = "UTF-8")),
                                    column(6, selectInput("sep", "Separator",
                                                          choices = c(Comma = ",",
                                                                      Semicolon = ";",
                                                                      Tab = "\t"),
                                                          selected = ","))),
                           
                           fluidRow(column(6, radioButtons("quote", "Quote",
                                                           choices = c(None = "",
                                                                       "Double Quote" = '"',
                                                                       "Single Quote" = "'"),
                                                           selected = '"')),
                                    column(3, radioButtons("dec", "Decimal",
                                                           choices = c("Dot" = ".",
                                                                       "Comma" = ",",
                                                                       "Semicolon"=";"),
                                                           selected = '.'))),
                           
                           
                           tags$hr()
                           ),
                         tableOutput("contents1")), 
              tabPanel(title = "Use sample data",
                       id = "sampleDatasetTab",
                       sidebarPanel(selectInput("sampleDatasetType_val", "Choose a dataset to load",
                                                choices = c("EIT 2016" = "input_2016.csv",
                                                            "EIT 2017" = "input_2017.csv",
                                                            "EIT 2018" = "input_2018.csv"
                                                ),
                                                selected = "EIT 2016"),
                                    tags$hr()),
                                    tableOutput("contents2")
              )
              )
)