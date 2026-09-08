extends Area3D
@onready var model: MeshInstance3D = $".."
@onready var game_manager: Node = $"../../../../GameManager"
@onready var distance = 6
@onready var click_distance = get_meta("Click_Distance")
@onready var player: CharacterBody3D = $"../../../../GameManager/Player"

@onready var highlight = false


func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if (event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and distance < click_distance and player.moveable):
		print("click")
		var BALLOON = load(get_meta("Balloon"))
		var SCRIPT = load(get_meta("Script"))
		var DIALOGUE = get_meta("Dialogue")
		game_manager.dialogue(BALLOON,SCRIPT,DIALOGUE,self)


func _on_mouse_entered() -> void:
	player.menus.item_label.text = get_meta("Name")

	


func _on_mouse_exited() -> void:
	player.menus.item_label.text = "_"
