library(imager)
library(magick)

#DisplayImage
pic1 <- load.image("img/pic1.jpg") %>% plot

#Resize
resizeimg <- function(img,height,width){
  imgrsze <- resize(img, size_x = height, size_y = width)
  save.image(im = imgrsze,"img/sagfpic1.jpg")
  plot(imgrsze)
}

resizeimg(pic1,250,500)

#Grayscale
grayimg <- function(img,x){
  is.logical(x)
  if(x==TRUE){
    pic <- grayscale(img)
    pic1 <- save.image(pic,"img/pic1gray.jpg")
    plot(pic)
  } else{
    plot(img)
  }
}

grayimg(pic1,TRUE)
grayimg(pic1,FALSE)


#Invert
invertimg <- function(im,angle){
  invimg <- imrotate(im,angle)
  invimg1 <- save.image(invimg,"img/invertpic1.jpg")
  plot(invimg)
}
invertimg(pic1,180)

