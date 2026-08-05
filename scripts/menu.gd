extends Control

#si presionamos jugar
func _on_texture_button_jugar_pressed() -> void:
	Globalxd.cambiar_escena("res://escenas/entrada_cafeteria.tscn")
	#get_tree().change_scene_to_file("res://escenas/entrada_cafeteria.tscn")

#si presionamos opciones
func _on_texture_button_opciones_pressed() -> void:
	Globalxd.cambiar_escena("res://escenas/opciones.tscn")
	#get_tree().change_scene_to_file("res://escenas/opciones.tscn")


#si presionamos créditos
func _on_texture_button_creditos_pressed() -> void:
	pass # Replace with function body.
	
#get_tree().quit() es para salir del juego
