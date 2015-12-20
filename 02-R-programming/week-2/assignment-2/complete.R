library(data.table)


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
    one_monitor_data <- na.omit(one_monitor_data)
    new_row <-
      data.table(id = specific_index, nobs = nrow(one_monitor_data))
    complete_data_dt <- rbind(complete_data_dt, new_row)
  }
  
  print("hi")
  
  print(complete_data_dt)
  return(complete_data_dt)
  
  
}

# complete_data_dt <- complete(directory = 'specdata', c(2,4,8,10,12))

complete1 <- complete("specdata", 1)

complete("specdata", c(2, 4, 8, 10, 12))

complete("specdata", 30:25)

complete("specdata", 3)

