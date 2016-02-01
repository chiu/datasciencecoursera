library(data.table)
outcome_dt <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome_dt)
outcome_dt <- as.data.table(outcome_dt)

rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  # browser()
  
#   if( num == "best"){
#     num <- 1
#   } else if (num == "worst"){
#     num <- '.N'
#   } else {
#    num <- num 
#   }
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
  subset_dt <- outcome_dt[State == state]
  subset_dt <- subset_dt[order(used_column,Hospital.Name)]
  if( num == "best"){
    result <- subset_dt[1, .(Hospital.Name, used_column, State)]
  } else if (num == "worst"){
    result <- subset_dt[.N, .(Hospital.Name, used_column, State)]
  } else {
    result <- subset_dt[num, .(Hospital.Name, used_column, State)]
  }

  return(result)
}

rank_1 <- rankhospital("TX", "heart failure", 4)
rank_2 <- rankhospital("MD", "heart attack", "worst")

rank_3 <- rankhospital("MN", "heart attack", 5000)