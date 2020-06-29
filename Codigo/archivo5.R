
########################################################################################################################
# a. Análisis exploratorio de datos para comprobar si existe relación entre estrés, depresión y ansiedad.


df_regresion <- read.csv(file = 'C:/Archivos_P2/regresion.csv')
valores<-df_regresion[c("depressionpercentage","stresspercentage","anxietypercentage")]


pairs(valores, cex.labels=1.5,
      main='Matriz de dispersión',
      labels=c("Depresión","Estrés","Ansiedad"),col="blue", cex=1)



########################################################################################################################
# b. De existir relación, realice una regresión lineal entre los datos y demuestre que el modelo produce datos válidos.

plot(depressionpercentage ~ stresspercentage, data = valores, xlab = "% Depresion", ylab = "% Estres", main="Modelo depresión estrés" )
modelo_lineal <- lm(depressionpercentage ~ stresspercentage, data = valores)
abline(modelo_lineal, col = "blue")

plot(depressionpercentage ~ anxietypercentage, data = valores, xlab = "% Depresion", ylab = "% Ansiedad", main="Modelo depresión ansiedad" )
modelo_lineal <- lm(depressionpercentage ~ anxietypercentage, data = valores)
abline(modelo_lineal, col = "blue")

plot(stresspercentage ~ anxietypercentage, data = valores, xlab = "% Estrés", ylab = "% Ansiedad", main="Modelo estrés ansiedad" )
modelo_lineal <- lm(stresspercentage ~ anxietypercentage, data = valores)
abline(modelo_lineal, col = "blue")