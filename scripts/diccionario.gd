extends Node

# Se puede instanciar cada "escena" con .instance()
var fabricaBotones = preload("res://BaseBotonSonido.tscn")
var fabricaTitulos = preload("res://Titulo.tscn")
# Similar a fabricaTitulos pero con un tamaño de fuente mayor.
# No encontré una manera de cambiar dinámicamente el tamaño de fuente.
var fabricaTituloInicial = preload("res://TituloInicial.tscn")
# Similar a fabricaTitulos pero con un tamaño de fuente menor.
var fabricaCreditos = preload("res://Creditos.tscn")
var fabricaPartes  = preload("res://PartesAnimal.tscn")
var fabricaTextoPartes = preload("res://TextoParteAnimal.tscn")

# Ojo, distinto a Globales que es un script, este es un nodo de uso general.
onready var globales = get_node("/root/global") 
onready var botones = globales.botones

var pagina = 0
var reproductorSonido

# Crea los botones al comenzar el programa
func _ready():
	if OS.get_name() == "Android":
		# Evita que el botón de atrás de Android cierre el programa, restaurado en la pantalla inicial.
		get_tree().set_auto_accept_quit(false)
	reproductorSonido = self.get_child(2)
	actualizarPagina()
	set_process(true)

var Globales = preload("res://global.gd") # Ojo, distinto a globales
var cantidadHijosNodo = 4 # Botones, reproductor de sonido y botón de regreso.
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
	var cantidadBotones = self.get_child_count() - cantidadHijosNodo
	for i in range(cantidadBotones):
		self.remove_child(self.get_child(cantidadHijosNodo))
	var elementoActual = botones [pagina] # Puede ser título, partes o lista de botones
		
	if typeof(elementoActual) == TYPE_ARRAY:    
		assert (elementoActual.size() > 0)
		if elementoActual[0] extends Globales.PartesAnimal:
			# Partes de los animales
			
			for animal in elementoActual:
				var animalParaPartesNuevo = fabricaPartes.instance()
				add_child(animalParaPartesNuevo)
				animalParaPartesNuevo.set_texture(load("res://texturas/partes/" + animal.nombreTextura))
				animalParaPartesNuevo.set_scale(animal.escalado)
				var compensacionPorEscalado = 1/animal.escalado.x # El escalado provoca que el final no sea 1, por lo que hay que modificar la pos
				# Se pone izquierda/arriba en 0 y la otra en el doble para que quede centrado entre ambas.
				animalParaPartesNuevo.set_margin(MARGIN_LEFT, 0)
				animalParaPartesNuevo.set_margin(MARGIN_RIGHT, animal.pos.x * compensacionPorEscalado * 2)
				animalParaPartesNuevo.set_margin(MARGIN_TOP, 0)
				animalParaPartesNuevo.set_margin(MARGIN_BOTTOM, animal.pos.y * compensacionPorEscalado * 2)
				animalParaPartesNuevo.colocado()
				get_tree().connect("screen_resized", animalParaPartesNuevo, "ajustarTamano")

				# Se agregan los labels como hijos
				for parte in animal.partes:
					var botonParte = fabricaTextoPartes.instance()
					botonParte.set_text(parte.textoPorMostrar)
					self.add_child(botonParte)
					botonParte.set_margin(MARGIN_LEFT, parte.pos.x)
					botonParte.set_margin(MARGIN_TOP, parte.pos.y)
					botonParte.nombreSonido = parte.nombreSonido

		else:
			# Es una lista de botones
			for boton in elementoActual:
				var botonNuevo = fabricaBotones.instance()
				add_child(botonNuevo)
				botonNuevo.init(boton.textoPorMostrar, boton.nombreSonido, boton.nombreTextura, boton.escalado, boton.pos, reproductorSonido)
				# Provoca que se llame el ubicar
				get_tree().connect("screen_resized", botonNuevo, "ubicar")
	else: # Es título
		var etiqueta
		if elementoActual.tipo == Globales.TipoTitulo.inicial:
			etiqueta = fabricaTituloInicial.instance()
		elif elementoActual.tipo == Globales.TipoTitulo.seccion:
			etiqueta = fabricaTitulos.instance()
		else:
			assert(elementoActual.tipo == Globales.TipoTitulo.creditos)
			etiqueta = fabricaCreditos.instance()
		etiqueta.set_text(elementoActual.textoPorMostrar)
		if reproductorSonido.get_sample_library().has_sample(elementoActual.nombreSonido):
			reproductorSonido.play(elementoActual.nombreSonido)
		add_child(etiqueta)
	

# Usado por TextoParteAnimal.tscn pero no los otros
func reproducirSonido(nombre):
	reproductorSonido.play(nombre)

# Llamados cuando se presionan los botones de los lados

func anterior():
	if (pagina > 0):
		pagina -= 1
		actualizarPagina()

func siguiente():
	if (pagina < botones.size() - 1):
		pagina += 1
		actualizarPagina()

# Usado para manejar el botón de regresar de Android.
func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST && OS.get_name() == "Android":
		globales.goto_scene("res://Inicio.tscn")