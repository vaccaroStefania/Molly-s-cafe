extends Node2D

#cargando puntos del cliente
@onready var spawn_x = $"Marker2D a".global_position.x
@onready var barra_x = $"Marker2D b".global_position.x
@onready var punto_c = $"Marker2D c".global_position.x


#cargando mis noditos
@onready var parte_vidriera = $"parte vidriera"
@onready var parte_barista = $"parte barista"
@onready var entrada_cafe = $"entrada_cafe" # O $"entrada_cafe" si tiene guión
@onready var clientes = $"clientes"

	
#cambio de escenas con las flechitas
var estaciones: Array = []
var indice_actual: int = 0
func _ready() -> void:
	estaciones = [entrada_cafe, parte_barista, parte_vidriera]
	
	await get_tree().create_timer(5.0).timeout
	generar_nuevo_cliente()

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
		if estaciones[i] != null:
			if i==indice_actual:
				estaciones[i].visible=true
			else:
				estaciones[i].visible=false
				
	if estaciones[indice_actual] == entrada_cafe:
		$clientes.visible = true
	else:
		$clientes.visible = false
		
		
@export var cliente_scene: PackedScene

func generar_nuevo_cliente():
	var nuevo_cliente = cliente_scene.instantiate()
	
	# 1. Agregarlo a la escena
	$clientes.add_child(nuevo_cliente)
	
	# 2. Posicionarlo FUERA de pantalla de entrada
	nuevo_cliente.global_position.x = spawn_x
	nuevo_cliente.global_position.y = $"Marker2D a".global_position.y
	
	
	# 3. Le ordenamos caminar hacia la barra
	nuevo_cliente.fijar_destino(barra_x)
