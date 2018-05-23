extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

class Opcion:
	var nombre
	var sonido
	var textura
	func _init(nombre, sonido, textura):
		self.nombre = nombre
		self.sonido = sonido
		self.textura = textura

var ejemploOpcion = [Opcion.new("Focro", "focro", "focro.png")]

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	print(self.get_child(1))
	print(ejemploOpcion[0].nombre)
	pass
