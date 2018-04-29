extends RichTextLabel

signal action
signal up
signal down

var is_interacting = false

func _ready():
	$"../LineEdit".grab_focus()
	
	add_text("SunMine Corp. (C) 2045")
	newline()
	add_text("SunMine FlyByWire AI")
	newline()
	add_text("AI Mode: SARC104DRK")
	newline()
	newline()
	add_text("- Are you ready? ... It won't matter anyway.")
	newline()

func text_analyzer(new_text):
	if is_interacting == false:
		match new_text:
			"input", "help":
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
			"up":
				emit_signal("up")
			"down":
				emit_signal("down")
	pass

func _on_LineEdit_text_entered(new_text):
	newline()
	add_text(new_text)
	newline()
	$"../LineEdit".clear()
	text_analyzer(new_text)
	pass # replace with function bod