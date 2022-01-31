#Load SCVA and SCMA packages
install.packages("SCVA")
install.packages("SCMA")
install.packages("RcmdrPlugin.SCDA")
library (SCVA, SCMA)
library(RcmdrPlugin.SCDA) #Con esto se puede hacer todo desde el GUI
library(Rcmdr)
library(RcmdrMisc) #Con estos dos lo abres
Rcmdr::
#Leer datos de diseño AB en R con géfico simple AB 
graph("AB",data=read.table(file.choose(new= FALSE)),xlab="Semanas",ylab="Palabras correctas por minuto")

#Calcular las medidas de localización (mean)
graph.CL("AB","mean",data=read.table(file.choose(new=FALSE)),xlab="Semanas",
         ylab="Palabras correctas por minuto")

#Examinar variabilidad (range bars)
graph.VAR("AB","RB",dataset="regular","mean",data=read.table(file.choose(new=FALSE)),
          xlab="Semanas", ylab="Palabras correctas por minuto")

#Calcular tendencias (least squares method)
graph.TREND("AB","LSR","mean",data=read.table(file.choose(new=FALSE)),
            xlab="Semanas", ylab="Palabras correctas por minuto")

#Calculate SCD effect size (SMD)
ES("AB","SMD",data=read.table(file.choose(new=FALSE)))

#Calcular tamaño del efecto (PND)
ES("AB","PND +",data=read.table(file.choose(new=FALSE)))

#Extraer datos crudos por coordenadas desde una imagen (sirve para los que hacen meta-análisis)
graph.extract(MT, refX, refY, save="no", image=read.jpeg(file.choose()))
