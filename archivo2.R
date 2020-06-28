
#Grafico 1 - Histograma y poligono de frecuencia del peso

df_cardio_train <- read.csv(file = 'C:/Archivos_P2/cardio_train.csv')

histograma<-hist(df_cardio_train$weight, 
     col="slategray3", 
     border = "dodgerblue4",
     right=TRUE,
     xlab = "Pesos",
     ylab = "Frecuencia",
     ylim = c (0, 25000),
     main = "Histograma y polígono de frecuencia de los pesos",
     labels = T)

lines(c(0,histograma$mids),c(0,histograma$counts), type = "b", pch = 1, lwd = 2, col = "blue")