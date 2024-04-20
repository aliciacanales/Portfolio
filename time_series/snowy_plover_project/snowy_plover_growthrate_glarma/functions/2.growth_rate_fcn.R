#' Growth Rate Function
#'
#' @param df dataframe with variables year and population abundance for a given year
#' @param individuals the abundance of a population for a given year 
#'
#' @return dataframe with new column that has calculated proportional growth rates

growth_rate_fcn <- function(df, individuals) {
  
  ## adding new column to the dataframe with NAs as placeholder
  df$growth_rates <- NA
  
  ## for loop that runs over 
  for (i in 1:(length(individuals) - 1)) {
    df$growth_rates[i] <- (individuals[i + 1]) / (individuals[i])
  }
  return(df)
}