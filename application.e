note
	description: "Dijsktra application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

make
	LOCAL

			S:STRING
			G:GRAFO
			V: VERTICE
			I:INTEGER
			J:INTEGER
			NumVe: INTEGER
			V1:INTEGER
			V2:INTEGER
			P:INTEGER


			-- Run application.
		do
			--| Add your code here
			print ("%T%T:::PROYECTO FINAL TLP:::")

			--Se Captura el numero de nodos/vertices que tendrá el grafo
			print("%N%N>>Introduzca el Numero de Nodos del Grafo: %N")
			io.read_integer_8
			NumVe:= io.last_integer_8

			--Se crea el grafo
			CREATE	G.constructor (NumVe)

			print("%NGenerando Nodos...%N[...]%NNodos Creados Exitosamente!%N")

			from i:=1 	until i>NumVe 	loop
			s:="V" + i.out
			g.insertarvertice (s)
			i:= i+1
			end

		--Impresion en Pantalla del grafo	
		print("%N%N")
		G.imprimivertices
		print("%N%N>>Matriz de Adyacencia con Peso:%N")
		G.imprimirmatriz

		--Se Capturan los nodos que seran adyacentes
		print("%N--Creacion de Arcos--")
		print("%N*NOTA:Para Crear un Arco Ingrese los Numero de los Vertices%N")

		from i:=1 	until i>(NumVe*NumVe) loop
			print("%N>>Ingrese el numero del Vertice 1:%N")
			IO.read_integer
			V1:= IO.last_integer

			print(">>Ingrese el Numero del Vertice 2: %N")
			IO.read_integer
			V2:=IO.last_integer
			print(">>Ingrese el Peso del Arco: %N")
			IO.read_integer
			p:=IO.last_integer

			--Una vez creado pasamos como parametros los vertices y el peso
			G.insetararco (v1, v2,p)
			G.insetararco (v2, v1,p)

			i:= i+1

			print("%NSi Desea Terminar de Capturar Arcos Ingrese -1, Sino Ingrese Cualquier Otro Entero:%N")
			io.read_integer
			V1:=IO.last_integer
			IF(V1=-1)THEN
				I:= NumVe* NumVe + 1

			end


			end
		--Se actualiza la matriz con los pesos correspondientes	
		g.imprimirmatriz

		--Capturacion del camino que se quiere recorrer
		print("%N--RUTA POR RECORRER--")
		print("%N>>Ingrese el Numero de Vertice de Origen:%N")
			IO.read_integer
			V1:= IO.last_integer

			print("%N>>Ingrese el Numero de Vertice de Destino: %N")
			IO.read_integer
			V2:=IO.last_integer
		--Una vez capturados los vertices los pasamos como parametros a la función dijsktra	
		print("%NCalculando...%N")
		G.dijktra (V1,V2)


		end
end

