v<-c()
nu=c(0.5,0.6)
l1=c(TRUE,FALSE,TRUE)
l2 <- c(T,F)
ch=c('a')
it=9:29
co=c(1+0i,2+4i)
K=vector('numeric',10)
K[1]=5
print(K)
h=c(1.5,'a')
h
y=c(FALSE,2)
y
O = c('A',TRUE)
O
x=0:6
class(x)
x= as.numeric(x)
x
class(x)
x=as.logical(x)
x
x=as.character(x)
x
x=c('a','b','c')
x=as.numeric(x)
x
x=as.logical(x)
x
m=matrix(1:6,nrow=2, ncol=3)
m
dim(m)
m[2,1]
m[2,3]
x=1:3
y=10:12
z=cbind(x,y)
z
z=rbind(x,y)
z
x=list(1,TRUE,1+4i)
x
x=list(1:20,c(TRUE,FALSE),c(1+4i,1+3i))
x
x[1]
x[2]
x[3]
x[[1]]
x[[2]]
x[[1]]
x=factor(c('yes','no','yes','no','yes','no'))
x
table(x)
x = factor(c('yes', 'yes', 'no', 'yes', 'no'), levels=c('yes', 'no'))
x
x = factor(c(1,2,3,4,5), levels=c(5,4,3,2,1))
x
x=c(1,2,NA,10,3)
is.na(x)
x=c(1,2,NA,10,3)
is.nan(x)
x=data.frame(c1=1:5, c2 = c(T, T, F, F, T), c3 = c('a', 'b', 'c', 'd', 'e'))
x
nrow(x)
ncol(x)
dim(x)
names(x)
if(3<2){
  print('true')
  
}else{
  print('false')
}
x=2
y=0
if(x>3){
  y=10
}else{
  y=50
}
y
x=10
if(x==10){
  print('El valor de x es el esperado')
}
x=data.frame(c1=4:6,c2=18:20)
for(i in seq_len(nrow(x))){
  print(x[i,'c1'])
  print(x[i,2])
}
apply(x,2,median)
for(i in seq_len(nrow(x))){
  print(x[i,'c1'])
  print(x[i,2])
}

min(x)
max(x)
apply(x,1,FUN = median)
apply(x,3,FUN=median)

p<-data.frame(c1=1:2,c2=10:11)
p
mult= function(x){
  return(x*5)
}
apply(p,2,mult)

apply(p,1,sort)

summmm<-function(x){
  return(sum(x[1:2]))
}
p
apply(p,2,summmm)

multi_var<- function(x,a,b,c){
  return((x^a)+b+c)
}

apply(p,2,multi_var,5,6,9)

cia <- function(r){
  return(3.14*(r^2))
}


sapply(x[,'c1'],cia)
sapply(x[,1],cia)

cia_2 <- function(r,c){
  return(c*(r^2))
}

u<-ncol(sapply(x[,1],cia_2,3.14))
u

j<-data.frame(c1=1:10,c2=1:10)
j

rowsum(j,row) ##VER EJEMPLOS
colSums(j)

data_1 <- read.csv(file = 'becal-cobertura.CSV',header = T,stringsAsFactors = F)

data_1


write.csv(data_1,file = 'becal-cobertura_2.CSV',row.names=F)


str(data_1,vec.len=1)

autos=mtcars

hist(autos$mpg,col='red',main='Distribucion millas por galon',xlab ='Millas por galon', ylab='Frecuencia')

boxplot(autos$disp,col='green', ylab='Caballos de fuerza')

barplot(autos$am,col='green',xlab = 'tipo de transmision',main = 'Nro de vehiculos por tipo de transmision')



plot(presidents)

plot(autos$mpg,autos$wt,xlab='Millas por galon', ylab='peso (libras)',main='relacion de vars')

x = data.frame('var1'=sample(1:3),'var2'=sample(6:8),'var3'=sample(11:13))
x[(x>=2&x<=12),]
x
x[1:3,1:3]
sort(x$var1,decreasing = T)

becal_2017<- read.csv(file='becal2017.csv',header = T,stringsAsFactors = F)

becal_2017[1:5,'Sexo']

tolower(becal_2017$Sexo)[1:5]
toupper(becal_2017$Sexo)[1:5]
becal_2017[,'Sexo']= tolower(becal_2017$Sexo)

histo <- hist(as.integer(becal1.2$edad), main=paste("Distribución de becarios por edad (n=",nrow(becal1.2),")"), 
     ylab="Frecuencia", xlab="Edad", col = "red", xlim = c(20,50))

summary(as.integer(becal1$edad))


quantile(as.integer(becal1.2$edad))
quantile(as.integer(becal1.2$edad),na.rm = T, probs = c(0.40,0.65,0.90))

boxplot(as.integer(becal1$edad), col='red', main='Distribución de edad de becarios', 
        ylab='Edad')
becal1$edad<-as.integer(becal1$edad)
becal1$edad<-as.integer(becal1$edad)


var(as.integer(becal1$edad),na.rm = T) ###varianza na.rm es un parametro para decir que remueva los valores NA
sd(as.integer(becal1$edad),na.rm = T)

table(becal1$nrorankuni)

barplot(table(becal1$ranking),
        main=paste("Becarios por rango de ranking de universidad (n=",nrow(becal1),")"), 
        ylab="Total", xlab="Rango de ranking", col="blue")

barplot(table(becal1.2$nrorankuni),
        main=paste("Becarios por rango de ranking de universidad (n=",nrow(becal1),")"), 
        ylab="Total", xlab="Rango de ranking", col="blue")

barplot(table(becal1.2$paisdedestino),
        main=paste("Becarios por rango de ranking de universidad (n=",nrow(becal1),")"), 
        ylab="Total", xlab="Rango de ranking", col="blue")

becal_limpio = subset(becal1, becal1$ranking != " ") # elimina los registros "sin dato"
dis_paidedestino = table(droplevels(as.factor(becal_limpio$ranking)))
categoria_ordenadas = sort(dis_paidedestino, decreasing = T)  # ordena las categorias de mayor a menor
barplot(categoria_ordenadas, main=paste("Becarios por rango de ranking de universidad (n=",
                                        nrow(becal_limpio),")"), ylab="Total", xlab="Rango de ranking", col="blue")


plot(ambos_becal$mesesdeduraciondeestudios, ambos_becal$totalgralusd, 
     ylab="Costo Total en USD", xlab="Duración Estudio en Meses",
     main="Meses de Duración por Costo de Estudio")


groupo_meses = group_by(ambos_becal, mesesdeduraciondeestudios)
total_x_gm = summarize(groupo_meses, 
                       total_mean = mean(totalgralusd))
plot(total_x_gm$mesesdeduraciondeestudios, total_x_gm$total_mean, 
     ylab="Costo Total Promedio en USD", xlab="Duración Estudio en Meses",
     main="Meses de Duración por Costo de Estudio")

cor(as.numeric(ambos_becal$mesesdeduraciondeestudios),ambos_becal$totalgralusd,na)


