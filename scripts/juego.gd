extends Node2D

#cargando puntos del cliente
@onready var punto_a = $"Marker2D a.global_position"
@onready var punto_b = $"Marker2D b.global_position"
@onready var punto_c = $"Marker2D c.global_position"


#cargando mis noditos
@onready var parte_vidriera = $"parte vidriera"
@onready var parte_barista = $"parte barista"
@onready var entrada_cafe = $"entrada cafe"
@onready var clientes = $"Clientes"

func _process(_delta: float) -> void:
	clientes.visibilidad()
	
	
#cambio de escenas con las flechitas
var estaciones: Array = []
var indice_actual: int = 0
func _ready() ->void:
	estaciones = [entrada_cafe, parte_barista, parte_vidriera]
	
func cambio_escena(direccion:String) -> void:
	if direccion=="derecha":
		indice_actual+=1
	elif direccion=="izquierda":
		indice_actual-=1
		
	if indice_actual>=estaciones.size():
		indice_actual=0
	elif indice_actual<0:
		indice_actual=estaciones.size()-1
		
	for i in range(estaciones.size()):
		if i==indice_actual:
			estaciones[i].visible=true
		else:
			estaciones[i].visible=false
			
		
		
@export var cliente_scene: PackedScene

func generar_nuevo_cliente():
	var nuevo_cliente = cliente_scene.instantiate()
	
	# 1. Posicionarlo FUERA de pantalla de entrada
	nuevo_cliente.global_position.x = spawn_x
	nuevo_cliente.global_position.y = $PuntosNavegacion/Punto_Atencion.global_position.y
	
	# 2. Agregarlo a la escena
	$Clientes.add_child(nuevo_cliente)
	
	# 3. Le ordenamos caminar hacia la barra
	nuevo_cliente.fijar_destino(barra_x)
