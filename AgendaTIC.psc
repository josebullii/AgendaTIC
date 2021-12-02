Funcion opc <- pintaMenu()
	
	Definir opc como Entero;
	opc = 0;
	
	Repetir
		Escribir "*****************************";
		Escribir "Escribir 1 - A�adir contacto";
		Escribir "Escribir 2 - Borrar contacto";
		Escribir "Escribir 3 - Editar contacto";
		Escribir "Escribir 4 - Buscar contacto";
		Escribir "Escribir 5 - Ver todos los contactos";
		Escribir "Escribir 6 - Salir";
		Escribir "*****************************";
		
		Escribir "Seleccione una opci�n";
		Leer opc;
	Hasta Que ((opc >= 1) y (opc <= 6))
	
FinFuncion

SubProceso inicializarVectores(vNombres, vNumeros, tam)
	Definir i Como Entero;
	
	Para i = 0 Hasta tam - 1 Con Paso 1 Hacer
		vNombres[i] = "x";
		vNumeros[i] = "x";
	Fin Para
	
FinSubProceso

//Devuelve -1 si no encuentra hueco, sino, 1� posici�n libre
Funcion pos <- buscarhueco(vNombres, tam)
	Definir i, pos Como Entero;
	pos = -1;
	
	Para i = 0 Hasta tam - 1 Con Paso 1 Hacer 
		
		Si vNombres[i] == "x" Entonces
			pos = i;
			i = tam;
		FinSi
		
	FinPara
	
	
FinFuncion

SubProceso a�adirContacto (vNombres, vNumeros,tam)
	Definir pos como Entero;
	pos = buscarhueco(vNombres, tam);
	
	Si (pos <> -1) Entonces
		Escribir "Dime el nombre";
		Leer vNombres[pos];
		Escribir "Dime el n�mero de tel�fono";
		Leer vNumeros[pos];
	SiNo
		Escribir "La agenda esta llena";
	FinSi
	
	
FinSubProceso

//Buscar un nombre que me da el usuario en el vector de vNombres. Devolver la posici�n y si no lo encuentro -1
Funcion pos <- buscarContacto (vNombres, vNumeros, tam)
	Definir i, pos Como Entero;
	Definir nombre Como Caracter;
	pos = -1;
	
	Escribir "Dime un nombre o un telefono";
	Leer nombre;
	
	nombre = Minusculas(nombre);
	
	Para i = 0 hasta tam -1 Con Paso 1 Hacer
		Si (Minusculas(vNombres[i]) == nombre) o (vNumeros[i] == nombre) Entonces
			//Escribir vNombres[i];
			pos = i;
			i = tam;
		FinSi
	FinPara
FinFuncion

Subproceso verTodos (vNombres, vNumeros, tam)
	Definir i como Entero;
	
	Para i = 0 hasta tam - 1 con paso 1 hacer
		Si vNombres[i] <> "x" Entonces
			Escribir vNombres[i] " - " vNumeros[i];
		FinSi
		
	FinPara
	
FinSubProceso





Algoritmo AgendaTIC
	
	Definir opc, tam,pos como Entero;
	Definir vNombres, vNumeros, x Como Caracter;
	tam = 10;
	opc = pintaMenu();
	Dimension vNombres[tam];
	Dimension vNumeros[tam];
	
	Escribir opc;
	
	inicializarVectores(vNombres, vNumeros, tam);
	
	
	Mientras opc <> 6 Hacer
		
		Segun opc Hacer
			1: 
				a�adirContacto(vNombres, vNumeros, tam);
			2: 
				Escribir "OPCI�N 2";
			3: 
				Escribir "OPCI�N 3";
			4:
				pos = buscarContacto(vNombres, vNumeros, tam);
				Si pos == -1 Entonces
					Escribir "No encontrado";
				SiNo
					Escribir vNombres[pos] " - " vNumeros[pos];
				FinSi
				
			5:
				verTodos(vNombres, vNumeros, tam);
		FinSegun
		
		opc = pintaMenu();
	FinMientras
	
FinAlgoritmo
