extends Node

var datos_menu
var lista_general=["cafetera", "licuadora", "pava"]
var lista_cafes = []
var lista_licuadora=[]
var lista_pava=[]
var cantidad_pedidos:int
var pedidos:Array=[]

func _ready():
	datos_menu = cargar_json("res://datos_pedidos.json")
	if datos_menu != null:
		lista_cafes = datos_menu["categorias de consumo"]["bebible"]["cafetera"]["nombre"]
		lista_licuadora = datos_menu["categorias de consumo"]["bebible"]["licuadora"]["nombre"]
		lista_pava = datos_menu["categorias de consumo"]["bebible"]["pava"]["nombre"]
		
		#pedido_actual = generar_pedido_aleatorio()
		#print("El cliente acaba de pedir: ", pedido_actual)
		
func generar_cantidad_pedidos()-> int:
	cantidad_pedidos=randi_range(1,6)
	return cantidad_pedidos
	
	
func generar_pedido_aleatorio() -> Array:
	pedidos.clear() #para limpiar los pedidos de clientes anteriores
	#generar_cantidad_pedidos() el problema de hacerlo así nomás es que no estería guardando el valor
	var total_pedidos=generar_cantidad_pedidos() #así que guardo el valor del return de la función en una variable
	
	for i in range(total_pedidos):
		var bebible:String = lista_general.pick_random()
		var pedido_actual: String = "" #cambio acá la instanciaci{on de la variable pedido actual
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
		pedidos.append(pedido_actual)
	return pedidos

func cargar_json(ruta: String) -> Variant:
	if not FileAccess.file_exists(ruta):
		print("Error: No encontré el archivo en ", ruta)
		return null
	
	var archivo = FileAccess.open(ruta, FileAccess.READ)
	var contenido = archivo.get_as_text()
	archivo.close()
	
	return JSON.parse_string(contenido)
