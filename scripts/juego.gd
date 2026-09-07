extends Node2D

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
			
		
