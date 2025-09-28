pollutantmean <- function(directory, pollutant, id = 1:332){
  ## "directory' is a character vector of length 1 indicating the location of the csv files
  ## 'pollutant' is a character vector of length 1 indicating the name of the pollutant
  ## 'id' is an integer vector indicating the IDs for the monitors
  
  ## This function returns the mean of pollutant across all monitors ignoring NAs

  pll <- numeric()
  mydata <- numeric() 
  ## Get the list of all the files needed 
  myfiles <- list.files(directory, full.names=TRUE)[id]
  for (myfile in myfiles){
      ## Get the data corresponding to the specified pollutant and append it to mydata
      pll <- read.csv(myfile)
      mydata <- c(mydata, pll[[pollutant]])
  }
  ## Now compute the mean
  result <- mean(mydata, na.rm=TRUE)
  result
}

