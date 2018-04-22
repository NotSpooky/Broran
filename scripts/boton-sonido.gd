extends TextureButton

var nombreSonido
var reproductorSonido

func _ready():
	pass
	
func _pressed():
	reproductorSonido.play(nombreSonido)
	print (nombreSonido)

