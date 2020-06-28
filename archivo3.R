library(gridExtra)
library(grid)
library(ggplot2)
#####################################################################################################
# a - Tabla de frecuencias de los suicidios en Guatemala por edades

df_suicide <- read.csv(file = 'C:/Archivos_P2/suicidio.csv')
sub_tabla <- df_suicide[c("country","age","suicides_no")]
sub_tabla <- subset.data.frame(sub_tabla,sub_tabla$country=="Guatemala" &sub_tabla$suicides_no!="NA")
sub_tabla <- sub_tabla[c("age","suicides_no")]

nombres<-sub_tabla$age
nombres<-replace(nombres,nombres=="1-4","01-04")
nombres<-replace(nombres,nombres=="5-9","05-09")
nombres<-replace(nombres,nombres=="Childish","05-09")
nombres<-replace(nombres,nombres=="100 and over","99+")

valores<-sub_tabla$suicides_no

sub_tabla<-data.frame(nombres,valores)
sub_tabla <- aggregate(x=sub_tabla$valores, by=list(edades=sub_tabla$nombres), FUN=sum)
sub_tabla <-sub_tabla[order(sub_tabla$edades, decreasing = FALSE),]

Edades<-sub_tabla$edades
f<-sub_tabla$x
fa<-cumsum(f)
fr<- round(prop.table(f),8)
fra<-round(cumsum(prop.table(f)),8)
tt<-ttheme_default(core = list(fg_params=list(hjust = 1, x=1),bg_params=list(fill=c("slategray3", "gray"))),colhead = list(fg_params=list(col="white"),bg_params=list(fill="Blue")))
tabla_frecuencias<-data.frame(Edades,f,fa,fr,fra)
tabla_grid <- tableGrob(tabla_frecuencias,theme = tt)
grid.newpage()
grid.draw(tabla_grid)

#########################################################################################################
#     b- Gráfica de barras de la frecuencia absoluta

mybar<-barplot(tabla_frecuencias$f, main="Frecuencia absoluta de los suicidios en Guatemala",
               xlab="Rango de edad",ylab="Frecuencia", col=palette("Pastel 2"),
               names.arg= paste(tabla_frecuencias$Edades,tabla_frecuencias$f, sep="\n"),cex.names = 0.8)


#########################################################################################################
#     c- Poligono de frecuencias de la frecuencia absoluta

ejey<-c(1,5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100)
plot(y=tabla_frecuencias$f,x=ejey, type = "b", col = "blue", pch = 20,ylab = "Frecuencias",xlab = "Edades",main = "Frecuencias de suicidios en Guatemala")


#########################################################################################################
#     d- Diagrama de frecuencia acumulada.

ejey<-c(1,5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100)
plot(y=tabla_frecuencias$fa,x=ejey, type = "b", col = "blue", pch = 20,ylab = "Frecuencias",xlab = "Edades",main = "Diagrama de frecuencias acumuladas")

