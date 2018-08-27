extends Node
	
func set_text(texto):
	var etiqueta = self.get_child(0).get_child(0)
	assert(etiqueta.is_type("RichTextLabel"))
	etiqueta.set_bbcode("[center]" + texto + "[/center]")
