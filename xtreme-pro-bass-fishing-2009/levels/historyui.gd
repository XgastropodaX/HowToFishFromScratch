extends Control

@onready var rich_label: RichTextLabel = $RichTextLabel
var histon = false


func show_history() -> void:
	var output_text = ""
	visible = not histon
	for dict in GameManager.history:
		rich_label.text = output_text
		match dict["character"]:
			"Fisher":
				output_text += "[color=#228B22]" + "%s: " % [dict["character"]] + "[/color]" +  "%s\n" % [dict["text"]] 
			"Lovely":
				output_text += "[color=#ff4000]" + "%s: " % [dict["character"]] + "[/color]" +  "%s\n" % [dict["text"]] 
			"Z-tra":
				output_text += "[color=#6A66D9]" + "%s: " % [dict["character"]] + "[/color]" +  "%s\n" % [dict["text"]] 
			"":
				output_text += "%s\n" % [dict["text"]]
			_:
				output_text += "[color=#808080]" + "%s: " % [dict["character"]] + "[/color]" +  "%s\n" % [dict["text"]] 
				

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = histon
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("hist"):
		if histon == false:
			visible = not histon
			print("history on")
			rich_label.modulate.a = 1
			show_history()
		elif histon == true:
			visible = not histon
			print("history off")
			rich_label.modulate.a = 0
		histon = not histon


func _on_history_toggled(toggled_on: bool) -> void:
	if toggled_on:
		print("history on")
		rich_label.modulate.a = 1
		show_history()
	else:
		rich_label.modulate.a = 0
		print("history off")
		visible = false
