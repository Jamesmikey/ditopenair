#
# This is a Plumber API. You can run the API by clicking
# the 'Run API' button above.
#
# Find out more about building APIs with Plumber here:
#
#    https://www.rplumber.io/
#

library(plumber)
library(openair)
library(lubridate)
library(tibble)


#* Plot a time variations
#* @serializer svg list(width=11)
#* @post /plot/timeVariation
function(data,pollutants,group,ylab='',normalize=FALSE,ci=FALSE,main='') {



  data$date<- ymd_hms(data$date)

  data

  pollutants<-unlist(pollutants)


  if(tolower(group) == tolower("NA")){
    group<-NULL;
  }

  print(data)

  if(is.null(group)){
    timeVariation(as_tibble(data),pollutant=pollutants,normalise = normalize,ylab=ylab,ci = ci,main=main)
  }else{
    timeVariation(as_tibble(data),pollutant=pollutants,normalise = normalize,group = group,ylab=ylab,ci = ci,main=main)
  }

}


#* Plot a time variations
#* @serializer pdf list(paper = "a4r", width = 0, height = 7)
#* @post /plot/pdf/timeVariation
function(data,pollutants,group,ylab='',normalize=FALSE,ci=FALSE,main='') {

  data$date<- ymd_hms(data$date)

  pollutants<-unlist(pollutants)


  if(tolower(group) == tolower("NA")){
    group<-NULL;
  }


  if(is.null(group)){
    timeVariation(as_tibble(data),pollutant=pollutants,ylab=ylab,ci = ci,main=main,normalise = normalize)
  }else{
    timeVariation(as_tibble(data),pollutant=pollutants,group = group,ylab=ylab,ci = ci,main=main,normalise = normalize)
  }




}




#* Plot a time variations
#* @serializer svg list(width=11)
#* @post /plot/timePlot
function(data,pollutants,cols='default',ylab='',avg.time='default',normalize=FALSE,normalise = normalize, type='default',stack=FALSE,main='') {

  data$date<- ymd_hms(data$date)

  pollutants<-unlist(pollutants)

  timePlot(as_tibble(data),pollutant=pollutants,cols = cols,ylab = ylab,avg.time=avg.time,type = type,stack = stack,main=main)


}


#* Plot a time variations
#* @serializer pdf list(paper = "a4r", width = 0, height = 7)
#* @post /plot/pdf/timePlot
function(data,pollutants,cols='default',ylab='',avg.time='default',normalize=FALSE, type='default',stack=FALSE,main='') {

  data$date<- ymd_hms(data$date)

  pollutants<-unlist(pollutants)


  timePlot(as_tibble(data),pollutant=pollutants,cols = cols,ylab = ylab,avg.time=avg.time,type = type,stack = stack,main=main)


}





#* @filter cors
cors <- function(res) {
  res$setHeader("Access-Control-Allow-Origin", "*")
  plumber::forward()
}