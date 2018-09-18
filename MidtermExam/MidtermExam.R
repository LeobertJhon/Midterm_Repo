library (argparse)
library (imager)
library (stringr)

parser <- ArgumentParser()
parser$add_argument("-path", help = "Local File Directory of image to augment")
parser$add_argument("-resize",dest="HxW",help = "To resize an image :Default = 0")
parser$add_argument("-gray" ,default=FALSE,type="logical",help = "To grayscale an image")
parser$add_argument("-angle",default=0,type="integer", help = "To change the angle of the image")

parser$print_help()     
args <- parser$parse_args()  

W<-as.numeric(args$W)
H<-as.numeric(args$H)
num <- args$HxW
HxW <- str_split(num, "x", simplify = TRUE)
H1 <- as.numeric(HxW[1])
W1 <- as.numeric(HxW[2])
H1[is.na(H1)] <- 0
W1[is.na(W1)] <- 0

dir.create(file.path("Image"), showWarnings = FALSE)

# path to folder that holds multiple .jpg files
Images<-function(path){
  list <- list.files(path=path, pattern=".jpg$",recursive = TRUE ,ignore.case=TRUE,full.names  =TRUE)
  lapply(list, load.image)
}

augmented <- function(IMAGE,H,W,GRAY,ANGLE){
  
  if(H&&W > 1){
    img <- Images(IMAGE)
    x <- 1:length(img)
    resize <- lapply(img,resize,size_x = H, size_y = W)
    for (i in x){
      save.image(resize[[i]],file=paste0("Image/ResizeImage",i,".jpg"))
    }
  }
  
  
  if(GRAY==TRUE){
    img<-Images(IMAGE)
    x <- 1:length(img)
    y <- lapply(img,grayscale)
    for (i in x){
      save.image(y[[i]],file=paste0("Image/GrayImage",i,".jpg"))
    }
  }
  
  if(ANGLE>1){
  im <- Images(IMAGE)
  x <- 1:length(img)
  inverted <- lapply(img,imrotate,ANGLE)
  for (i in x){
    save.image(inverted[[i]],file=paste0("Image/InvertedImage",i,".jpg"))
  }
  }
}

#output
print(augmented(args$path,H1,W1,args$gray,args$angle))
