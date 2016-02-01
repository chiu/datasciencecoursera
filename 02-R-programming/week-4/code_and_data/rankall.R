library(data.table)
outcome_dt <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome_dt)
outcome_dt <- as.data.table(outcome_dt)

rankall <- function(outcome, num = "best") {
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
#   if( length(intersect(outcome_dt$State, state)) == 0 ){
#     break('invalid state')
#   }
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
  outcome_dt <- outcome_dt[!is.na(outcome_dt$used_column)]
  subset_dt <- outcome_dt[order(State, used_column, Hospital.Name)]
  subset_dt <- subset_dt[, .(State, used_column, Hospital.Name)]

    if( num == "best"){
    result <- subset_dt[, .SD[1], by = "State"]
  } else if (num == "worst"){
    result <- subset_dt[, .SD[.N], by = "State"]
  } else {
    result <- subset_dt[, .SD[num], by = "State"]
  }
  
  return(result)
}

rankall_1 <- head(rankall("heart attack", 20), 10)
rankall_2 <- tail(rankall("pneumonia", "worst"), 3)
rankall_3 <- tail(rankall("heart failure"), 10)
