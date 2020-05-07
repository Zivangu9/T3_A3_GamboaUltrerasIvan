
% articulo(clave, descripcion, precio)
producto(pr1, computadora, 15).
producto(pr2, raton_alambrico, 10).
producto(pr3, proyector, 10).
producto(pr4, adaptador_vga, 10).
producto(pr5, raton_inalambrico, 5).
producto(pr6, memoria_usb, 5).
producto(pr7, disco_externo, 5).
producto(pr8, escritorio, 100). 

% inventario(clave, existencias)
inventario(pr1, 32).
inventario(pr2, 4).
inventario(pr3, 5).
inventario(pr4, 64).
inventario(pr5, 12).
inventario(pr6, 10).
inventario(r7, 89).

% cliente(nombre, ciudad, calificacion-credito)
cliente(ana, fresnillo, 5).
cliente(maria, jerez, 4).
cliente(luis, jerez, 2).
cliente(juan, zacatecas, 3).
cliente(gerardo, gaudalupe, 4).
cliente(david, zacatecas, 5).
cliente(perla, gaudalupe, 4).
cliente(omar, zacatecas, 3).
cliente(lucia, jerez, 4).
cliente(diana, fresnillo, 1).

% _ (guion bajo) COMODIN que permite UNIFICAR cualquier valor, SIN MOSTRARLO

%EJEMPLO: crear regla que muestre a los clientes de Jerez
clientes_jerez(Nombre) :- cliente(Nombre, jerez, _).	%PROBAR CONSULTA: clientes_jerez(Nombre).

%EJEMPLO 2: mostrar los clientes con calificacion de 5
clientes_5(Nombre) :- cliente(Nombre, _, 5).

%EJEMPLO 3: mostrar un listado con el nombre del producto y su existencia
producto_cantidad(Prod, Cant):- producto(NumProd, Prod, _) , inventario(NumProd, Cant).

%------------------------------Ejercicio 1------------------------------
clientes_de(Cliente,Ciudad) :- cliente(Cliente, Ciudad, _). 
/*Ejemplo: 
	?- clientes_de(Nombre,zacatecas).
		Nombre = juan ;
		Nombre = david ;
		Nombre = omar.
*/
%------------------------------Ejercicio 2------------------------------
clientes_calif(Cliente,Calif) :- cliente(Cliente, _, Calif).
/*Ejemplo: clientes_calif(Nombre,3).
	?- clientes_calif(Nombre,3).
		Nombre = juan ;
		Nombre = omar.
*/
%------------------------------Ejercicio 3------------------------------
clientes_calif_de(Cliente,Calif,Ciudad) :- cliente(Cliente, Ciudad, Calif).
/*Ejemplo: clientes_calif_de(Nombre,4,gaudalupe).
	?- clientes_calif_de(Nombre,4,gaudalupe).
		Nombre = gerardo ;
		Nombre = perla.
*/
%------------------------------Ejercicio 4------------------------------
/*
Usando el ejemplo 3
Ejemplo: clientes_calif_de(Nombre,4,gaudalupe).
	?- producto_cantidad(computadora,Cantidad).
		Cantidad = 32.


*/
%------------------------------Ejercicio 5------------------------------
numero_articulo(Articulo,Numero) :- producto(Numero, Articulo, _).
/*Ejemplo: numero_articulo(memoria_usb,Numero).
	?- numero_articulo(memoria_usb,Numero).
		Numero = pr6.
*/
%------------------------------Ejercicio 6------------------------------
numero_cantidad(Numero, Cantidad):- inventario(Numero, Cantidad).
/*Ejemplo: numero_cantidad(pr6, Cantidad).
	?- numero_cantidad(pr6, Cantidad).
		Cantidad = 10.
*/
%------------------------------Ejercicio 7------------------------------
inventario_lista(Producto,Cantidad) :- producto(NumProd, Producto, _) , inventario(NumProd, Cantidad).
/*Ejemplo: inventario_lista(Producto,Cantidad).
	?- inventario_lista(Producto,Cantidad).
		Producto = computadora,
		Cantidad = 32 ;
		Producto = raton_alambrico,
		Cantidad = 4 ;
		Producto = proyector,
		Cantidad = 5 ;
		Producto = adaptador_vga,
		Cantidad = 64 ;
		Producto = raton_inalambrico,
		Cantidad = 12 ;
		Producto = memoria_usb,
		Cantidad = 10 ;
*/