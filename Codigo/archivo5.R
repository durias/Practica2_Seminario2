
########################################################################################################################
# a. An�lisis exploratorio de datos para comprobar si existe relaci�n entre estr�s, depresi�n y ansiedad.


df_regresion <- read.csv(file = 'C:/Archivos_P2/regresion.csv')
valores<-df_regresion[c("depressionpercentage","stresspercentage","anxietypercentage")]


pairs(valores, cex.labels=1.5,
      main='Matriz de dispersi�n',
      labels=c("Depresi�n","Estr�s","Ansiedad"),col="blue", cex=1)



########################################################################################################################
# b. De existir relaci�n, realice una regresi�n lineal entre los datos y demuestre que el modelo produce datos v�lidos.

plot(depressionpercentage ~ stresspercentage, data = valores, xlab = "% Depresion", ylab = "% Estres", main="Modelo depresi�n estr�s" )
modelo_lineal <- lm(depressionpercentage ~ stresspercentage, data = valores)
abline(modelo_lineal, col = "blue")

plot(depressionpercentage ~ anxietypercentage, data = valores, xlab = "% Depresion", ylab = "% Ansiedad", main="Modelo depresi�n ansiedad" )
modelo_lineal <- lm(depressionpercentage ~ anxietypercentage, data = valores)
abline(modelo_lineal, col = "blue")

plot(stresspercentage ~ anxietypercentage, data = valores, xlab = "% Estr�s", ylab = "% Ansiedad", main="Modelo estr�s ansiedad" )
modelo_lineal <- lm(stresspercentage ~ anxietypercentage, data = valores)
abline(modelo_lineal, col = "blue")