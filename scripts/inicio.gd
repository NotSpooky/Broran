extends Node

# Permite instanciar botones con .instance()
var fabricaBotones = preload("res://BaseBotonSonido.tscn")
# ditto
var fabricaTitulos = preload("res://Titulo.tscn")

class DatosBoton:
	var textoPorMostrar
	var nombreTextura
	var nombreSonido
	var scale
	var pos
	func _init (textoPorMostrar, nomTex, nomSon, pos = Vector2(0.5,0.5), scale = Vector2(0.4, 0.4)):
		self.textoPorMostrar = textoPorMostrar
		self.nombreTextura = nomTex
		self.nombreSonido = nomSon
		self.scale = scale
		self.pos = pos

# TODO: Partes de animales
# TODO: Imágenes y audios que faltan
# TODO: Página inicial
# TODO: Animales con varias pronunciaciones
# TODO: Revisar los nombres duplicados

var botones = [ 
  "Díro isó",
  [
  # Peces. Hay que poner partes.
    DatosBoton.new("föcró/fòcro", "focro.png", "focro", Vector2(0.3,0.4), Vector2(0.55, 0.55))
  , DatosBoton.new("qu'èhuän", "qu ehuan.png", "qu ehuan", Vector2(0.5, 0.4), Vector2(0.6, 0.6))
  , DatosBoton.new("c'ascuò", "c ascuo.png", "", Vector2(0.1, 0.1), Vector2(0.6, 0.6)) ## FALTA AUDIO
  , DatosBoton.new("drémcuo", "dremcuo.png", "", Vector2(0.1, 0.7), Vector2(0.7, 0.7)) ## FALTA AUDIO
  , DatosBoton.new("drémcuohua", "dremcuohua.png", "", Vector2(0.7, 0.1), Vector2(0.5, 0.5))  ## FALTA AUDIO
  , DatosBoton.new("zbòntë", "zbonte.png", "zbonte", Vector2(0.7, 0.7), Vector2(0.7, 0.7))
  ], [
  # Está 2 veces
  DatosBoton.new("bòmcuo", "bomcuo.png", "bomcuo", Vector2(0.3, 0.4), Vector2(0.65, 0.65))
  , DatosBoton.new("quèzhbön", "quezhbon.png", "quezhbon", Vector2(0.5, 0.4), Vector2(0.65, 0.65))
  , DatosBoton.new("pímcuo", "pimcuo.png", "pimcuo", Vector2(0.1, 0.1), Vector2(0.65, 0.65))
  , DatosBoton.new("bógródo", "bogrodo.png", "bogrodo", Vector2(0.1, 0.7), Vector2(0.8, 0.8))
  , DatosBoton.new("́romdó", "romdo.png", "romdo", Vector2(0.7, 0.1), Vector2(0.72, 0.72))
  , DatosBoton.new("m̲á", "ma.png", "ma", Vector2(0.7, 0.7), Vector2(0.8, 0.8))  ## FALTA AUDIO
  ], [
  DatosBoton.new("shuóhuo", "shuohuo.png", "shuohuo", Vector2(0.26, 0.4), Vector2(0.7, 0.7))
  , DatosBoton.new("zhír", "zhir.png", "zhir", Vector2(0.5, 0.4), Vector2(0.75, 0.75))
  , DatosBoton.new("dióhuo", "diohuo.png", "diohuo", Vector2(0.1, 0.1), Vector2(0.85, 0.85))
  , DatosBoton.new("́sró̈n", "sron.png", "sron", Vector2(0.1, 0.7), Vector2(0.65, 0.65))  ## FALTA AUDIO
  # Repetido
  #, DatosBoton.new("bòmcuo", "bomcuo.png", "bomcuo", Vector2(0.7, 0.1), Vector2(0.65, 0.65))
  # Revisar si tiene otra tilde.
  , DatosBoton.new("drú̈nbòmcuo", "drunbomcuo.png", "", Vector2(0.7, 0.7), Vector2(0.75, 0.75)) ## FALTA AUDIO
  ], [
  DatosBoton.new("huor̈emcuó", "huoremcuo.png", "huoremcuo", Vector2(0.6, 0.1), Vector2(1, 1)) ## FALTA AUDIO
  , DatosBoton.new("shíti cóhuo", "shiti cohuo.png", "shiti cohuo", Vector2(0.6, 0.65), Vector2(0.9, 0.9))
  , DatosBoton.new("c'ú", "c u.png", "c u", Vector2(0.15, 0.1), Vector2(0.8,0.8))
  , DatosBoton.new("c'uéhuo", "c uehuo.png", "c uehuo", Vector2(0.15, 0.6), Vector2(1, 1))
  ],
  "Bugúr/dugúr"
 , [
  DatosBoton.new("önna zhguó", "onna zhguo.png", "onna zhguo", Vector2(0.65, 0.6), Vector2(0.5,0.5))
  , DatosBoton.new("sá", "sa.png", "sa", Vector2(0.65, 0.1), Vector2(0.7,0.7))
  , DatosBoton.new("c'áihuac", "c aihuac.png", "c aihuac", Vector2(0.15, 0.1), Vector2(0.7,0.7))
  , DatosBoton.new("śrígra zhguó", "srigra zhguo.png", "srigra zhguo", Vector2(0.15, 0.6), Vector2(0.5,0.5))
  ]
  , [
  DatosBoton.new("shúrí̈n dugúr", "shurin dugur.png", "shurin dugur", Vector2(0.15, 0.2), Vector2(0.85,0.85))
  , DatosBoton.new("dabará shuó", "dabara shuo.png", "dabara shuo", Vector2(0.65, 0.2), Vector2(0.5,0.5))
  , DatosBoton.new("dáró zhguó", "daro zhguo.png", "daro zhguo", Vector2(0.4, 0.65), Vector2(0.9,0.9))
  ],
  "Dubúc sóga" 
  , [
  # Aves. Hay que poner título y partes.
  DatosBoton.new("zrú̈n", "zrun.png", "zrun", Vector2(0.4, 0.7))
  , DatosBoton.new("iró̈n", "iron.png", "iron", Vector2(0.4, 0.4))
  # Revisar si pongo gúr̈eniá nada más.
  , DatosBoton.new("gúr̈eniáhua", "gurenia.png", "gurenia", Vector2(0.1, 0.1), Vector2(0.45, 0.45))
  , DatosBoton.new("ó̈n", "on.png", "on", Vector2(0.1, 0.7)) ## FALTA AUDIO
  # Ojo que tiene subrayado.
  , DatosBoton.new("́r̲oshc̈̈ö/ár̲á", "roshco.png", "roshco", Vector2(0.7, 0.7), Vector2(0.55, 0.55))
  , DatosBoton.new("gúr̈efün", "gurefun.png", "gurefun", Vector2(0.4, 0.1))
  , DatosBoton.new("t̲agá", "taga.png", "taga", Vector2(0.7, 0.1))
  ], [  
  DatosBoton.new("dö fú̈n", "do fun.png", "do fun", Vector2(0.3, 0.4), Vector2(0.6,0.6))
  , DatosBoton.new("c'rízuo", "c rizuo.png", "c rizuo", Vector2(0.5, 0.4), Vector2(0.6, 0.6))
  , DatosBoton.new("dünhuó", "dunhuo.png", "dunhuo", Vector2(0.1, 0.1), Vector2(0.5, 0.5))
  , DatosBoton.new("́r̲oshcöhua", "roshcohua.png", "roshcohua", Vector2(0.1, 0.65), Vector2(0.15, 0.15))
  , DatosBoton.new("púpcuo", "pupcuo.png", "pupcuo", Vector2(0.7, 0.1))
  , DatosBoton.new("́rurhuo", "rurhuo.png", "rurhuo", Vector2(0.7, 0.65), Vector2(0.12, 0.12))
  ], [
  DatosBoton.new("t'úr̈ehuó", "t urehuo.png", "t urehuo", Vector2(0.3, 0.4), Vector2(0.6, 0.6)) ## FALTA AUDIO
  , DatosBoton.new("c̲ózrá", "cozra.png", "cozra", Vector2(0.5, 0.4)) ## FALTA AUDIO
  , DatosBoton.new("cóshpa", "coshpa.png", "coshpa", Vector2(0.1, 0.1), Vector2(0.45, 0.45))
  , DatosBoton.new("shíc", "shic.png", "shic", Vector2(0.1, 0.7))
  , DatosBoton.new("dárca", "darca.png", "darca", Vector2(0.7, 0.7)) ## FALTA AUDIO
  , DatosBoton.new("́rá̈nsa", "ransa.png", "ransa", Vector2(0.75, 0.1), Vector2(0.55, 0.55)) ## FALTA AUDIO
  ], [
  DatosBoton.new("shcuá̈n sí", "shcuan si.png", "shcuan si", Vector2(0.41, 0.4), Vector2(0.67, 0.67))
  , DatosBoton.new("d́rünquí̈ncui", "drunquincui.png", "drunquincui", Vector2(0.7, 0.7), Vector2(0.7, 0.7))
  , DatosBoton.new("dünhuó", "dunhuo 2.png", "dunhuo", Vector2(0.1, 0.1), Vector2(0.7, 0.7))
  , DatosBoton.new("curé́rcra", "curercra.png", "curercra", Vector2(0.1, 0.65), Vector2(0.7, 0.7))
  , DatosBoton.new("zíngra", "zingra.png", "zingra", Vector2(0.7, 0.1), Vector2(0.5, 0.5))
  ], [
  DatosBoton.new("tòn", "ton.png", "ton", Vector2(0.3, 0.4), Vector2(0.65, 0.65))
  , DatosBoton.new("òguc", "oguc.png", "oguc", Vector2(0.5, 0.4), Vector2(0.55, 0.55))
  # En el diccionario PDF son 2 aves
  , DatosBoton.new("c'́rác", "c rac.png", "c rac", Vector2(0.1, 0.1), Vector2(0.55, 0.55))
  , DatosBoton.new("qu'ishcuän", "qu ishcuan.png", "qu ishcuan", Vector2(0.1, 0.7), Vector2(0.5, 0.5))
  , DatosBoton.new("c'̈oczhá̈n", "c oczhan.png", "c oczhan", Vector2(0.7, 0.7), Vector2(0.6, 0.6))
  , DatosBoton.new("zòrcua", "zorcua.png", "zorcua", Vector2(0.7, 0.1), Vector2(0.30,0.30))
  ], [
  # Revisar las tildes de este.
  DatosBoton.new("gúróc", "guroc.png", "guroc", Vector2(0.4, 0.4), Vector2(0.31, 0.31))
  , DatosBoton.new("bacahúrá", "bacahura.png", "bacahura", Vector2(0.4, 0.7), Vector2(0.7, 0.7))
  , DatosBoton.new("cúntr̈en", "cuntren.png", "cuntren", Vector2(0.1, 0.1), Vector2(0.5, 0.5))
  , DatosBoton.new("t'uèrhuo", "t uerhuo.png", "t uerhuo", Vector2(0.1, 0.7), Vector2(0.55,0.55))
  , DatosBoton.new("fómcuo/pönguó", "fomcuo.png", "fomcuo", Vector2(0.7, 0.7))
  , DatosBoton.new("orsèa", "orsea.png", "orsea", Vector2(0.4, 0.1))
  , DatosBoton.new("igurhuó", "igurhuo.png", "igurhuo", Vector2(0.7, 0.1), Vector2(0.42, 0.42))
  ],
  "Óya dré t'oc é"
  , [
  # Animales con patas. Hay que poner título y partes.

  DatosBoton.new("bagá", "baga.png", "baga", Vector2(0.3, 0.4))
  , DatosBoton.new("shcuè", "shcue.png", "shcue", Vector2(0.5, 0.4))
  , DatosBoton.new("di sár̲ón", "di saron.png", "di saron", Vector2(0.1, 0.1), Vector2(0.6, 0.6))
  , DatosBoton.new("sár̲ón", "saron.png", "saron", Vector2(0.1, 0.7), Vector2(0.6, 0.6))
  , DatosBoton.new("pö̈ngó", "pongo.png", "pongo", Vector2(0.7, 0.7), Vector2(0.83, 0.83))
  , DatosBoton.new("zhg̲úr̲o", "zhguro.png", "zhguro", Vector2(0.7, 0.1))
  ], [
  DatosBoton.new("c'ór scré̈n huága", "c or scren huaga.png", "c or scren huaga", Vector2(0.3, 0.4))
  , DatosBoton.new("śró idó̈n", "sro idon.png", "sro idon", Vector2(0.5, 0.4))
  , DatosBoton.new("idó̈n", "idon.png", "idon", Vector2(0.1, 0.1), Vector2(0.6, 0.6))
  , DatosBoton.new("dúpcuo", "dupcuo.png", "dupcuo", Vector2(0.1, 0.7))
  , DatosBoton.new("srúc", "sruc.png", "sruc", Vector2(0.75, 0.61))
  # Hay 2 de este
  , DatosBoton.new("c'úrí", "c uri.png", "c uri", Vector2(0.7, 0.1))
  ], [
  # Revisar pronunciación
  DatosBoton.new("shcúré", "shcure.png", "shcure", Vector2(0.3, 0.4)) ## INCORRECTO
  , DatosBoton.new("shrí", "shri.png", "shri", Vector2(0.5, 0.4))
  , DatosBoton.new("shtò", "shto.png", "shto", Vector2(0.1, 0.1))
  , DatosBoton.new("susbó", "susbo.png", "susbo", Vector2(0.1, 0.65))
  , DatosBoton.new("zbó", "zbo.png", "zbo", Vector2(0.7, 0.7))
  , DatosBoton.new("shugó", "shugo.png", "shugo", Vector2(0.7, 0.1))
  ], [
  DatosBoton.new("gúrí̈nhuo", "gurinhuo.png", "gurinhuo", Vector2(0.3, 0.4))
  , DatosBoton.new("shró̈n", "shron.png", "shron", Vector2(0.7, 0.74))
  , DatosBoton.new("shcò", "shco.png", "shco", Vector2(0.1, 0.1))
  , DatosBoton.new("só", "so.png", "so", Vector2(0.1, 0.7), Vector2(0.4, 0.4))
  , DatosBoton.new("shúrco", "shurco.png", "shurco", Vector2(0.5, 0.4), Vector2(0.6, 0.6))
  , DatosBoton.new("pè̈nǵra", "pengra.png", "pengra", Vector2(0.7, 0.1), Vector2(0.7, 0.7)) ## FALTA AUDIO
  ], [
  DatosBoton.new("̲ashac", "ashac.png", "ashac", Vector2(0.3, 0.4), Vector2(0.75, 0.75))
  , DatosBoton.new("racú̈n", "racun.png", "racun", Vector2(0.55, 0.4), Vector2(0.75, 0.75))
  , DatosBoton.new("óropgú", "oropgu.png", "oropgu", Vector2(0.1, 0.1), Vector2(0.8, 0.8))
  , DatosBoton.new("qu'iá", "qu ia.png", "qu ia", Vector2(0.1, 0.65), Vector2(0.5, 0.5))
  , DatosBoton.new("bíb", "bib.png", "bib", Vector2(0.73, 0.7))
  , DatosBoton.new("dò", "do.png", "do", Vector2(0.73, 0.1))
  ], [
  DatosBoton.new("yaigó", "yaigo.png", "yaigo", Vector2(0.73, 0.7), Vector2(0.6, 0.6))
  , DatosBoton.new("huonió", "huonio.png", "huonio", Vector2(0.55, 0.4))
  , DatosBoton.new("shúrí̈n", "shurin.png", "shurin", Vector2(0.1, 0.1), Vector2(0.5,0.5))
  , DatosBoton.new("po shúrí̈n", "po shurin.png", "po shurin", Vector2(0.3, 0.35), Vector2(0.7, 0.7))
  , DatosBoton.new("dobó̈nh̲u̲a", "dobonhua.png", "dobonhua", Vector2(0.1, 0.7), Vector2(0.5, 0.5))
  , DatosBoton.new("c'ríro dobó̈n", "c riro dobon.png", "c riro dobon", Vector2(0.73, 0.1))
  ], [
  DatosBoton.new("böbrè̈n", "bobren.png", "bobren", Vector2(0.27, 0.4), Vector2(0.55, 0.55))
  , DatosBoton.new("shúrín dobó̈n", "shurin dobon.png", "shurin dobon", Vector2(0.5, 0.4))
  , DatosBoton.new("dobó̈n täntá̈n/dobó̈n shricshrí", "dobon tantan.png", "dobon tantan", Vector2(0.1, 0.1))
  , DatosBoton.new("shití", "shiti.png", "shiti", Vector2(0.1, 0.7))
  , DatosBoton.new("físcuo", "fiscuo.png", "fiscuo", Vector2(0.7, 0.7))
  , DatosBoton.new("shurí̈nh̲u̲a", "shurinhua.png", "shurinhua", Vector2(0.7, 0.1))
  ], [
  DatosBoton.new("sögrá", "sogra.png", "sogra", Vector2(0.3, 0.4))
  , DatosBoton.new("cuomgrá/cuómcr̈en", "cuomgra.png", "cuomgra", Vector2(0.5, 0.4)) ## Está el otro audio también
  # Hay 2 de este
  , DatosBoton.new("c'úrí", "c uri.png", "c uri", Vector2(0.1, 0.1))
  , DatosBoton.new("nepcuógra", "nepcuogra.png", "nepcuogra", Vector2(0.1, 0.7), Vector2(0.45,0.45))
  , DatosBoton.new("c'orcuó", "c orcuo.png", "c orcuo", Vector2(0.7, 0.7), Vector2(0.65, 0.65))
  , DatosBoton.new("zg̲óh̲u̲o", "zgohuo.png", "zgohuo", Vector2(0.7, 0.1), Vector2(0.75, 0.75))
  ], [
  DatosBoton.new("dié", "die.png", "die", Vector2(0.13, 0.13), Vector2(0.55, 0.55))
  , DatosBoton.new("t'í̈n", "t in.png", "t in", Vector2(0.3, 0.4), Vector2(0.6, 0.6))
  , DatosBoton.new("hué̈nc'ro täntá̈n sí", "huenc ro tantan si.png", "huenc ro tantan si", Vector2(0.5, 0.4), Vector2(0.5, 0.5))
  , DatosBoton.new("hué̈nc'ro qu'esó̈n frünfrú̈n", "huenc ro qu eson frunfrun.png", "huenc ro qu eson frunfrun", Vector2(0.7, 0.1), Vector2(0.5, 0.5))
  , DatosBoton.new("hué̈nc'ro śrérén sí", "huenc ro sreren si.png", "huenc ro sreren si", Vector2(0.1, 0.7), Vector2(0.5,0.5))
  , DatosBoton.new("ćrác", "crac.png", "crac", Vector2(0.7, 0.7), Vector2(0.55, 0.55))
  ], [
  DatosBoton.new("juó̈n", "juon.png", "juon", Vector2(0.1, 0.1), Vector2(0.5, 0.5))
  , DatosBoton.new("dögòbia", "dogobia.png", "dogobia", Vector2(0.4, 0.35), Vector2(0.6, 0.6))
  # El rircuasa no tiene tilde en la i?
  , DatosBoton.new("́rír/́rircuása", "rir.png", "rir", Vector2(0.6, 0.1), Vector2(0.35, 0.35))
  , DatosBoton.new("shcúrcuaco", "shcurcuaco.png", "shcurcuaco", Vector2(0.25, 0.75), Vector2(0.9, 0.9))
  , DatosBoton.new("shúscro", "shuscro.png", "shuscro", Vector2(0.6, 0.75), Vector2(0.9, 0.9))
  #, DatosBoton.new("sh́ró̈n", "shron.png", "shron", Vector2(0.4, 0.6))
] ]

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