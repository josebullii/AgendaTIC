Funcion opc <- pintaMenu()
	
	Definir opc como Entero;
	opc = 0;
	
	Repetir
		Escribir "*****************************";
		Escribir "Escribir 1 - Añadir contacto";
		Escribir "Escribir 2 - Borrar contacto";
		Escribir "Escribir 3 - Editar contacto";
		Escribir "Escribir 4 - Buscar contacto";
		Escribir "Escribir 5 - Ver todos los contactos";
		Escribir "Escribir 6 - Salir";
		Escribir "*****************************";
		
		Escribir "Seleccione una opción";
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

//Devuelve -1 si no encuentra hueco, sino, 1º posición libre
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

SubProceso añadirContacto (vNombres, vNumeros,tam)
	Definir pos como Entero;
	pos = buscarhueco(vNombres, tam);
	
	Si (pos <> -1) Entonces
		Escribir "Dime el nombre";
		Leer vNombres[pos];
		Escribir "Dime el número de teléfono";
		Leer vNumeros[pos];
	SiNo
		Escribir "La agenda esta llena";
	FinSi
	
	
FinSubProceso

//Buscar un nombre que me da el usuario en el vector de vNombres. Devolver la posición y si no lo encuentro -1
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

Funcion posBorra <- borrarContacto (vNombres, vNumeros, tam)
	Definir i, posBorra Como Entero;
	Definir nombre Como Caracter;
	posBorra = -1;
	
	Escribir "Dime un nombre";
	Leer nombre;
	
	nombre = Minusculas(nombre);
	
	Para i = 0 hasta tam -1 Con Paso 1 Hacer
		Si (Minusculas(vNombres[i]) == nombre) o (vNumeros[i] == nombre) Entonces
			vNombres[i] = "";
			vNumeros[i] = "";
			posBorra = i;
			i = tam;
			Escribir "El contacto " nombre " ha sido eliminado";
		FinSi
	FinPara
	
FinFuncion

Funcion posEdit <- editarContacto (vNombres, vNumeros, tam)
	Definir i, pos Como Entero;
	Definir nombre, nuevonombre, nuevonumero Como Caracter;
	pos = -1;
	
	Escribir "Dime un nombre o un telefono";
	Leer nombre;
	
	nombre = Minusculas(nombre);
	
	Para i = 0 hasta tam -1 Con Paso 1 Hacer
		Si (Minusculas(vNombres[i]) == nombre) o (vNumeros[i] == nombre) Entonces
			Escribir "Escribe el nuevo nombre del contacto";
			Leer nuevonombre;
			Escribir "Escribe el nuevo número del contacto";
			Leer nuevonumero;
			vNombres[i] = nuevonombre;
			vNumeros[i] = nuevonumero;
			Escribir nombre " ha cambiado a " vNombres[i] " / " vNumeros[i];
		FinSi
	FinPara
FinFuncion

Algoritmo AgendaTIC
	
	Definir opc, tam, pos, posBorra, posEdit como Entero;
	Definir vNombres, vNumeros, x Como Caracter;
	tam = 10;
	opc = pintaMenu();
	Dimension vNombres[tam];
	Dimension vNumeros[tam];
	
	inicializarVectores(vNombres, vNumeros, tam);
	
	Mientras opc <> 6 Hacer
		
		Segun opc Hacer
			1: 
				añadirContacto(vNombres, vNumeros, tam);
			2: 
				posBorra <- borrarContacto(vNombres, vNumeros, tam);
			3: 
				posEdit <- editarContacto (vNombres, vNumeros, tam);
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
