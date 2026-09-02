extends Control

@onready var rich_label: RichTextLabel = $RichTextLabel
@onready var item_label: RichTextLabel = $PanelContainer/Frame/ItemLabel



#what stores everything. not super efficent. 
func show_history() -> void:
	var output_text = ""
	for dict in GameManager.history:
		rich_label.text = output_text
		match dict["character"]:
			"Fisher":
				output_text += "[color=#228B22]" + "%s: " % [dict["character"]] + "[/color]" +  "%s\n" % [dict["text"]] 
			"Lovely":
				output_text += "[color=#ff4000]" + "%s: " % [dict["character"]] + "[/color]" +  "%s\n" % [dict["text"]] 
			"Z-tra":
				output_text += "[color=#6A66D9]" + "%s: " % [dict["character"]] + "[/color]" +  "%s\n" % [dict["text"]] 
			_:
				output_text += "%s\n" % [dict["text"]]
	



func _on_settings_pressed() -> void:
	print("settings")


func _on_catalogue_pressed() -> void:
	print("catalogue")

#Button for history prototype
func _on_history_toggled(toggled_on: bool) -> void:
	if toggled_on:
		print("history on")
		rich_label.modulate.a = 1
		show_history()
	else:
		rich_label.modulate.a = 0
		print("history off")
