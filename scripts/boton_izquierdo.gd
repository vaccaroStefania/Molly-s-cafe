extends TextureButton

func _on_pressed() -> void:
	var nodo_juego = get_tree().current_scene
	nodo_juego.cambio_escena("izquierda")
	
	
