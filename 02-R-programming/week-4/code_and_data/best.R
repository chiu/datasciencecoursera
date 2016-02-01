library(data.table)
original_outcome_dt <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
original_outcome_dt <- as.data.table(original_outcome_dt)
outcome_dt <- copy(original_outcome_dt)
head(outcome_dt)
outcome_dt <- as.data.table(outcome_dt)
# outcome[, 11] <- as.numeric(outcome[, 11])
# hist(outcome[, 11])


best <- function(state, outcome) {
  # browser()
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  # browser()
  outcome_dt <- copy(outcome_dt)
  if( length(intersect(outcome_dt$State, state)) == 0 ){
    break('invalid state')
  }
  COLNAME_PREFIX <- 'Hospital.30.Day.Death..Mortality..Rates.from.'
  if(outcome == 'heart attack'){
    outcome_col <- paste0(COLNAME_PREFIX,'Heart.Attack')
  } else if (outcome == 'heart failure') {
    outcome_col <- paste0(COLNAME_PREFIX,'Heart.Failure')
  } else if (outcome == 'pneumonia') {
    outcome_col <- paste0(COLNAME_PREFIX,'Pneumonia')
  } else {
    break('invalid outcome')
  }
  
  
  
  
  setnames(outcome_dt, old = outcome_col, new = 'used_column')
  outcome_dt[, used_column := as.numeric(used_column, na.rm = TRUE)]
  subset_dt <- outcome_dt[State == state]
  subset_dt <- subset_dt[order(used_column,Hospital.Name)]
  result <- subset_dt[1:10, .(Hospital.Name, used_column, State)]
  return(result)
}


trial_1 <- best("TX", 'heart attack')
trial_2 <- best("TX", 'heart failure')
trial_3 <- best("MD", "heart attack")
trial_4 <- best("MD", "pneumonia")

# error_5 <- best("BB", "heart attack")
# error_6 <- best("NY", "hert attack")




# rankhospital <- function(state, outcome, num = "best") {
#   ## Read outcome data
#   ## Check that state and outcome are valid
#   ## Return hospital name in that state with the given rank
#   ## 30-day death rate
#   
#   outcome_dt <- copy(outcome_dt)
#   if( length(intersect(outcome_dt$State, state)) == 0 ){
#     break('invalid state')
#   }
#   COLNAME_PREFIX <- 'Hospital.30.Day.Death..Mortality..Rates.from.'
#   if(outcome == 'heart attack'){
#     outcome_col <- paste0(COLNAME_PREFIX,'Heart.Attack')
#   } else if (outcome == 'heart failure') {
#     outcome_col <- paste0(COLNAME_PREFIX,'Heart.Failure')
#   } else if (outcome == 'pneumonia') {
#     outcome_col <- paste0(COLNAME_PREFIX,'Pneumonia')
#   } else {
#     break('invalid outcome')
#   }
#   
#   
#   
#   
#   setnames(outcome_dt, old = outcome_col, new = 'used_column')
#   subset_dt <- outcome_dt[State == state]
#   subset_dt <- subset_dt[order(used_column,Hospital.Name)]
#   result <- subset_dt[num, .(Hospital.Name, used_column, State)]
#   return(result)
# }