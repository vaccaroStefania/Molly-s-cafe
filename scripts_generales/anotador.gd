extends Node2D

#inicializo variables de posición y animación para el movimiento
@export var posicion_oculta: Vector2 = Vector2(1320, 360) 
@export var posicion_desplegada: Vector2 = Vector2(890, 360) 
@export var duracion_animacion: float = 0.5

#creo esto para contener los labels de pedidos
@onready var contenedor_pedidos=$contenedor_pedidos
@onready var titulo=$titulo
const MI_FUENTE = preload("res://items/IndieFlower-Regular.ttf")


#movimiento anotador
var desplegado: bool=false
var animado: bool=false

func _ready() -> void:
	position=posicion_oculta #lo inicializo en esta posicion
	
func _on_anotador_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index==MOUSE_BUTTON_LEFT and event.pressed:
		if not animado:
			mover_anotador()

func mover_anotador():
	animado=true
	desplegado= !desplegado #esto me sirve para no tener que perder 4 lineas de código evaluando si está o no desplegado para cambiarlo a su inverso
	#acá pongo el detector del destino
	var destino:Vector2 #vector2 es para que destino tome valores de posicion
	if desplegado: #si desplegado es true, entonces el vector tendría los valores de posicion desplegada
		destino=posicion_desplegada
	else: #sino los de posicion oculta, depende del valor que tenga desplegado que cambia con cada click al contrario
		destino=posicion_oculta
	#animación para que no se vea tan tosco
	
	var tween=create_tween()
	
	tween.tween_property(self,"position",destino,duracion_animacion).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	
	tween.finished.connect(func(): animado = false) #esto significa que cuando termina la animaci{on animado vuelve a estar en falso
	
#agregar pedidos

func agregar_pedido(texto_pedido:String) ->void:
	var nuevo_label=Label.new() #genero label
	
	nuevo_label.text="* "+texto_pedido #contenido de mi label
	
	nuevo_label.add_theme_color_override("font_color", Color("e83000")) # estilo texto
	nuevo_label.add_theme_font_size_override("font_size", 30)
	nuevo_label.add_theme_font_override("font", MI_FUENTE)
	
	contenedor_pedidos.add_child(nuevo_label) #guardo el label en el contenedor
	if contenedor_pedidos.get_child_count()>0:
		titulo.text="Tienes pedidos"
	else:
		titulo.text="Aún no tienes pedidos"

# Función para borrar todos los pedidos cuando se completen
func limpiar_anotador() -> void:
	for hijo in contenedor_pedidos.get_children():
		hijo.queue_free() # Elimina el Label de la memoria
