extends CanvasLayer

@onready var configuracion=$"configuracion"
@onready var boton_izquierdo=$"boton izquierdo"
@onready var boton_derecho=$"boton derecho"
@onready var opciones = get_node("../opciones_fondo")
@onready var anotador=$"anotador"


func _ready():
	if opciones != null:
		opciones.visible = false
	else:
		print("¡Ojo! No encontré el nodo opciones_fondo")
	boton_izquierdo.pressed.connect(_on_boton_izquierdo_pressed)
	boton_derecho.pressed.connect(_on_boton_derecho_pressed)

func _on_boton_izquierdo_pressed():
	var nodo_juego = get_tree().current_scene
	if nodo_juego.has_method("cambio_escena"):
		nodo_juego.cambio_escena("izquierda")

func _on_boton_derecho_pressed():
	var nodo_juego = get_tree().current_scene
	if nodo_juego.has_method("cambio_escena"):
		nodo_juego.cambio_escena("derecha")
		
func _on_configuracion_pressed() -> void:
	opciones.visible=!opciones.visible
	if opciones.visible==true:
		boton_derecho.visible=false
		boton_izquierdo.visible=false
		configuracion.visible=false
	
	
