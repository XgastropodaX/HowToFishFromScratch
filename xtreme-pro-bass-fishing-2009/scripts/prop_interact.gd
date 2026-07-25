extends Area3D
@onready var model: MeshInstance3D = $".."
@onready var game_manager: Node = $"../../../../GameManager"
@onready var distance = 6
@onready var click_distance = get_meta("Click_Distance")
@onready var player: CharacterBody3D = $"../../../../GameManager/Player"
@onready var highlight = false

var highlight_mat: StandardMaterial3D = \
	preload('res://materials/2new_standard_material_3d.tres')
var materials: Array[StandardMaterial3D]
	
	
func _ready() -> void:
	self.call_deferred("connection")
	
func connection():
	for i in model.get_surface_override_material_count():
		materials.append(model.get_surface_override_material(i))
	mouse_entered.connect(toggle_highlight.bind(true))
	mouse_exited.connect(toggle_highlight.bind(false))
	player.movement.connect(check_highlight)
	
	
func toggle_highlight(on: bool):
	if on:
		highlight = true
		distance = abs((model.global_position.x - $"../../../../GameManager/Player".global_position.x)) + abs((model.global_position.z - $"../../../../GameManager/Player".global_position.z))
		print(distance)
		if distance < click_distance:
			for i in materials.size():
				model.set_surface_override_material(i, highlight_mat)
	else:
		highlight = false
		for i in materials.size():
				model.set_surface_override_material(i, materials[i])

func check_highlight():
	if highlight:
		print("highlight")
		distance = abs((model.global_position.x - $"../../../../GameManager/Player".global_position.x)) + abs((model.global_position.z - $"../../../../GameManager/Player".global_position.z))
		print(distance)
		if distance < click_distance:
			for i in materials.size():
				model.set_surface_override_material(i, highlight_mat)
		else:
			for i in materials.size():
				model.set_surface_override_material(i, materials[i])

func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if (event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and distance < click_distance and player.moveable):
		print("click")
		var BALLOON = load(get_meta("Balloon"))
		var SCRIPT = load(get_meta("Script"))
		var DIALOGUE = get_meta("Dialogue")
		game_manager.dialogue(BALLOON,SCRIPT,DIALOGUE,self)
