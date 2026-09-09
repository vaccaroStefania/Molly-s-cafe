class_name Cliente

extends CharacterBody2D

@onready var entrada_cafe=$"../entrada cafe"

func visibilidad():
	if entrada_cafe.visible==true:
		visible=true
	else:
		visible=false
	
var nombre:String=""
var dialogos:Array=["Buen día"]
@onready var dialogManager = Dialogo.new()
#estados

var pedido_completo:bool=false
var cliente_presente:bool=false
#destinos
#var entrada_x=-280
#var pedido_x=250
#var ida_x=800
##destino actual
#var destino_select: float = 250.0
##capacidad
#var velocidad: float = 200.0
#
#func cambio_destino():
	#match destino_select:
		#250:
			#destino_select = ida_x
			#en_movimiento = true
			#dialogManager.crear_dialogo("Pepe", "Holaaaa.")
		#800:
			#position.x = entrada_x   # Lo teletransporto a -280 
			#destino_select = pedido_x
			#en_movimiento = true
	#
#func _process(delta: float) -> void:
	#if en_movimiento:
		##desde donde comienza, hasta donde va y su velocidad
		#position.x = move_toward(position.x, destino_select, velocidad * delta)
		#
		#if position.x == destino_select:
			#en_movimiento = false
			#
			#if destino_select == pedido_x and pedido_completo:
				#cambio_destino()

# Configuración de movimiento
@export var velocidad_caminata: float = 150.0

# Posición 
var destino_x: float = 0.0
var esta_caminando: bool = false

func fijar_destino(nuevo_destino_x: float) -> void:
	destino_x = nuevo_destino_x
	esta_caminando = true

func _physics_process(delta: float) -> void:
	if esta_caminando:
		movimiento_cliente(delta)

func movimiento_cliente(_delta: float) -> void:
	# 1. Calcular cuántos píxeles faltan para llegar
	var distancia = destino_x - global_position.x

	# 2. Si la distancia es mayor al margen de parada (2 píxeles)
	if abs(distancia) > 2.0:
		# sign(distancia) devuelve 1 si va a la derecha, -1 a la izquierda
		var direccion = sign(distancia)
		
		# Asignar velocidad en X a la propiedad nativa 'velocity'
		velocity.x = direccion * velocidad_caminata
		
		# Opcional: Girar el sprite según la dirección
		if $Sprite2D:
			$Sprite2D.flip_h = (direccion < 0)
	else:
		# Llegó al punto: Frenar
		velocity.x = 0
		global_position.x = destino_x # Ajuste preciso para que no quede desfasado
		esta_caminando = false

	# 3. Aplicar el movimiento de física nativo
	move_and_slide()
