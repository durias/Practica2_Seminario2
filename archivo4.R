# a. Grafica de barras de la potencia de disparo promedio, máximo y mínimo de los jugadores con nacionalidad alemana.


df_fifa <- read.csv(file = 'C:/Archivos_P2/fifa.csv')
sub_tabla <- df_fifa[c("Nationality","ShotPower")]
sub_tabla <-subset.data.frame(sub_tabla,sub_tabla$Nationality=="Germany" & sub_tabla$ShotPower!="NA")

media <- aggregate(sub_tabla$ShotPower,by = list(sub_tabla$Nationality),FUN=mean)
max <- aggregate(sub_tabla$ShotPower,by = list(sub_tabla$Nationality),FUN=max)
min <- aggregate(sub_tabla$ShotPower,by = list(sub_tabla$Nationality),FUN=min)

av<-media$x
mx<-max$x
mn<-min$x

valores=c(av,mx,mn)
etiquetas=c("Promedio","Maximo","Minimo")

mybar<-barplot(valores, main="Potencia de disparo de jugadores Alemanes",
               xlab="Valores",ylab="Potencia", col=palette("Pastel 2"),
               names.arg= paste(etiquetas,valores, sep="\n"),cex.names = 0.8,ylim = c(0,100))


# b. Gráfica que muestre al club con la mayor agresividad promedio y al club con la menor agresividad promedio.

df_fifa <- read.csv(file = 'C:/Archivos_P2/fifa.csv')
sub_tabla <- df_fifa[c("Club","Aggression")]
sub_tabla <-subset.data.frame(sub_tabla,sub_tabla$Club!="NA" & sub_tabla$Aggression!="NA")


sub_tabla <- aggregate(sub_tabla$Aggression,by = list(sub_tabla$Club),FUN=mean)
max <- sub_tabla[which.max(sub_tabla$x),]
min <- sub_tabla[which.min(sub_tabla$x),]

etiquetas<-c(max$Group.1,min$Group.1)
valores<-c(max$x,min$x)


mybar<-barplot(valores, main="Clubes con la mayor y menor agresividad",
               xlab="Clubes",ylab="Agresividad", col=c("Red","Blue"),
               names.arg= paste(etiquetas,valores, sep="\n"),cex.names = 0.8,ylim = c(0,75))

# c. Gráfica que muestre al club con el mayor regate promedio y al club con el menor regate promedio.

df_fifa <- read.csv(file = 'C:/Archivos_P2/fifa.csv')
sub_tabla <- df_fifa[c("Club","Dribbling")]
sub_tabla <-subset.data.frame(sub_tabla,sub_tabla$Club!="NA" & sub_tabla$Dribbling!="NA")


sub_tabla <- aggregate(sub_tabla$Dribbling,by = list(sub_tabla$Club),FUN=mean)
max <- sub_tabla[which.max(sub_tabla$x),]
min <- sub_tabla[which.min(sub_tabla$x),]

etiquetas<-c(max$Group.1,min$Group.1)
valores<-c(max$x,min$x)


mybar<-barplot(valores, main="Clubes con el mayor y menor regate",
               xlab="Clubes",ylab="Regate", col=c("Red","Blue"),
               names.arg= paste(etiquetas,valores, sep="\n"),cex.names = 0.8,ylim = c(0,75))


