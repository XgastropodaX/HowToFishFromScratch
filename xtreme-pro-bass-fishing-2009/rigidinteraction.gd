extends RigidBody3D

@onready var distance = 6
@onready var click_distance = get_meta("Click_Distance")
@onready var highlight = false
@onready var game_manager: Node = $"../../../../../../../../../.."
@onready var menus: CanvasLayer = $"../../../../../../../../../../Menus"
@onready var bag: Control = $"../../../../../../.."
@onready var player: CharacterBody3D = $"../../../../../../../../../../Player"
@onready var held: CanvasLayer = $"../../../../../../SubViewportContainer2/SubViewport2/Held"
@onready var model: MeshInstance3D = $MeshInstance3D

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
		distance = abs((model.global_position.x - $"../../../../../../../../../../Player".global_position.x)) + abs((model.global_position.z - $"../../../../../../../../../../Player".global_position.z))
		print(distance)
		if distance < click_distance:
			for i in materials.size():
				model.set_surface_override_material(i, highlight_mat)
	else:
		menus.item_label.text = "_"
		highlight = false
		for i in materials.size():
				model.set_surface_override_material(i, materials[i])

func check_highlight():
	if highlight:
		print("highlight")
		distance = abs((model.global_position.x - $"../../../../../../../../../../Player".global_position.x)) + abs((model.global_position.z - $"../../../../../../../../../../Player".global_position.z))
		print(distance)
		if distance < click_distance:
			for i in materials.size():
				model.set_surface_override_material(i, highlight_mat)
		else:
			for i in materials.size():
				model.set_surface_override_material(i, materials[i])
	
	
	


func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event.is_action("click") and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and distance < click_distance and player.moveable and not event.is_echo():
		held.change_item(get_meta("State"))



func _on_mouse_entered() -> void:
	menus.item_label.text = get_meta("Name")
	bag.selected_item = get_meta("Name")


func _on_mouse_exited() -> void:
	menus.item_label.text = "_"
