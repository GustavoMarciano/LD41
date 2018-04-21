extends RichTextLabel

func text_analyzer(new_text):
	match new_text:
		"input":
			newline()
			add_text("Input List :")
			newline()
			add_text("Movement : move left | move right")
			newline()
			add_text("Type input to show the list again ")
		"move left":
			$"../..".move("left")
		"move right":
			$"../..".move("right")
		"stop":
			$"../..".move("stop")
	
	pass

func _on_LineEdit_text_entered(new_text):
	newline()
	add_text(new_text)
	$"../LineEdit".clear()
	text_analyzer(new_text)
	pass # replace with function body
