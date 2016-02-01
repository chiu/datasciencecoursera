library(data.table)
outcome_dt <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome_dt)
outcome_dt <- as.data.table(outcome_dt)
# outcome[, 11] <- as.numeric(outcome[, 11])
# hist(outcome[, 11])


best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  browser()
  if(outcome == 'heart attack'){
    outcome_col <- 'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack'
  }
  
  
  outcome_dt <- copy(outcome_dt)
  setnames(outcome_dt, old = outcome_col, new = 'used_column')
  subset_dt <- outcome_dt[State == state]
  subset_dt <- subset_dt[order(used_column)]
  result <- subset_dt
  return(result)
}


best_hospitals <- best("TX", 'heart attack')