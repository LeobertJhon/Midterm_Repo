library (argparse)
library (imager)

parser <- ArgumentParser()
parser$add_argument("-Image", help = "Local File Directory of image to augment")
parser$add_argument("-H",type="integer", help = "Height")
parser$add_argument("-W",type="integer", help = "Width")
parser$add_argument("-Gray" ,type="logical",help = "To grayscale an image")
parser$add_argument("-Angle",type="integer", help = "To change the angle of the image")

parser$print_help()     
args <- parser$parse_args()  

print (args$Image)
print (args$H)
print (args$W)
print (args$Gray)
print (args$Angle)

augmented <- function(IMAGE,H,W,GRAY,ANGLE){
  if(GRAY==TRUE){
    imge <- load.image(IMAGE)
    gray <- grayscale(imge)
    gray1 <- save.image(im=gray,file=paste0("GrayImage.jpg"))
  }
  if(H&&W > 1){
    imge <- load.image(IMAGE)
    imgrsze <- resize(imge, size_x = H, size_y = W)
    save.image(im = imgrsze,file=paste0("ResizedImage.jpg"))
  }
  if(ANGLE>1){
    imge <- load.image(IMAGE)
    invimg <- imrotate(im=imge,angle)
    invimg1 <- save.image(im=invimg,file=paste0("InvertedImage.jpg"))
  }
}
#output
print(augmented(args$Image,args$H,args$W,args$Gray,args$Angle))