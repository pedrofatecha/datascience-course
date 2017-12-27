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


becal1.2 <- becal1[(trimws(becal1$condicion)  == "Becario" | becal1$condicion  == "Becario retornado") & trimws(becal1$ci)  != "pendiente",]
becal1.2[,"ci"] <- gsub(",","",becal1.2$ci,fixed = T)
becal1.2[,"nrorankuni"] <- gsub('Subject o Ã¡rea: IngenierÃa civil y estructural - Puesto entre 51/100 ',"100",becal1.2$nrorankuni)
for(i in names(becal1.2)){
  becal1.2[,i] <- gsub("Ã³","o",becal1.2[,i])
  becal1.2[,i] <- gsub("Ã","i",becal1.2[,i])
  becal1.2[,i] <- gsub("¡","ca",becal1.2[,i])
  becal1.2[,i] <- gsub("i©","e",becal1.2[,i])
  becal1.2[,i] <- gsub("i±","n",becal1.2[,i])
  becal1.2[,i] <- gsub("i£","n",becal1.2[,i])
}

becal1.2$ci <- str_trim(becal1.2$ci)

fechas <- data.frame(strsplit(as.character(becal1.2$fechadeadjudicacion),' '),nrows = 914, ncol=5)
nrow(becal1.2)
str_split_fixed(as.character(becal1.2$fechadeadjudicacion),pattern = )
becal1.2[,"fechadeadjudicacion"] <- format(as.character.DateDate(becal1.2$fechadeadjudicacion),"dd/mm/yyyy")

class(becal1.2$fechadeadjudicacion)

#### Asignar una columna donde indica en que segmento del ranking

becal1.2$nrorankuni <- gsub("5 SEGÃšN ESPECIALIDAD","5",becal1.2$nrorankuni)
becal1.2$nrorankuni <- gsub("/","-",becal1.2$nrorankuni)
becal1.2[173,"nrorankuni"] <- "100"

nro_rank <- list(strsplit(becal1.2$nrorankuni,split = "/"))
becal1.2$nrorankuni <- separate_(becal1.2$nrorankuni, c("a", "b"), "/")

out <- strsplit(becal1.2$nrorankuni,"-") 
aout <- data.frame(do.call(rbind, out))
max_rank <- matrix(data=list(),nrow = nrow(aout),ncol=1)

for(i in seq_len(nrow(aout))){
  max_rank[i,1]<- max(as.integer(aout[i,1]), as.integer(aout[i,2]))
}

becal1.2$nrorankuni <- as.integer(becal1.2$nrorankuni) 


becal1.2$categoriauni <- for (i in becal1.2$nrorankuni){  
        if(as.integer(becal1.2$nrorankuni)<=10){
              ("top_10")
        }  else 
          if (as.integer(becal1.2$nrorankuni)>10 & as.integer(becal1.2$nrorankuni)<=50){
          print("top_50")
        } else 
          if (as.integer(becal1.2$nrorankuni)>50 & as.integer(becal1.2$nrorankuni)<=100) {
           print("top_100")
        } else 
          if (as.integer(becal1.2$nrorankuni)>100 & as.integer(becal1.2$nrorankuni)<=150) {
          print("top_150")
        } else 
          if (as.integer(becal1.2$nrorankuni)>150 & as.integer(becal1.2$nrorankuni)<=200) {
          print("top_200")
        } else 
          if (as.integer(becal1.2$nrorankuni)>200) {
        print("mas_200")
        }
        else 
          if (as.integer(becal1.2$nrorankuni)=="") {
          print("SIN DATO")
        }
}


becal1.2$fechadeadjudicacion <- gsub("del","-",becal1.2$fechadeadjudicacion)
becal1.2$fechadeadjudicacion <- gsub("de","-",becal1.2$fechadeadjudicacion)
becal1.2$fechadeadjudicacion <- gsub(" ","",becal1.2$fechadeadjudicacion)

for(i in becal1.2$fechadeadjudicacion){
  if(becal1.2$fechadeadjudicacion[i] == "enero"){
    becal1.2$fechadeadjudicacion[i]<-gsub("enero","01",becal1.2$fechadeadjudicacion[i])
  }  
}

becal1.2$fechadeadjudicacion<-gsub("del","-",becal1.2$fechadeadjudicacion)

becal1.2$fechadeadjudicacion<-gsub("de","-",becal1.2$fechadeadjudicacion)
becal1.2$fechadeadjudicacion<-gsub("pendiente","",becal1.2$fechadeadjudicacion)
becal1.2$fechadeadjudicacion<-gsub(" ","",becal1.2$fechadeadjudicacion)

unlis
convertir_fecha_textual = function(fecha_ad) {
  vec_meses <- c("enero", "febrero", "marzo", "abril", "mayo", "junio", "julio",
                "agosto", "septiembre", "octubre", "noviembre", "diciembre")
  fecha_list <- unlist(strsplit(fecha_ad,"-"),recursive = T)
  if (length(fecha_list) == 3) {
    dia = fecha_list[1]
    mes = grep(fecha_list[2], vec_meses)
    anho = fecha_list[3]
    return (paste(dia,'/',mes,'/',anho,sep=''))  
  } else {
    print(paste('Fecha invalida:',fecha_ad))
    return (fecha_ad)
  }
}
length(unlist(strsplit(becal1.2$fechadeadjudicacion,"-")))
becal1.2$fechadeadjudicacion <- convertir_fecha_textual(becal1.2$fechadeadjudicacion)

###Becal cobertura

becal2 <- read.csv("C:\\Users\\GERSON\\Documents\\datascience-course\\proyecto\\data\\becal-cobertura.csv",header = T, stringsAsFactors = F)

names(becal2) <- tolower(names(becal2))


names(becal2) <- gsub(".","",names(becal2),fixed = T)
becal2[,'ci'] <- gsub('.','',becal2[,'ci'],fixed = T)
names(becal2)[] <- gsub('ãº','u',names(becal2)[])
names(becal2)[] <- gsub('ï','',names(becal2)[],fixed = T)
names(becal2)[] <- gsub('totalgeneral','totalgralusd',names(becal2)[],fixed = T)
names(becal2)[names(becal2)=="no"] <- gsub('o','',names(becal2)[names(becal2)=="no"],fixed = T)
for(i in names(becal2)){
  becal2[,i] <- gsub("Ã³","o",becal2[,i])
  becal2[,i] <- gsub("Ã","i",becal2[,i])
  becal2[,i] <- gsub("¡","ca",becal2[,i])
  becal2[,i] <- gsub("i©","e",becal2[,i])
  becal2[,i] <- gsub("i±","n",becal2[,i])
  becal2[,i] <- gsub("i£","n",becal2[,i])
}
becal2[,"totalgralusd"] <- gsub('.','',becal2[,"totalgralusd"],fixed = T)

becal2$totalgralusd<-str_trim(becal2$totalgralusd)

becal2$totalgralusd<-gsub("¬","",becal2$totalgralusd)
becal2$totalgralusd<-gsub("‚","",becal2$totalgralusd)
becal2$totalgralusd<-gsub("â","€",becal2$totalgralusd)


for(i in becal2$totalgralusd){
  if(is.na(becal2$totalgralusd[i])){
    becal2$totalgralusd <- "0"
  } else{
    becal2$totalgralusd[i]<-becal2$totalgralusd[i]
  }
}


becal2$totalgralusd[grepl(pattern = "â‚¬",becal2$totalgralusd[r], fixed = T)==TRUE]

becal2$tipomon<- ''
for(i in becal2$totalgralusd){
  if(grepl(pattern = "â‚¬",becal2$totalgralusd[r])==TRUE){
    becal2$tipomon[r] <- 'euro'
  } else if (grepl(pattern = "$",becal2$totalgralusd[r], fixed = T)==TRUE){
    becal2$tipomon[r] <- 'usd'
  }  else {
    becal2$tipomon[r] <- 0
  }
}

convertir_totalgeneral = function(monto) {
  if (grepl('€',monto)) {
    monto = gsub('€', '', monto)  # eliminar signo euro
    monto = gsub(' ', '', monto)     # eliminar espacios vacios
    monto = gsub('\\.', '', monto)   # eliminar punto
    monto = gsub('\\,', '.', monto)  # remplazar coma por punto
    monto = as.numeric(monto)        # convertir a tipo numerico
    monto = round(monto)             # redondeo
    monto = round(monto * 1.17)      # convertir a dolares
    return(monto)
  }  else {
    monto = gsub('\\$', '', monto)  # eliminar signo dolar
    monto = gsub('\\.', '', monto)   # eliminar punto
    monto = gsub(' ', '', monto)     # eliminar espacios vacios
    monto = gsub('\\,', '.', monto)  # remplazar coma por punto
    monto = as.numeric(monto)        # convertir a tipo numerico
    monto = round(monto)
    return(monto)
  }
}

convertir_totalgeneral(becal2$totalgralusd)

for(i in becal2$totalgralusd){
      if(grepl(pattern = "€",becal2$totalgralusd[i])){
        becal2$totalgralusd[i] <- gsub('€','',becal2$totalgralusd[i])
        becal2$totalgralusd[i] <- as.numeric(becal2$totalgralusd[i])*1.17  
      } else 
        if (grepl(pattern = "€",becal2$totalgralusd[i])) {
        becal2$totalgralusd[i] <- gsub('$','',becal2$totalgralusd[i])
        becal2$totalgralusd[i] <- as.numeric(becal2$totalgralusd[i])
        }  else {
          becal2$totalgralusd[i]<-0
      }
}
becal2$totalgralusd[] <- gsub('$','',becal2$totalgralusd[])






becal2[,"totalgralusd"] <- gsub('â‚¬','',becal2[,"totalgralusd"],fixed = T)
becal2[,"totalgralusd"] <- gsub('$','',becal2[,"totalgralusd"],fixed = T)
becal2[,"totalgralusd"] <- gsub('NA','',becal2[,"totalgralusd"],fixed = T)  
becal2.1 <- subset(becal2, becal2$ci !="" ,all())
becal2.1[,"totalgralusd"] <- gsub('.','',becal2.1[,"totalgralusd"],fixed = T)
becal2.1$ci <- trim(becal2.1$ci)

becal2.1$totalgralusd[] <- trim(becal2.1$totalgralusd[])

becal2.1$totalgralusd <- strtoi(becal2.1$totalgralusd)

class(becal2.1$totalgralusd)

becal2[,"totalgralusd"] <- as.numeric(becal2[,"totalgralusd"])

print(summary(becal2$pais))

grouping(becal2$pais)
countLines(becal2$pais)


##merge datasets

names(becal1.2)
names(becal2.1)

ambos_becal = merge(becal1.2, becal2.1, by.x="ci", by.y="ci", all.y = T)

