#Cargar los archivos de datos de train y test: 
data_train<-read.csv("../csv_original/train.csv", header=T, sep=",")
data_test<-read.csv("../csv_original/test.csv", header=T, sep=",")

head(data_train)
head(data_test)
