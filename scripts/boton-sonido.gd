extends TextureButton

var nombreSonido
var reproductorSonido
var numeroSonido = 0 # Cuál reproducir en caso de que nombreSonido sea array

func _ready():
	pass
	
func _pressed():
	if typeof(nombreSonido) == TYPE_ARRAY:
		reproductorSonido.play(nombreSonido [numeroSonido])
		numeroSonido = (numeroSonido + 1)%nombreSonido.size()
	else:
		reproductorSonido.play(nombreSonido)
	#print (nombreSonido)

