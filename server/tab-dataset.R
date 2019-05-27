output$contents1 <- renderTable({
  req(input$file1)
  tryCatch(
    {
      df <- read.csv(input$file1$datapath,
                     header = input$header,
                     fileEncoding = input$encoding,
                     sep = input$sep,
                     quote = input$quote,
                     dec = input$dec)
    },
    error = function(e) {
      stop(safeError(e))
    }
  )
    return(head(df))
  
})

output$contents2 <- renderTable({
  req(input$sampleDatasetType_val)
  tryCatch(
    { comp <- c("pro_ukr", "radical", "opposition", "small", "not_voted")
      if (input$sampleDatasetType_val == "input_2016.csv"){
        df <- read.csv("data/input_2016.csv",
                       header = 1,
                       fileEncoding = "CP1251",
                       sep = ",",
                       dec = ".",
                       stringsAsFactors = FALSE)
        colnames(df) <- c("RegName", "Ukr", "Math", comp)
      }
      if (input$sampleDatasetType_val == "input_2017.csv"){
        df <- read.csv("data/input_2017.csv",
                       header = FALSE,
                       sep = ",",
                       dec = ".",
                       stringsAsFactors = FALSE)
        colnames(df) <- c("Ukr", "Math", comp)
      }
      if (input$sampleDatasetType_val == "input_2018.csv"){
        df <- read.csv("data/input_2018.csv",
                       header = 1,
                       fileEncoding = "CP1251",
                       sep = ",",
                       dec = ".",
                       stringsAsFactors = FALSE)
        colnames(df) <- c("ind", "RegName", "Ukr", "Math", comp)
      }
      
    },
    error = function(e) {
      stop(safeError(e))
    }
  )
  return(head(df))
  
})