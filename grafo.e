note
	description: "Summary description for {GRAFO}."
	author: "Eberth Mezeta & Victor Lavalle"
	date: "$Date$"
	revision: "$Revision$"

class
	GRAFO

create
		constructor

	feature
		Vertices:ARRAY[VERTICE]
		MAXVer:INTEGER
		Matriz:ARRAY[ARRAY[INTEGER]]
		NumVer:INTEGER

	feature

		constructor(maximo: INTEGER)

		local
		Arr:ARRAY[INTEGER]
		I:INTEGER

		DO
			create	Vertices.make_empty
			MAXVer:= maximo
			create	Matriz.make_empty
			from
				I:=1
			until
				I>maximo
			loop

				create	ARR.make_filled (0, 1, maximo)
				Matriz.force (ARR,i)
				i:=i+1

			end

			NumVer:=0


		end

	getArray: ARRAY[VERTICE]
	do
		RESULT:= Vertices
	end



	getMaxVer:INTEGER
	do
		Result:= MAXVer
	end

	getMatriz:ARRAY[ARRAY[INTEGER]]

	do
		result:= Matriz
	end

	getNumVer:INTEGER
	do
		result:= NumVer
	end


	InsertarVertice(N:STRING)
	local

		V:VERTICE

	do
			NumVer:= NumVer+1
			create v.contructor (N,NumVer)
			Vertices.force (v,NumVer)

	end

	Adyacente(V1:INTEGER;V2:INTEGER):BOOLEAN
	DO
		if(	Matriz.item (v1).item (v2)>0)then
			result:= TRUE
		end
	end



	InsetarArco(V1:INTEGER;V2:INTEGER;PESO:INTEGER)
	do
	Matriz[v1][v2]:=PESO
	end


	Existe(v:VERTICE):BOOLEAN

		local
			i:INTEGER
			Bandera:BOOLEAN

	do
		Bandera:= FALSE
		from
			i:=1

		until
			i>NumVer
		loop
			if(	Vertices[i].getnombre~v.getnombre)then
				Bandera:=TRUE
			end
			i:=i+1
		end

		result:= Bandera

	end

	ImprimirMatriz
	local
		I:INTEGER
		J:INTEGER
	do

		from i:=1 until  i> NumVer loop

		print("%T"+ Vertices.item (i).getnombre)
		i:= i+1
		end
		print("%N")
		from i:=1 until  i> NumVer loop
			print(Vertices.item (i).getnombre +"%T")
				from j:=1 until  j> NumVer loop
						print(Matriz.item (i).item (j).out+ "%T")
						j:= j+1
				end
				print("%N")
			i:= i+1
		end



	end
	ImprimiVertices
	local
		i:INTEGER
	do
		from i:=1 until  i>NumVer  loop
				print(Vertices.item (i).to_string)
				print("%N")
				i:= i+1
			end
	end

	Dijktra(S:INTEGER;F:INTEGER)

	local
		Visto:ARRAY[BOOLEAN]
		Distancia:ARRAY[INTEGER]
		i:INTEGER
		V:INTEGER
		Vis:BOOLEAN
		J: INTEGER
		N:INTEGER
	do



		create Visto.make_filled (FALSE, 1, NumVer)
		create Distancia.make_filled (0, 1,NumVer )

		from i:=1 until i> NumVer loop
			if(not Adyacente(s,i))then
				Distancia[i]:=-1
			else
				Distancia[i]:=Matriz.item (s).item (i)
			end
			i:=i+1
		end
		Distancia[s]:= 0
		Visto[s]:=TRUE

		from
			N:=0
		until
			N=1
		loop

			V:=Minimo(Visto,Distancia)

			Visto[V]:= TRUE

			from J:= 1 until J>NumVer loop



				if (Distancia[J]>(Distancia[V] + Matriz.item (V).item (J)))then

					Distancia[J]:=Distancia[V] + Matriz.item (V).item (J)

				end
			J:=J+1
			end


			IF(TodoV(Visto))THEN
			N:=1
			END


		end

		print(">>EL PESO DE LA RUTA MAS CORTA ES: "+ Distancia[F].out)
		print("%N>>RECORRIDO:")

	end


	Minimo(A:ARRAY[BOOLEAN]; D:ARRAY[INTEGER]):INTEGER

	local
		i:INTEGER
		trono:INTEGER
		INDEX:INTEGER
	do
		trono:=9999

		from i:= 1	until i>NumVer	loop

			if(D[I]<TRONO AND (A[I]=false) and D[I]>0)	then
				trono:= D[I]
				INDEX:= I
			end
			i:=i+1
		end

		result := INDEX

	end

	TodoV(AN:ARRAY[BOOLEAN]):BOOLEAN
	LOCAL
		BAN:BOOLEAN
		I:INTEGER
	DO
		BAN:=TRUE
		FROM I:=1	until I>NumVer  loop

			IF(AN.item (I)=FALSE)THEN
				BAN:=FALSE
			END

			I:=I+1
		end
		RESULT:= BAN
	end



end
