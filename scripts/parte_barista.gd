extends Node2D

@onready var cafetera = $"cafetera"
@onready var licuadora = $"licuadora"
@onready var pava = $"pava"


@onready var modo_cafetera = $"modo_cafetera"

#para que modo cafetera arranque oculto
func _ready() -> void:
	if modo_cafetera != null:
		modo_cafetera.visible = false
	
func _on_cafetera_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index==MOUSE_BUTTON_LEFT and event.pressed:
		modo_cafetera.visible=true
		modo_cafetera.z_index=10


func _on_licuadora_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index==MOUSE_BUTTON_LEFT and event.pressed:
			pass # Replace with function body.


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index==MOUSE_BUTTON_LEFT and event.pressed:
			pass # Replace with function body.
