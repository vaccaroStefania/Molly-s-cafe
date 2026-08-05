extends Node

#Memoria de escenas :v, creé estas funciones para que guarde la anterior escena tomando el valor de la ruta de la escena actual
var escena_anterior: String = ""
func cambiar_escena(siguiente_escena: String) -> void:
	var escena_actual = get_tree().current_scene
	if escena_actual:
		escena_anterior = escena_actual.scene_file_path
	get_tree().change_scene_to_file(siguiente_escena)
func volver_escena_anterior() -> void:
	if escena_anterior != "":
		get_tree().change_scene_to_file(escena_anterior)
#fin memoria escenas
