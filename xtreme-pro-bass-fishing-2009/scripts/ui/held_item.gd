extends CanvasLayer
@onready var goji: RigidBody3D = $"../../../SubViewportContainer/SubViewport/CanvasLayer/world/boxes/Goji"
@onready var bag: Control = $"../../../.."
@onready var player: CharacterBody3D = $"../../../../../../../Player"
var scene = preload("res://spatial.tscn")
@export var Held_Object: PackedScene

var items_state = items.HAHA

enum items {
	HAHA,
	GOJI,
	CUBE
}



#search a folder for the specific object in question

func change_item(state_name: String) -> void:
		print("change state")
		var upper_name = state_name.to_upper()
		
		if upper_name in items:
			items_state = items.get(upper_name)
			print(items_state)
		match items_state:
			0:
				print("None")
				#var instance = scene.instantiate()
				#add_child(instance)
			1:
				print("Goji")
			2:
				print("Cuob")
			_:
				print("nothin")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(items_state)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
