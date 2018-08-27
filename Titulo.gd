extends Node
	
func set_text(texto):
	self.get_child(0).get_child(0).set_bbcode("[center]" + texto + "[/center]")
