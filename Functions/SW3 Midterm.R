dataset <- read.csv("midetrmseatwork_data.csv")
dataset

#Task1
Func1 <- function(data,row,col){
  data[row,col]
}
Func1(dataset,88,3)

#Task2
Func2 <-function(data,col){
  sum(is.na(data[,col]))
}
Func2(dataset,4)

#Task3
Func3 <- function(dataset, Row, Row1){
  y<- 0
  for(row in 20:70){
    y[row]<-ifelse(dataset[row,1], dataset[row,1],NA)
  }
  mean(y,na.rm = TRUE)
}

Func3(dataset,30,80)