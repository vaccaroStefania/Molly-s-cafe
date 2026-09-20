class_name Cliente

extends CharacterBody2D
@onready var sprite = $Sprite2D

@export var velocidad_caminata: float = 150.0
var destino_x: float = 0.0
var caminando: bool = false
var velocidad: float = 200.0

var pedido_actual: String = "" 

var ya_pidio: bool = false 

func fijar_destino(nueva_x: float) -> void:
	destino_x = nueva_x
	caminando = true

func _physics_process(_delta: float) -> void:
	if caminando:
		movimiento_cliente()
	
	move_and_slide()

func movimiento_cliente() -> void:
	var distancia = destino_x - global_position.x
	
	if abs(distancia) > 2.0:
		var direccion = sign(distancia)
		velocity.x = direccion * velocidad_caminata
		if sprite:
			sprite.flip_h = (direccion < 0)
	else:
		velocity.x = 0
		global_position.x = destino_x
		caminando = false
		
		pedir_algo()

func pedir_algo() -> void:

	if ya_pidio:
		return
		
	var sistema_pedidos = get_node("/root/juego/Manejopedidos")
	
	if sistema_pedidos:
		pedido_actual = sistema_pedidos.generar_pedido_aleatorio()
		print("Hola papu dame un: ", pedido_actual)
		
		
		ya_pidio = true
