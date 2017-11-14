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