becal1 <- read.csv("C:\\Users\\GERSON\\Documents\\datascience-course\\proyecto\\data\\becal2017.csv",header = T, stringsAsFactors = F)
library(R.utils)
library(dplyr)
library(stats)
library(stringr)
library(tidyr)
library(ggplot2)
library(stringi)


names(becal1) <- tolower(names(becal1))


names(becal1)[names(becal1)=="nivel.socioeconã³mico"] <- gsub('ã','a',names(becal1)[names(becal1)=="nivel.socioeconã³mico"])

names(becal1)[] <- gsub('ã','a',names(becal1)[])
names(becal1)[] <- gsub('âº','',names(becal1)[])
names(becal1)[] <- gsub('a³','o',names(becal1)[])
names(becal1)[] <- gsub('aº','u',names(becal1)[])
names(becal1)[] <- gsub('Ã³','o',names(becal1)[])
names(becal1)[] <- gsub(".", '',names(becal1),fixed = T)
names(becal1)[names(becal1)=="nivel.socioeconã³mico"] <- gsub('ã','a',names(becal1)[names(becal1)=="nivel.socioeconã³mico"])
names(becal1)[names(becal1)=="paa.s.de.destino"] <- gsub('paa.s.de.destino',"paisdedestino",names(becal1)[names(becal1)=="paa.s.de.destino"])
names(becal1)[names(becal1)=="tipo.de.beca..segun.programa.aprobado"] <- gsub('tipo.de.beca..segun.programa.aprobado',"tipodebecasegunprogramaaprobado",names(becal1)[names(becal1)=="tipo.de.beca..segun.programa.aprobado"])
names(becal1)[names(becal1)=="n"] <- gsub("n","nroreg",names(becal1)[names(becal1)=="n"])
names(becal1)[names(becal1)=="n1"] <- gsub("n1","nroconv",names(becal1)[names(becal1)=="n1"])
names(becal1)[names(becal1)=="n2"] <- gsub("n2", 'nrorankuni',names(becal1)[names(becal1)=="n2"])
names(becal1)[names(becal1)=="n3"] <- gsub("n3", 'nrorankcur',names(becal1)[names(becal1)=="n3"])


becal1.2 <- becal1[(str_trim(becal1$condicion)  == "Becario" | becal1$condicion  == "Becario retornado") & trimws(becal1$ci)  != "pendiente" & trimws(becal1$fechadeadjudicacion)!= "pendiente",]
becal1.2[,"ci"] <- gsub(",","",becal1.2$ci,fixed = T)
becal1.2[,"nrorankuni"] <- gsub('Subject o Ã¡rea: IngenierÃa civil y estructural - Puesto entre 51/100 ',"100",becal1.2$nrorankuni)
for(i in names(becal1.2)){
  becal1.2[,i] <- gsub("Ã³","o",becal1.2[,i])
  becal1.2[,i] <- gsub("Ã","i",becal1.2[,i])
  becal1.2[,i] <- gsub("¡","ca",becal1.2[,i])
  becal1.2[,i] <- gsub("i©","e",becal1.2[,i])
  becal1.2[,i] <- gsub("i±","n",becal1.2[,i])
  becal1.2[,i] <- gsub("i£","n",becal1.2[,i])
  becal1.2[,i] <- gsub("iº","u",becal1.2[,i])
  becal1.2[,i] <- gsub("i‘","N",becal1.2[,i])
  becal1.2[,i] <- gsub('â€',"",becal1.2[,i])
}


becal1.2$ci <- str_trim(becal1.2$ci)
becal1.2$maestraadoctorado <- gsub("\n","",becal1.2$maestraadoctorado)

#### Asignar una columna donde indica en que segmento del ranking

becal1.2$nrorankuni <- gsub("5 SEGÃšN ESPECIALIDAD","5",becal1.2$nrorankuni)
becal1.2[173,"nrorankuni"] <- "100"

becal1.2$fechadeadjudicacion <- gsub("del","-",becal1.2$fechadeadjudicacion)
becal1.2$fechadeadjudicacion <- gsub("de","-",becal1.2$fechadeadjudicacion)
becal1.2$fechadeadjudicacion <- gsub(" ","",becal1.2$fechadeadjudicacion)

is.na(becal1.2$fechadeadjudicacion)


for(i in 1:841){
  becal1.2[i,5]= convertir_fecha_textual(fecha_ad = becal1.2[i,5])
}

Tomar_max_cat= function(campo,parametro){
  campo= gsub('-','/',campo)
  campo_v= unlist(strsplit(campo,parametro))
  campo_v=as.character(max(as.numeric(campo_v),na.rm = T))
}

for(i in 1:841 ){
  
  becal1.2$nrorankuni[i]<-Tomar_max_cat(campo = becal1.2$nrorankuni[i],parametro = '/')
  
}

categoria_por_orden= function(rank){
  if(as.numeric(rank)>0 & as.numeric(rank)<=10){
    rank_orden='top_10'
    return(rank_orden)
  }else 
    if(as.numeric(rank)>10 & as.numeric(rank)<=50){
      rank_orden='top_50'
      return(rank_orden)
    }else 
      if(as.numeric(rank)>50 & as.numeric(rank)<=100){
        rank_orden='top_100'
        return(rank_orden)
      }else 
        if(as.numeric(rank)>100 & as.numeric(rank)<=150){
          rank_orden='top_150'
          return(rank_orden)
        }else 
          if(as.numeric(rank)>150 & as.numeric(rank)<=200){
            rank_orden='top_200'
            return(rank_orden)
          }  else
            if(rank=='Inf'|rank==''|as.numeric(rank)==0){
              rank_orden='sin dato'
              return(rank_orden)
            }else
              if(as.numeric(rank)>200){
                rank_orden='mas_200'
                return(rank_orden)
                }
              
}

for(i in 1:as.numeric(NROW(becal1.2$nrorankuni))){
  becal1.2$categoriauni[i] <- categoria_por_orden(rank=becal1.2$nrorankuni[i])  
}
for(i in 1:as.numeric(NROW(becal1.2$tipodebecasegunprogramaaprobado)) ){
  becal1.2$tipodebecasegunprogramaaprobado[i]<-normalizar_texto(texto = becal1.2$tipodebecasegunprogramaaprobado[i])
}

search_studio= function(estu){
  t=c('maestria_academica','maestria_profesional','Doctorado')
  w=(unlist(x=strsplit(estu,' ')))
  if('profesionales'%in% w){
    return(t[2])
  }else
    if('doctorado'%in% w){
      return(t[3])  
    }else{
      return(t[1])
    }
}
for(i in 1:as.numeric(NROW(becal1.2)) ){
  becal1.2$tipodebecasegunprogramaaprobado[i]<-normalizar_texto(texto = becal1.2$tipodebecasegunprogramaaprobado[i])
}




becal1.2[,"ci"] <- as.numeric(becal1.2[,"ci"])


###Becal cobertura

becal2 <- read.csv("C:\\Users\\GERSON\\Documents\\datascience-course\\proyecto\\data\\becal-cobertura.csv",header = T, stringsAsFactors = F)

names(becal2) <- tolower(names(becal2))


names(becal2) <- gsub(".","",names(becal2),fixed = T)
becal2[,'ci'] <- gsub('.','',becal2[,'ci'],fixed = T)
names(becal2)[] <- gsub('ãº','u',names(becal2)[])
names(becal2)[] <- gsub('ï','',names(becal2)[],fixed = T)
names(becal2)[] <- gsub('totalgeneral','totalgralusd',names(becal2)[],fixed = T)
names(becal2)[names(becal2)=="no"] <- gsub('o','',names(becal2)[names(becal2)=="no"],fixed = T)
for(i in 1:as.numeric(NCOL(becal2))){
  becal2[,i] <- gsub("Ã³","o",becal2[,i])
  becal2[,i] <- gsub("Ã","i",becal2[,i])
  becal2[,i] <- gsub("¡","ca",becal2[,i])
  becal2[,i] <- gsub("i©","e",becal2[,i])
  becal2[,i] <- gsub("i±","n",becal2[,i])
  becal2[,i] <- gsub("i£","n",becal2[,i])
  becal2[,i] <- gsub("i£","n",becal2[,i])
  becal2[,i] <- gsub("iº","u",becal2[,i])
  becal2[,i] <- gsub("i‘","N",becal2[,i])
  becal2[,i] <- gsub("-","",becal2[,i])
  becal2[,i] <- gsub("â€“","",becal2[,i])
}

becal2[,"totalgralusd"] <- gsub('.','',becal2[,"totalgralusd"],fixed = T)


becal2$totalgralusd<-gsub("¬","",becal2$totalgralusd)
becal2$totalgralusd<-gsub("‚","",becal2$totalgralusd)
becal2$totalgralusd<-gsub(" ","",becal2$totalgralusd)
becal2$totalgralusd<-gsub("â","€",becal2$totalgralusd)


for(i in 1:as.numeric(NROW(becal2$totalgralusd))){
  becal2$totalgralusd[i] <- convertir_totalgeneral(monto = becal2$totalgralusd[i])  
}

normalizar_texto = function(texto) {
  texto = tolower(texto)  # pasar texto a minusculas
  texto = stri_trans_general(texto, 'latin-ascii')  # remover acentos
  #texto = gsub('[^a-z\\s]', '', texto)  # remover caracteres no alfabeticos excepto espacio
  texto = str_trim(texto) # elimina espacios vacios de adelante y atrás
  return (texto)
}
for(i in 1:as.numeric(NROW(becal2$tipodebecasegunprogramaaprobado)) ){
  becal2$tipodebecasegunprogramaaprobado[i]<-normalizar_texto(texto = becal2$tipodebecasegunprogramaaprobado[i])
}

becal2.1 <- subset(becal2, becal2$ci !="" ,all())

becal2.1$totalgralusd[] <- trim(becal2.1$totalgralusd[])



##merge datasets

names(becal1.2)
names(becal2.1)

ambos_becal = merge(becal1.2, becal2.1, by.x="ci", by.y="ci", all.x = T)

becal_completo<-ambos_becal[complete.cases(ambos_becal),]


write.csv(x =becal_completo ,file = "becal_completo.csv",row.names = F)

