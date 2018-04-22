extends RichTextLabel

signal action

var is_interacting = false

func _ready():
	$"../LineEdit".grab_focus()

func text_analyzer(new_text):
	if is_interacting == false:
		match new_text:
			"input":
				add_text("Input List :")
				newline()
				add_text("Movement : move left | move right")
				newline()
				add_text("Type input to show the list again ")
				newline()
			"move left":
				$"../../../..".move("left")
			"move right":
				$"../../../..".move("right")
			"stop":
				$"../../../..".move("stop")
			"clear":
				clear()
			"yes":
				emit_signal("action")
	pass

func _on_LineEdit_text_entered(new_text):
	newline()
	add_text(new_text)
	$"../LineEdit".clear()
	text_analyzer(new_text)
	pass # replace with function bod