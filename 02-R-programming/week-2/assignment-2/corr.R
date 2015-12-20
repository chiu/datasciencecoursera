
corr <- function(directory, threshold = 0) {
  
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  source('complete.R')
  complete_data_dt <- complete(directory, 1:332)
  passing_threshold_data <- complete_data_dt[nobs > threshold]
  passing_ids <- passing_threshold_data$id
  passing_ids <- as.numeric(passing_ids)
  
  passing_cor <- vector()
  for (specific_index in passing_ids) {
    formatted_index <- formatC(specific_index, width = 3, flag = "0")
    one_monitor_data <-
      read.csv(paste0(directory,'/',formatted_index,'.csv'))
    one_monitor_data <- na.omit(one_monitor_data)
    one_monitor_cor <- cor(x=one_monitor_data$sulfate, y=one_monitor_data$nitrate, use = "everything")
    print(one_monitor_cor)
    passing_cor <- c(passing_cor, one_monitor_cor)
    print("function end")
    
  }
  return(passing_cor)
}


passing_cor_output <- corr('specdata', threshold = 150)