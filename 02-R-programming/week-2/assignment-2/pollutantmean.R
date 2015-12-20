

# something <- read.csv('specdata/307.csv')
library(data.table)
pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  # aggregate_table <- data.table()
  
  
  formatted_index <- formatC(id[1], width = 3, flag = "0")
  raw_data <-
    read.csv(paste0(directory,'/',formatted_index,'.csv'))
  aggregate_table <- raw_data
  
  if(length(id)>1){
    for (count in 2:length(id)) {
      
      # browser()
      specific_index <- id[count]
      print(specific_index)
      formatted_index <- formatC(specific_index, width = 3, flag = "0")
      raw_data <-
        read.csv(paste0(directory,'/',formatted_index,'.csv'))
      aggregate_table <- rbind(aggregate_table, raw_data)
      
    }
  }
  print("hi")
  pollutant_data <- aggregate_table[[pollutant]]
  result <- mean(pollutant_data, na.rm = TRUE)
  # result <- mean(aggregate_table[[]])
  result <- signif(result,4)
  return(result)
}


test1 <-
  pollutantmean(directory = 'specdata', pollutant = 'sulfate', id = 1:10)

test2 <- 
  pollutantmean("specdata", "nitrate", 70:72)

test3 <-
  pollutantmean("specdata", "nitrate", 23)
