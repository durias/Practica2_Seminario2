
########################################################################################################################
# Grafico 1 - Total de ganancias en Paises de Centro America

df_sales <- read.csv(file = 'C:/Archivos_P2/sales.csv')
sub_tabla <- df_sales[c("Country","Item.Type","Total.Profit")]
sub_tabla <-subset.data.frame(sub_tabla,sub_tabla$Item.Type=="Clothes")
sub_tabla <- subset.data.frame(sub_tabla,sub_tabla$Country=="Guatemala" |sub_tabla$Country=="Belize"|sub_tabla$Country=="El Salvador" | sub_tabla$Country=="Honduras" |sub_tabla$Country=="Nicaragua" |sub_tabla$Country=="Costa Rica" |sub_tabla$Country=="Panama" |sub_tabla$Country=="Belice")
sub_tabla <- aggregate(x=sub_tabla$Total.Profit, by=list(Paises_CA=sub_tabla$Country), FUN=sum)

sub_tabla

pie(radius = 1.1,sub_tabla$x,labels = paste(sub_tabla$Paises_CA,sub_tabla$x, sep="\n"),clockwise = TRUE,col = palette("Pastel 2"),cex=0.8, main =  "TOTAL DE VENTAS DE ROPA EN PAISES DE CENTRO AMERICA")



########################################################################################################################
# Grafico 2 - Articulos vendidos offline y online

df_sales <- read.csv(file = 'C:/Archivos_P2/sales.csv')
sub_tabla <- df_sales[c("Units.Sold","Sales.Channel")]
sub_tabla <- aggregate(x=sub_tabla$Units.Sold, by=list(canales=sub_tabla$Sales.Channel), FUN=sum)

sub_tabla

barplot(sub_tabla$x, main="Numero de Articulos de las ventas Offline vs Online",
        xlab="Canales de distribucion", col=c("slategray3", "gray"),
        names.arg= paste(sub_tabla$canales,sub_tabla$x, sep="\n"),xlim = c (0, 3))

########################################################################################################################
# Grafico 3 - Año con mas ordenes de prioridad M 

df_sales <- read.csv(file = 'C:/Archivos_P2/sales.csv')
sub_tabla <- df_sales[c("Order.Priority","Order.Date")]
sub_tabla <-subset.data.frame(sub_tabla,sub_tabla$Order.Priority=="M")
sub_tabla <- cbind(sub_tabla,anio= format(as.Date(sub_tabla$Order.Date, "%m/%d/%Y"),"%Y"),contador=c(1))
sub_tabla <- aggregate(x=sub_tabla$contador, by=list(anios=sub_tabla$anio), FUN=sum)
sub_tabla <-sub_tabla[order(sub_tabla$x, decreasing = TRUE),]

barplot(sub_tabla$x, main="Años con mas ordenes de prioridad M",
        xlab="Años",ylab="Ordenes", col=palette("Pastel 2"),
        names.arg= paste(sub_tabla$anios,sub_tabla$x, sep="\n"),xlim = c (0, 11),ylim = c (0, 200))

