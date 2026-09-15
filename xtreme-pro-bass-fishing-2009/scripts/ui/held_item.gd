extends CanvasLayer
#@onready var player: CharacterBody3D = $"../../../../../../../Player"

@onready var goji: RigidBody3D = $"../../../SubViewportContainer/SubViewport/CanvasLayer/world/boxes/Goji"
@onready var bag: Control = $"../../../.."
@onready var player: CharacterBody3D = $"../../../../../../../Player"

@export var Held_Object: PackedScene

var items_state: items = items.Goji

enum items {
	Goji,
	Cube
}


#get the name of the object
var SPATIAL_2 = preload("uid://bno314oj5cy0")


#search a folder for the specific object in question

func change_item():
		print("change state")



func spawn_spatial() -> void:
	add_child(SPATIAL_2)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if (event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT):
		#var current_item = bag.selected_item
		#items_state = goji.get_meta("State")
		print("changestate")
