extends Node

var datos_menu
var lista_cafes = []

func _ready():
	datos_menu = cargar_json("res://datos_pedidos.json")
	lista_cafes = datos_menu["categorias de consumo"]["bebible"]["cafetera"]["nombre"]
	
	
	var primer_pedido = generar_pedido_aleatorio()
	print("El cliente acaba de pedir: ", primer_pedido)


func generar_pedido_aleatorio() -> String:
	return lista_cafes.pick_random()

func cargar_json(ruta: String) -> Variant:
	if not FileAccess.file_exists(ruta):
		print("Error: No encontré el archivo en ", ruta)
		return null
	
	var archivo = FileAccess.open(ruta, FileAccess.READ)
	var contenido = archivo.get_as_text()
	archivo.close()
	
	return JSON.parse_string(contenido)
