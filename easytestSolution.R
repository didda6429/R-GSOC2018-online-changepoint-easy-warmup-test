require(changepoint)

## We'll use the glioblastoma data from Lai et al. as a sample data set
## as it's produces a nice result which is easy to visualise
## To use any other data set, simple assign it to the data variable
data("Lai2005fig4", package = "changepoint")
sampleData <- Lai2005fig4[,5]

plotIterativeChangePoints <- function(data, outputFileName){
  ##save the plots to the given filename in the current working directory
  pdf(file = outputFileName)
  par(mfrow = c(4,1))
  ##Check we have a meaningful amount of data to work with
  stopifnot(length(data) > 5)
  ##Start at 5 data points
  for(i in 5:length(data)){
    changePoints <- cpt.mean(data[1:i], method = "PELT")
    plot(changePoints)
  }
  dev.off()
}

plotIterativeChangePoints(sampleData, "changepointPlots.pdf")
