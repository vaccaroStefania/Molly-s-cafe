class_name Cliente

extends Node2D



var nombre:String=""
var dialogos:Array=["Buen día"]
@onready var dialogManager = Dialogo.new()
#estados
var en_movimiento:bool=false
var pedido_completo:bool=false
var cliente_presente:bool=false
#destinos
var entrada_x=-280
var pedido_x=250
var ida_x=800
#destino actual
var destino_select: float = 250.0
#capacidad
var velocidad: float = 200.0

func cambio_destino():
	match destino_select:
		250:
			destino_select = ida_x
			en_movimiento = true
			dialogManager.crear_dialogo("Pepe", "Holaaaa.")
		800:
			position.x = entrada_x   # Lo teletransporto a -280 
			destino_select = pedido_x
			en_movimiento = true
	
func _process(delta: float) -> void:
	if en_movimiento:
		#desde donde comienza, hasta donde va y su velocidad
		position.x = move_toward(position.x, destino_select, velocidad * delta)
		
		if position.x == destino_select:
			en_movimiento = false
			
			if destino_select == pedido_x and pedido_completo:
				cambio_destino()
