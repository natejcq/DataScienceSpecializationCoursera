complete <- function(directory, id=1:332){
    ## "directory' is a character vector of length 1 indicating the location of the csv files
    ## 'id' is an integer vector indicating the IDs for the monitors
  
    myfiles <- list.files(directory, full.names=TRUE)[id]
    
    ## Create a data frame to store the results
    ## First column IDs second column is number of complete cases in that file
    nobs <- numeric()
    
    ## Iterating through the files
    for(myfile in myfiles){
      data <- read.csv(myfile)
      nobs <- c(nobs,sum(complete.cases(data)))
    }
    result <- data.frame(id, nobs)
    return(result)
}