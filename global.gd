extends Node
var current_scene = null

# Botón individual con título y texto.
class DatosBoton:
	var textoPorMostrar
	var nombreTextura
	var nombreSonido
	var pos # Del margen superior izquierdo (ojo: las partes no se acomodan igual)
	var escalado
	func _init (textoPorMostrar, nomTex, nomSon, pos = Vector2(0.2,0.2), escalado = Vector2(0.4, 0.4)):
		self.textoPorMostrar = textoPorMostrar
		self.nombreTextura = nomTex
		self.nombreSonido = nomSon
		self.escalado = escalado
		self.pos = pos

class ParteAnimal:
	var textoPorMostrar
	var nombreSonido
	var pos
	func _init(textoPorMostrar, nomSon, pos = Vector2(0.5, 0.5)):
		self.textoPorMostrar = textoPorMostrar
		self.nombreSonido = nomSon
		self.pos = pos

class PartesAnimal:
	var nombreTextura
	var partes
	var pos # Del centro de la figura, a diferencia de los DatosBoton que sí usan el margen superior izquierdo
	var escalado
	func _init(nomTex, partes = [], pos = Vector2(0.4, 0.4), escalado = Vector2(0.5, 0.5)):
		self.nombreTextura = nomTex
		self.escalado = escalado
		self.pos = pos
		self.partes = partes

var botones = [ 
  "Díro isó"
  , [
    PartesAnimal.new("zbonte.png"
      , [
        ParteAnimal.new("dabú cró", "bomcuo dabu cro", Vector2(0.248, 0.468))
        , ParteAnimal.new("frác", "bomcuo frac", Vector2(0.39, 0.468))
      ], Vector2(0.3, 0.3), Vector2(0.6, 0.6))
    , PartesAnimal.new("c uehuo.png"
      , [
        ParteAnimal.new("cuóta", "c uehuo cuota", Vector2(0.667, 0.81))
    ], Vector2(0.66, 0.66), Vector2(0.6, 0.6))
  ]
  , [
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
  DatosBoton.new("shuóhuo", "shuohuo.png", "shuohuo", Vector2(0.4, 0.4), Vector2(0.9, 0.9))
  , DatosBoton.new("zhír", "zhir.png", "zhir", Vector2(0.7, 0.1), Vector2(0.9, 0.9))
  , DatosBoton.new("dióhuo", "diohuo.png", "diohuo", Vector2(0.1, 0.1), Vector2(0.95, 0.95))
  , DatosBoton.new("́sró̈n", "sron.png", "sron", Vector2(0.1, 0.7), Vector2(0.75, 0.75))  ## FALTA AUDIO
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
    PartesAnimal.new("c rizuo.png"
      , [
        ParteAnimal.new("cohuo", "cohuo", Vector2(0.54, 0.175))
        , ParteAnimal.new("dregró/dré", "dre", Vector2(0.55, 0.33))
        , ParteAnimal.new("frác", "frac 2", Vector2(0.27, 0.35)) # Ojo es distinto el del pájaro a otros
        , ParteAnimal.new("sogó", "sogo", Vector2(0.285, 0.165))
      ], Vector2(0.45, 0.2), Vector2(0.6, 0.6))
    , PartesAnimal.new("guroc.png"
      , [
        ParteAnimal.new("shú", "shu", Vector2(0.31, 0.75))
    ], Vector2(0.2, 0.65), Vector2(0.3, 0.3))
    , PartesAnimal.new("zorcua.png"
      , [
        ParteAnimal.new("zó̈n", "zorcua zon", Vector2(0.62, 0.5))
    ], Vector2(0.75, 0.75), Vector2(0.55, 0.55))
  ]
  , [
  # Aves. Hay que poner título y partes.
  DatosBoton.new("zrú̈n", "zrun.png", "zrun", Vector2(0.4, 0.7))
  , DatosBoton.new("iró̈n", "iron.png", "iron", Vector2(0.4, 0.4))
  # Revisar si pongo gúr̈eniá nada más.
  , DatosBoton.new("gúr̈eniá", "gurenia.png", "gurenia", Vector2(0.1, 0.1), Vector2(0.45, 0.45))
  , DatosBoton.new("ó̈n", "on.png", "on", Vector2(0.1, 0.7)) ## FALTA AUDIO
  # Ojo que tiene subrayado.
  , DatosBoton.new("́r̲oshc̈̈ö/ár̲á", "roshco.png", "roshco", Vector2(0.7, 0.7), Vector2(0.55, 0.55))
  , DatosBoton.new("gúr̈efün", "gurefun.png", "gurefun", Vector2(0.4, 0.1))
  , DatosBoton.new("t̲agá", "taga.png", "taga", Vector2(0.7, 0.1))
  ], [  
  DatosBoton.new("dö fú̈n", "do fun.png", "do fun", Vector2(0.3, 0.4), Vector2(0.63,0.63))
  , DatosBoton.new("c'rízuo", "c rizuo.png", "c rizuo", Vector2(0.5, 0.4), Vector2(0.65, 0.65))
  , DatosBoton.new("dünhuó", "dunhuo.png", "dunhuo", Vector2(0.1, 0.1), Vector2(0.5, 0.5))
  , DatosBoton.new("́r̲oshcöhua", "roshcohua.png", "roshcohua", Vector2(0.1, 0.65), Vector2(0.15, 0.15))
  , DatosBoton.new("púpcuo", "pupcuo.png", "pupcuo", Vector2(0.7, 0.1), Vector2(0.5, 0.5))
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
    PartesAnimal.new("gurinhuo.png"
      , [
        ParteAnimal.new("sápcuóta", "sapcuo 1", Vector2(0.175, 0.05))
      ], Vector2(0.2, 0.32), Vector2(0.3, 0.3))
    , PartesAnimal.new("shurin.png"
      , [
        ParteAnimal.new("sò", "so", Vector2(0.74, 0.14))
    ], Vector2(0.65, 0.2), Vector2(0.5, 0.5))
    , PartesAnimal.new("die.png"
      , [
        ParteAnimal.new("sác", "die sac", Vector2(0.082, 0.63))
        , ParteAnimal.new("shú", "die shu", Vector2(0.324, 0.8))
    ], Vector2(0.24, 0.75), Vector2(0.5, 0.5))
    , PartesAnimal.new("cuomgra.png"
      , [
        ParteAnimal.new("sápcuóta", "cuomgra sapcuo", Vector2(0.43, 0.83))
    ], Vector2(0.7, 0.75), Vector2(0.4, 0.4))
  ]
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


# De acá para abajo es el códido de cambio de escenas de ejemplo de Singletons de Godot

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child( root.get_child_count() -1 )
	#set_process(true)

func _process(delta):
	print(get_viewport().get_mouse_pos() / get_viewport().get_rect().size)

func goto_scene(path):

	# This function will usually be called from a signal callback,
	# or some other function from the running scene.
	# Deleting the current scene at this point might be
	# a bad idea, because it may be inside of a callback or function of it.
	# The worst case will be a crash or unexpected behavior.
	
	# The way around this is deferring the load to a later time, when
	# it is ensured that no code from the current scene is running:
	call_deferred("_deferred_goto_scene",path)


func _deferred_goto_scene(path):

    # Immediately free the current scene,
    # there is no risk here.
    current_scene.free()

    # Load new scene
    var s = ResourceLoader.load(path)

    # Instance the new scene
    current_scene = s.instance()

    # Add it to the active scene, as child of root
    get_tree().get_root().add_child(current_scene)

    # optional, to make it compatible with the SceneTree.change_scene() API
    get_tree().set_current_scene( current_scene )


