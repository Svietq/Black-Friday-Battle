extends RichTextLabel
var i = 0

func _process(delta):
	i+=delta
	self.text = String(i)