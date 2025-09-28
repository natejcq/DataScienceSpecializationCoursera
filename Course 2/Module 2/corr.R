corr <- function(directory, threshold=0) {
    ## directory is a character vector of length 1 indicating the location of the CSV files.  
    ## threshold is a numeric vector of length 1 indicating the number of completely 
    ##observed observations (on all variables) required to compute the correlation b/w nitrate and sulfate
    
    myfiles <- list.files(directory, full.names=TRUE)
    correlations <- numeric()
    
    for (myfile in myfiles) {
      data <- read.csv(myfile)
      nobs <- sum(complete.cases(data))
      
      if (nobs > threshold) {
        co <- cor(data$sulfate, data$nitrate, use="complete.obs")
        correlations <- c(correlations, co)
      }
    }
    correlations
  }