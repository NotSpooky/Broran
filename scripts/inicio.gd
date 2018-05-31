extends Node

# Permite instanciar botones con .instance()
var fabricaBotones = preload("res://BaseBotonSonido.tscn")
# ditto
var fabricaTitulos = preload("res://Titulo.tscn")

# TODO: Partes de animales
# TODO: Página inicial
# TODO: Animales con varias pronunciaciones
onready var globales = get_node("/root/global")
onready var botones = globales.botones

var pagina = 0
var reproductorSonido

# Crea los botones al comenzar el programa
func _ready():
	reproductorSonido = self.get_child(2)
	actualizarPagina()

# Llamado cuando se presionan los botones se anterior y siguiente, al final de las funciones anterior() y siguiente()

func actualizarPagina():
	if pagina == 0: # Se ocultan los botones al llegar a la primera y última página.
		self.get_child(0).set_hidden(true)
	else:
		self.get_child(0).set_hidden(false)
	if pagina == botones.size() - 1:
		self.get_child(1).set_hidden(true)
	else:
		self.get_child(1).set_hidden(false)
	var cantidadBotones = self.get_child_count() - 3 # Los primeros 3 son los botones de anterior, siguiente y el reproductor de música
	for i in range(cantidadBotones):
		self.remove_child(self.get_child(3))
	if typeof(botones [pagina]) == TYPE_STRING: # Es título.
		var etiqueta = fabricaTitulos.instance()
		etiqueta.set_text(botones[pagina])
		add_child(etiqueta)
	else:
		for boton in botones [pagina]:
			var botonNuevo = fabricaBotones.instance()
			add_child(botonNuevo)
			botonNuevo.init(boton.textoPorMostrar, boton.nombreSonido, boton.nombreTextura, boton.scale, boton.pos, reproductorSonido)
			# Provoca que se llame el ubicar
			get_tree().connect("screen_resized", botonNuevo, "ubicar")

# Llamados cuando se presionan los botones de los lados

func anterior():
	if (pagina > 0):
		pagina -= 1
		actualizarPagina()

func siguiente():
	if (pagina < botones.size() - 1):
		pagina += 1
		actualizarPagina()