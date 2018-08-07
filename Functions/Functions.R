add5numbers <- function(n1, n2, n3, n4, n5){
  sum_n = n1 + n2 + n3 + n4 + n5
  sum_n
}
add5numbers(30, 08, 22, 08, 19)

x<- 1:100
subset_data <- function(datasit, min_datasit, max_datasit){
  subset_param <- (datasit>min_datasit)&(datasit<max_datasit)
  datasit[subset_param]
}
subset_data(x, 35, 90)

dataset_csv <- read.csv("midetrmseatwork_data.csv")

MeanFunction <- function(dataset_csv, removeNA = TRUE){
  col_num <- ncol(dataset_csv)
  means_per_col <- numeric(col_num)
  for (element in 1:col_num){
    means_per_col[element] <- mean(dataset_csv[ ,element], na.rm = removeNA)
  } 
  means_per_col
}
MeanFunction(dotosot)
