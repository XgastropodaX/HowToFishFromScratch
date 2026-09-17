extends Area3D
@onready var model: MeshInstance3D = $"../Box Spring"
@onready var distance = 6
@onready var click_distance = get_meta("Click_Distance")
@onready var highlight = false
@onready var menus: CanvasLayer = $"../../../GameManager/Menus"
@onready var head: Node3D = $".."
@onready var player: CharacterBody3D = $"../../../GameManager/Player"
@onready var game_manager: Node = $"../../../GameManager"
@export var highlight_material: Material


var highlight_mat: StandardMaterial3D = \
	preload('res://materials/2new_standard_material_3d.tres')
var materials: Array[StandardMaterial3D]
var og_materials: Dictionary = {}

#Gets the original Materials of the objects being highlighted.
func _store_materials(node: Node):
	for child in node.get_children():
		if child is MeshInstance3D:
			og_materials[child] = child.material_override
	
func _ready() -> void:
	self.call_deferred("connection")
	
func connection():
	for i in model.get_surface_override_material_count():
		materials.append(model.get_surface_override_material(i))
	mouse_entered.connect(toggle_highlight.bind(head, true))
	mouse_exited.connect(toggle_highlight.bind(head, false))
	player.movement.connect(check_highlight)
	
	
func toggle_highlight(node: Node, on: bool):
	if on:
		highlight = true
		distance = abs((model.global_position.x - $"../../../GameManager/Player".global_position.x)) + abs((model.global_position.z - $"../../../GameManager/Player".global_position.z))
		print(distance)
		if distance < click_distance:
			for child in node.get_children():
				if child is MeshInstance3D:
					if on:
						child.material_override = highlight_mat
					else: 
						child.material_override = og_materials.get(child)
					
	else:
		highlight = false
		for child in node.get_children():
			if child is MeshInstance3D:
				child.material_override = og_materials.get(child)


func check_highlight():
	if highlight:
		print("highlight")
		distance = abs((model.global_position.x - $"../../../GameManager/Player".global_position.x)) + abs((model.global_position.z - $"../../../GameManager/Player".global_position.z))
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


func _on_mouse_entered() -> void:
	_store_materials(head)
	menus.item_label.text = get_meta("Name")

	


func _on_mouse_exited() -> void:
	menus.item_label.text = "_"
