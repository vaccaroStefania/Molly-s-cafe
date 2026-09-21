extends Node2D
func _ready() -> void:
	pass # Replace with function body.
func _process(delta: float) -> void:
	pass

#¿Cómo alternar las vistas de la cafetera de forma limpia?

#Tenés dos formas muy sencillas de implementarlo dentro de la misma escena de la cafetera sin enredarte con cambiar de archivo constantemente:

#Con Modos/Capas de Visibilidad (Recomendado):
#Dentro de cafetera.tscn, creás un nodo contenedor $VistaGeneral y otros nodos $ZoomLeche y $ZoomFiltro. Cuando tocás la jarra o el filtro, simplemente hacés $VistaGeneral.visible = false y encendés el zoom correspondiente. Un botón de "Volver" en la UI restablece la vista general.

#Como Sub-escenas Instanciadas:
#Si la mecánica de espumar leche o la del portafiltro se vuelven muy complejas (con muchos scripts y sprites propios), creás estacion_leche.tscn como una escena independiente y la instancías como hija dentro del minijuego de la cafetera cuando el jugador toque esa área.
# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
