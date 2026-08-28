extends Control

@onready var objective: RichTextLabel = $MarginContainer/Play

@onready var rich_label: RichTextLabel = $RichTextLabel

func show_history() -> void:
	var output_text = ""
	for dict in History.history:
		if dict["character"] == "":
			output_text += "%s\n" % [dict["text"]]
		else: 
			output_text += "%s: %s\n" % [dict["character"], dict["text"]]
	rich_label.text = output_text

func _on_settings_pressed() -> void:
	print("settings")




func _on_catalogue_pressed() -> void:
	print("catalogue")


func _on_history_toggled(toggled_on: bool) -> void:
	if toggled_on:
		print("history on")
		rich_label.modulate.a = 1
		show_history()
	else:
		rich_label.modulate.a = 0
		print("history off")
