extends Control

@onready var objective: RichTextLabel = $MarginContainer/Play


func _on_settings_pressed() -> void:
	print("settings")


func _on_history_pressed() -> void:
	print("history")


func _on_catalogue_pressed() -> void:
	print("catalogue")
