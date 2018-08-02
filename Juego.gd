extends Node

# TODO: Evitar que dos del mismo nombre aparezcan o que sean contados como correctas.

var fabricaBotones = preload("res://OpcionJuego.tscn")
onready var globales = get_node("/root/global")
var Globales = preload("res://global.gd") # Ojo, distinto a globales

class Puntajes:
	var puntaje = 0
	var mejorPuntaje = 0
	var nuevoRecord = false

onready var opcionesSinAplanar = globales.botones

var puntajes = Puntajes.new()
var opcionCorrecta = -1
var botones = []
var cantidadOpciones = 3
var reproductorSonido
var cambiandoOpciones = false # Empezó a sonar la opción seleccionada y se está esperando para cambiar las opciones en pantalla

func _ready():
	# Se busca el archivo de puntaje/
	var puntajeGuardado = File.new()
	puntajeGuardado.open("user://puntaje.pts", File.READ)
	
	if puntajeGuardado.is_open() && !puntajeGuardado.eof_reached():
		puntajes.mejorPuntaje = puntajeGuardado.get_32()
	puntajeGuardado.close()
	print("Mejor puntaje: ", puntajes.mejorPuntaje)
	
	if OS.get_name() == "Android":
		# Evita que el botón de atrás de Android cierre el programa, restaurado en la pantalla inicial.
		get_tree().set_auto_accept_quit(false)
	# Se obtienen los datos individuales, para ello se remueven los títulos y se aplana el arreglo.
	for i in range (cantidadOpciones):
		var botonOpcion = fabricaBotones.instance()
		self.add_child(botonOpcion)
		# TODO: Adaptar para cantidad != 3
		botonOpcion.set_margin(MARGIN_LEFT, 0.15 + (i * 0.25))
		botonOpcion.set_margin(MARGIN_RIGHT, 0.35 + (i * 0.25))
	for i in range (opcionesSinAplanar.size()):
		var actual = opcionesSinAplanar [i]
		if (typeof(actual) == TYPE_ARRAY) && (actual[0] extends Globales.DatosBoton): # Se ignoran títulos y partes
			assert (actual.size() > 0)
			for j in range (actual.size()):
				botones.append(actual[j])
	colocarOpciones()
	set_process(true) # Permite que se llame _process, en el cual se comprueba si hay algo tocando

# Coloca una nueva palabra y botones.
func colocarOpciones():
	var tamPantalla = OS.get_window_size()
	var opciones = seleccionarNAleatorios(botones, cantidadOpciones)
	var palabra = self.get_child(0)
	var etiquetaPuntaje = self.get_child(1)
	reproductorSonido = self.get_child(2)
	etiquetaPuntaje.set_text(str(puntajes.puntaje))
	reordenarAleatoriamente(opciones)
	opcionCorrecta = opciones [0]
	palabra.set_text(opcionCorrecta.textoPorMostrar)
	var nodosOpciones = [self.get_child(4), self.get_child(5), self.get_child(6)]
	assert(nodosOpciones.size() == cantidadOpciones)
	reordenarAleatoriamente(opciones) # Para que no sea la primer opción siempre la correcta
	for i in range(cantidadOpciones):
		var opcionActual = nodosOpciones[i]
		opcionActual.set_normal_texture(load("res://texturas/" + opciones[i].nombreTextura))
		opcionActual.id = opciones[i]
	var sonido = opcionCorrecta.nombreSonido
	if typeof(sonido) == TYPE_ARRAY: # Si hay varios sonidos, usar el primero
		sonido = sonido [0]
	reproductorSonido.play(sonido, true)

var tiempoRestanteParaOtraOpcion = -1
# Llamado cuando el usuario hace click en alguna opción
# id es la posición en el arreglo aplanado de la opción seleccionada.
func seleccionarOpcion(id):
	if tiempoRestanteParaOtraOpcion > 0 || cambiandoOpciones:
		return
	var sonido = id.nombreSonido
	if typeof(sonido) == TYPE_ARRAY: # Si hay varios sonidos, usar el primero
		sonido = sonido [0]
	reproductorSonido.play(sonido, true)
	if (id == opcionCorrecta):
		puntajes.puntaje = puntajes.puntaje + 1
		cambiandoOpciones = true
	else:
		if puntajes.puntaje > puntajes.mejorPuntaje:
			puntajes.mejorPuntaje = puntajes.puntaje
			print("Nuevo mejor puntaje: ", puntajes.puntaje)
			var puntajeGuardado = File.new()
			puntajeGuardado.open("user://puntaje.pts", File.WRITE)
			puntajeGuardado.store_32(puntajes.mejorPuntaje)
			puntajeGuardado.close()
			puntajes.nuevoRecord = true
		globales.goto_scene("res://Puntajes.tscn", puntajes) # Salta a la escena de puntajes.

func _process(delta):
	if cambiandoOpciones && !reproductorSonido.is_active():
		cambiandoOpciones = false
		tiempoRestanteParaOtraOpcion = 0.1
	else:
		if tiempoRestanteParaOtraOpcion > 0:
			tiempoRestanteParaOtraOpcion = tiempoRestanteParaOtraOpcion - delta
			if tiempoRestanteParaOtraOpcion < 0:
				colocarOpciones()

# Usado para manejar el botón de regresar de Android.
func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST && OS.get_name() == "Android":
		globales.goto_scene("res://Inicio.tscn")

# Funciones auxiliares:

# Implementa reservoir sampling
# cantidad es el N
# Evita que dos elementos tengan el mismo texto (en el diccionario del brorán hay 2 animales con el mismo nombre)
func seleccionarNAleatorios(opciones, cantidad):
	var opcionesTotales = opciones.size()
	assert(cantidad <= opcionesTotales)
	randomize()
	var reserva = []
	# Se copia la primera sección del arreglo
	for i in range (0, cantidad):
		reserva.append(opciones[i])
	
	for i in range(cantidad, opcionesTotales):
		var aleatorio = randi()%i
		if(aleatorio < cantidad):
			var elementoRepetido = false
			for posReserva in range(0, reserva.size()):
				if reserva[posReserva].textoPorMostrar == opciones[i].textoPorMostrar:
					elementoRepetido = true
			if !elementoRepetido:
				reserva [aleatorio] = opciones[i]
	return reserva

func reordenarAleatoriamente(arreglo):
	for i in range(arreglo.size()):
		var auxiliar = arreglo [i]
		var posAleatoria = randi() % arreglo.size()
		arreglo [i] = arreglo [posAleatoria]
		arreglo [posAleatoria] = auxiliar