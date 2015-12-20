



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
  
  if (length(id) > 1) {
    for (count in 2:length(id)) {
      # browser()
      specific_index <- id[count]
      print(specific_index)
      formatted_index <-
        formatC(specific_index, width = 3, flag = "0")
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


# test1 <-
#   pollutantmean(directory = 'specdata', pollutant = 'sulfate', id = 1:10)
#
# test2 <-
#   pollutantmean("specdata", "nitrate", 70:72)
#
# test3 <-
#   pollutantmean("specdata", "nitrate", 23)


complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  complete_data_dt <-
    data.table(id = character(), nobs = integer())
  
  for (specific_index in id) {
    formatted_index <- formatC(specific_index, width = 3, flag = "0")
    one_monitor_data <-
      read.csv(paste0(directory,'/',formatted_index,'.csv'))
    new_row <-
      data.table(id = specific_index, nobs = nrow(one_monitor_data))
    complete_data_dt <- rbind(complete_data_dt, new_row)
  }
  
  print("hi")
  
  return(complete_data_dt)
  
  
}

complete_data_dt <- complete(directory = 'specdata', c(2,4,8,10,12))
