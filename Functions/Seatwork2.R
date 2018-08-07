dataset_csv <- read.csv("midetrmseatwork_data.csv")

MeanFunction <- function(dataset_csv, removeNA = TRUE){
  col_num <- ncol(dataset_csv)
  means_per_col <- numeric(col_num)
  for (Wind in 1:col_num){
    means_per_col[Wind] <- mean(dataset_csv[ ,(Ozone>25)&(Temp>70)], na.rm = removeNA)
  } 
  means_per_col
}
MeanFunction(dotosot)

subset_data <- function(Wind , Ozone_datasit, Temp_datasit){
  subset_param <- (Ozone>min_datasit)&(Temp<max_datasit)
  datasit[subset_param]
}
subset_data(x, 25, 70)