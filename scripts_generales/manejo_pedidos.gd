extends Node

var datos_menu
var lista_general=["cafetera", "licuadora", "pava"]
var lista_cafes = []
var lista_licuadora=[]
var lista_pava=[]

var pedido_actual: String = ""

func _ready():
	datos_menu = cargar_json("res://datos_pedidos.json")
	if datos_menu != null:
		lista_cafes = datos_menu["categorias de consumo"]["bebible"]["cafetera"]["nombre"]
		lista_licuadora = datos_menu["categorias de consumo"]["bebible"]["licuadora"]["nombre"]
		lista_pava = datos_menu["categorias de consumo"]["bebible"]["pava"]["nombre"]
		
		#pedido_actual = generar_pedido_aleatorio()
		#print("El cliente acaba de pedir: ", pedido_actual)

func generar_pedido_aleatorio() -> String:
	var bebible:String = lista_general.pick_random()
	match bebible:
		"cafetera":
			pedido_actual=lista_cafes.pick_random()
		"licuadora":
			pedido_actual=lista_licuadora.pick_random()
		"pava":
			pedido_actual=lista_pava.pick_random()
		_:
			pedido_actual= ""
	print("El sistema generó el pedido: ", pedido_actual)
	return pedido_actual

func cargar_json(ruta: String) -> Variant:
	if not FileAccess.file_exists(ruta):
		print("Error: No encontré el archivo en ", ruta)
		return null
	
	var archivo = FileAccess.open(ruta, FileAccess.READ)
	var contenido = archivo.get_as_text()
	archivo.close()
	
	return JSON.parse_string(contenido)
