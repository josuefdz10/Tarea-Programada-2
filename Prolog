from pyswip import Prolog #Importa libreria para crear puente de python-prolog
prolog=Prolog()#Puente entre python-prolog
prolog.consult("progra.pl")#Consulta la base de conocimientos

def convertir_underscore(palabra):
    nueva=""
    for letra in palabra:
        if letra=="_":
            nueva=nueva+" "
        else:
            nueva=nueva+letra
    return nueva

def convertir_espacios(palabra):
    nueva=""
    for letra in palabra:
        if letra==" ":
            nueva=nueva+"_"
        else:
            nueva=nueva+letra
    return nueva

def buscar_restaurante(nombre):
	nombre=convertir_espacios(nombre)
	restaurante=list(prolog.query("restaurante("+nombre+",Tipo,Ubicacion)"))
	print restaurante,"\n"

def buscar_restaurante_tipo(tipo):
	tipo=convertir_espacios(tipo)
	restaurante_tipo=list(prolog.query("restaurante(Nombre,"+tipo+",Ubicacion)"))
	print restaurante_tipo,"\n"
	return restaurante_tipo

def ingresa_restaurante(nombre,tipo,ubicacion):
	nombre=convertir_espacios(nombre)
	ubicacion=convertir_espacios(ubicacion)
	tipo=convertir_espacios(tipo)
	restaurante="restaurante("+nombre+","+tipo+","+ubicacion+").\n"
	baseC = open("progra.pl", "a")
	baseC.write(restaurante)
	baseC.close()

#menu para probar funionamiento en consola, eliminar para version final
def menu():
	while(1):
		print "Bienvenido, para ingresar un restaurante ingrese 1, para buscar un restaurante ingrese 2, para buscar restaurantes por su tipo de comida ingrese 3, para salir ingrese 0"
		opcion=raw_input(": ")
		if opcion=="1":
			nombre=raw_input("Ingrese el nombre: ")
			tipo=raw_input("ingrese el tipo de comida que sirve elrestaurante: ")
			ubicacion=raw_input("Ingrese la ubicacion: ")
			ingresa_restaurante(nombre.lower(),tipo.lower(),ubicacion.lower())
		if opcion=="2":
			nombre=raw_input("ingrese el nombre del restaurante: ")
			buscar_restaurante(nombre.lower())
		if opcion=="3":
			tipo=raw_input("ingrese el tipo de comida que sirve el restaurante: ")
			x=buscar_restaurante_tipo(tipo.lower())
		else:
			break

menu()
