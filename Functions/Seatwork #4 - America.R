install.packages("imager")
install.packages('magick') 

#DisplayImage
library(imager)
file <- system.file('extdata/cap.jpg',package='imager')
leo <- load.image(file)
plot(leo)

#ResizedImage
library(imager)
file <- system.file('extdata/cap.jpg',package='imager')
leo <- load.image(file)
leo <- resize(leo, 250, 250)
plot(leo,main = "Resized")

#ReadImageThruWeb
library(magick)
leo <- image_read('https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/President_Barack_Obama.jpg/800px-President_Barack_Obama.jpg')
print(leo)