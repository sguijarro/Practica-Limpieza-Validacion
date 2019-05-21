#Cargamos los archivos de datos de train, test y gender_submission: 
data_train<-read.csv("../csv_original/train.csv", header=T, sep=",")
data_test_original<-read.csv("../csv_original/test.csv", header=T, sep=",")
data_real<-read.csv("../csv_original/gender_submission.csv", header=T, sep=",")

#Exploramos los datos de los tres ficheros:
str(data_train)
str(data_test_original)
str(data_real)

#Integración: uniremos los datasets de train.csv y gender_submission.csv a uno solo llamado data_test:
data_test<-merge(data_test_original, data_real, by.x="PassengerId", by.y="PassengerId")
str(data_test)

#Cambiamos los tipos de los datos en r a los adecuados, para los dos conjuntos de datasets:
data_train$Survived<-as.factor(data_train$Survived)
data_train$Pclass<-as.factor(data_train$Pclass)

data_test$Survived<-as.factor(data_test$Survived)
data_test$Pclass<-as.factor(data_test$Pclass)

str(data_train)
str(data_test)

#Selección: 
#Las variables de tipo factor, que son variables cualitativas que pueden tomar pocos valores, se representarán visualmente mediante diagramas de barras:
colors=c("orange","blue","green", "purple")
barplot(prop.table(table(data_train$Pclass)),col=colors,main="Pclass")
barplot(prop.table(table(data_train$Sex)),col=colors,main="Sex")
barplot(prop.table(table(data_train$Embarked)),col=colors,main="Embarked")

#Las variables de tipo integer, que son variables cuantitativas discretas que no toman demasiados valores, se representarán visualmente mediante diagramas de barras:
#install.packages("rainbow")#paleta de colores
library("rainbow") 
colors=rainbow(40)
barplot(prop.table(table(data_train$SibSp)),col=colors,main="SibSp")
barplot(prop.table(table(data_train$Parch)),col=colors,main="Parch")

#Las variables de tipo numeric, que son variables cuantitativas continuas, se representarán visualmente mediante histogramas:
hist(data_train$Age,col=colors)
hist(data_train$Fare,col=colors)

#Valores perdidos:
colSums(is.na(data_train))
colSums(data_train=="")

#Valores extremos: