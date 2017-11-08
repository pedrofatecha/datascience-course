# Data Science con Impacto Social - pedrofatecha

Curso práctico sobre la ciencia de los datos y su aplicación al estudios de fenómenos sociales mediante el uso de _**datos abiertos**_ por el gobierno nacional. El curso ofrece una introducción a las principales conceptos, técnicas, y herramientas necesarios para extraer conocimiento de los datos. En el curso se aprenderá a colectar y pre-procesar datos, plantear preguntas de investigación, responder a estas preguntas, y visualizar los resultados.

## Objetivos

1. Aprender los conceptos básicos sobre ciencia y análisis de datos
2. Aprender y aplicar técnicas para la obtención y pre-procesamiento de datos en bruto
3. Aplicar herramientas estadísticas básicas para el análisis exploratorio de datos
4. Aprender y aplicar técnicas de inferencia estadística que permitan derivar conclusiones a partir de muestras de datos
5. Aprender y aplicar técnicas de aprendizaje supervisado que permitan explorar relaciones en los datos y derivar predicciones

## Requisitos

* Experiencia en programación orientada a objetos. Obs. __Para alumnos de Ing. Informática de la UC, haber aprobado la asignatura Lenguaje de Programación II__
* Conocimientos básicos de estadística (distribución normal, promedio, mediana, modo, varianza, desviación estándard, estadarización) Obs. __Para alumnos de Ing. Informática de la UC, haber aprobado la asignatura Estadística__

 ## Datos del Curso

* __Inicio__: 24-10-2017
* __Finalización__: 12-12-2017
* __Limite de Inscripción__: 20-10-2017
* __Modalidad__: Presencial (8 clases de 3 horas por semana)
* __Lugar__: Facultad de Ciencias y Tecnología, Universidad Católica “Nuestra Señora de la Asunción”, Campus Santa Librada, Asunción
* __Día y hora de Lección__: Martes de 9:00 a 12:00
* __Dedicación y créditos__: 2 créditos por asistencia y presentación de trabajos prácticos. Se podrán considerar créditos adicionales con la continuidad del proyecto posterior a la culminación de la materia, que derive en artículos científicos publicables en conferencias internacionales

## Inscripción

Completar el formulario de inscripción al curso [aquí](https://goo.gl/forms/tOsDDGlfnqG3Yb0r2)

## Tópicos

1. Introducción a la ciencia de los datos y base teórica
2. Herramientas para análistas y científicos de datos
3. Colección y pre-procesamiento de datos
4. Análisis Exploratorio de datos
5. Inferencia Estadística
6. Aprendizaje supervisado

## Proyecto Becal

* Becas destinadas a egresados de una carrera con el fin de llevar a cabo sus estudios de especialización (maestrías o doctorados en un país extranjero). El principal desafío de BECAL es mejorar la oferta del capital humano avanzado, mediante el financiamiento de becas de estudios de entrenamiento docente y postgrados en centros de excelencia del exterior. El mismo, tiene por objetivo contribuir a aumentar los niveles de generación y aplicación de conocimiento en las áreas de Ciencias y Tecnología (CyT) y en los niveles de aprendizaje en la educación. El principal problema a ser abordado por este programa es la baja capacidad del país para generar y aplicar conocimiento requerido para el desarrollo. [Link fuente de informacion](http://www.becal.gov.py/)

## Data 1: __becal2017__

 CAMPOS	         											CONTENIDO	               																	tipo de dato
1. N=	      												Numero de becario	       																(numerico/discreto)
2. Condicion = 												Estado en que se cuentra el Becario														(caracter/string)
3. N = 														Numero de becario																		(numerico/discreto)
4. Tipo de Convocatoria= 									A que llamado accedio a la beca															(caracter/string)
5. Fecha de adjudicacion= 									Fecha en que el becario accedio a ser beneficiario de la Beca							(caracter/string)
6. C.I. = 													Numero de Documento de identidad del becario											(numerico/discreto)
7. Sexo	=													Genero del becario																		(caracter/string)
8. Edad	=													Edad del Becario						 												(numerico/discreto)
9. Funcionario Publico (Institucion)=						indica si el becario proviene de una institucion publica								(caracter/string)
10. Cargo=													El cargo que mantiene el cliente														(caracter/string)
11. Goce de Sueldo=											Indica si el becario, en el caso que el mismo sea un funcionario  						(caracter/string)
															publico sigue percibiendo el sueldo	
12. Tipo de Beca (segun Programa aprobado)=	 				Indica el grado academico del curso que realizara										(caracter/string)
13. Area de la ciencia=										Indica el area de conocimiento de interes del becario									(caracter/string,categorico)
14. Disciplina=												Indica el area especifica de conocimiento de su area									(caracter/string,categorico)
15. Sector priorizado Conacyt=								Indica La categorizacion del area de la conacyt											(caracter/string,categorico)
16. Subsector priorizado=									Indica el sub sector de area de conocimiento con referencia al  Sector priorizado Conacyt	(caracter/string,categorico)
17. MaestrÃ­a / Doctorado=									Indica cual es la titulacion del curso de Post-graduacion								(caracter/string)
18. Universidad de Destino= 								Indica la universidad donde se realizara el curso										(caracter/string)
19. Ranking = 												Indica al  Ranking mundial al en el que se encuentra									(caracter/string)
20. Nº=														Indica el Rank de acuerdo al Ranking mundial donde se encuentra							(Numerico/discretos)
21. Ranking de Area Especifica=								Indica el Ranking al que pertenece segun el area de conocimiento						(caracter/string)
22. N=º														Indica el Rank en que se encuentra														(Numerico/discretos)
23. Ciudad de destino (en espacial)=						Indica la ciudad en que el Becario realizara sus estudios								(caracter/string)
24. Pais de Destino	=										Indica el Pais donde se encuentra la ciudad de destino									(caracter/string)
25. Meses de duracion de estudios=							Indica el Tiempo de duracion del curso													(Numerico/discretos)
26. Inicio (cobertura de beca) 	=							Fecha en que comienza la cobertura de la Beca											(caracter/string)
27. Fin (cobertura de beca)=								Fecha en que Finaliza la cobertura de la Beca											(caracter/string)
28. Ciudad de Origen=    									La Ciudad de donde es el Becario														(caracter/string)
29. Departamento de Origen=									El departamento de la ciudad del Becario												(Numerico/discretos)
30. Ciudad de Residencia=									La Ciudad donde el Becario vive															(caracter/string)
31. Departamento de Residencia=								El departamento de la ciudad donde vive del Becario										(caracter/string)
32. Nivel socioeconomico=									Indica la clase socioeconomica del Becario												(Numerico/discretos,categorico)
33. Tiempo de cobertura=									Indica El codigo del tipo de cobertura que recibira el Becario							(caracter/string,categorico)
34. Contrato Nº=											Indica el Numero de contrato firmado por el Becario										(caracter/string,categorico)
35. Fecha firma de Contrato=								Indica la fecha en que el becario firma el contrato										(caracter/string)
36. Fecha firma de Adenda=									Indica la fecha en que se firma una adenda del contrato en el caso que aplique			(caracter/string)


##Data 2: __becal2017__

 CAMPOS	         											CONTENIDO	               																	tipo de dato

1. N	      												Numero de becario	       																(numerico/discreto)
2. C.I. 													Numero de Documento de identidad del becario											(numerico/discreto)
3. Nombre y Apellido=										Indica el Nombre y Apellido del becario													(caracter/string)
4. Tipo de Beca (segun Programa aprobado)=	 				Indica el grado academico del curso que realizara										(caracter/string)
5. Maestria / Doctorado=									Indica cual es la titulacion del curso de Post-graduacion								(caracter/string)
6. Universidad de Destino= 									Indica la universidad donde se realizara el curso										(caracter/string)
7. Pais=  													Indica el Pais donde se encuentra la ciudad de destino									(caracter/string)
8. Departamento de Origen=									El departamento de la ciudad del Becario												(Numerico/discretos)
9. Total General=											Indica el Monto con que el becario sera beneficiado										(Numerico/continuo)

