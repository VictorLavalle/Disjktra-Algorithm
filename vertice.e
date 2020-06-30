note
	description: "Summary description for {VERTICE}."
	author: "Eberth Mezeta & Victor Lavalle"
	date: "$Date$"
	revision: "$Revision$"

class
	VERTICE
	
	create
		contructor
	feature
		Nombre:STRING
		NumVer:INTEGER
	feature

		contructor(N:STRING; Num:INTEGER)
		do
			Nombre := N
			NumVer := Num
		end

		setNombre(N:STRING)
		do
			Nombre := N
		end

		setNumVertice(Num:INTEGER)
		do
			NumVer := Num
		end

		getNombre:STRING
		DO
			result := Nombre
		end

		getNumVer:INTEGER
		do
			result := NumVer
		end

		to_string:STRING
		do
			result:= "Nombre: "+ Nombre + ", Numero: "+ NumVer.out
		end

end
