extends Area3D
@onready var distance = 6
@onready var click_distance = get_meta("Click_Distance")
@onready var highlight = false
@onready var menus: CanvasLayer = $"../../../GameManager/Menus"
@onready var head: Node3D = $".."
@onready var player: CharacterBody3D = $"../../../GameManager/Player"
@onready var game_manager: Node = $"../../../GameManager"
@export var highlight_material: Material
@onready var inventory: CanvasLayer = $"../../../GameManager/Inventory"





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
	mouse_entered.connect(toggle_highlight.bind(head, true))
	mouse_exited.connect(toggle_highlight.bind(head, false))
	
	
func toggle_highlight(node: Node, on: bool):
	if on:
		highlight = true
		distance = abs((self.global_position.x - $"../../../GameManager/Player".global_position.x)) + abs((self.global_position.z - $"../../../GameManager/Player".global_position.z))
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




func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if (event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and distance < click_distance and player.moveable):
		var BALLOON = load(get_meta("Balloon"))
		var SCRIPT = load(get_meta("Script"))
		var DIALOGUE = get_meta("Dialogue")
		game_manager.dialogue(BALLOON,SCRIPT,DIALOGUE,self)



func _on_mouse_entered() -> void:
	_store_materials(head)
	menus.item_label.text = get_meta("Name")

	


func _on_mouse_exited() -> void:
	menus.item_label.text = "_"
