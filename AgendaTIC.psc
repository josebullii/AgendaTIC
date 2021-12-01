Funcion opc <- pintaMenu()
	
	Definir opc como Entero;
	opc = 0;
	
	Repetir
		Escribir "*****************************";
		Escribir "Escribir 1 - Añadir contacto";
		Escribir "Escribir 2 - Borrar contacto";
		Escribir "Escribir 3 - Editar contacto";
		Escribir "Escribir 4 - Buscar contacto";
		Escribir "Escribir 5 - Salir";
		Escribir "*****************************";
		
		Escribir "Seleccione una opción";
		Leer opc;
	Hasta Que ((opc >= 1) y (opc <= 5))
	
FinFuncion

SubProceso inicializarVectores(vNombres, vNumeros, tam)
	Definir i Como Entero;
	
	Para i = 0 Hasta tam - 1 Con Paso 1 Hacer
		vNombres[i] = "x";
		vNumeros[i] = "x";
	Fin Para
	
FinSubProceso

Funcion pos <- buscarhueco(vNombres, tam)
	Definir i, pos Como Entero;
	
	Para i = 0 Hasta tam - 1 Con Paso 1 Hacer 
		
		Si vNombres[i] == "x" Entonces
			pos = i;
			i = tam;
		FinSi
		
	FinPara
	
	
FinFuncion

Algoritmo AgendaTIC
	
	Definir opc, tam como Entero;
	Definir vNombres, vNumeros, x Como Caracter;
	tam = 10;
	opc = pintaMenu();
	Dimension vNombres[tam];
	Dimension vNumeros[tam];
	
	Escribir opc;
	
	inicializarVectores(vNombres, vNumeros, tam);
	pos = buscarhueco();
	
	Mientras opc <> 5 Hacer
		
		Segun opc Hacer
			1: 
				Escribir "OPCIÓN 1";
			2: 
				Escribir "OPCIÓN 2";
			3: 
				Escribir "OPCIÓN 3";
			4:
				Escribir "OPCIÓN 4";
		FinSegun
		
		opc = pintaMenu();
	FinMientras
	
FinAlgoritmo
