extends CanvasLayer
@onready var bag: Control = $"../../../.."
const GOJI_SCENE = preload("res://spatial.tscn")
const CUBE_SCENE = preload("res://spatial_2.tscn")
@export var Held_Object: PackedScene
@onready var player: CharacterBody3D = $"../../../../../../Player"

const goji_item = preload("res://items/goji.tscn")
const cube_item = preload("res://items/cube.tscn")

var items_state = items.NONE

enum items {
	NONE,
	GOJI,
	CUBE
}

var inventory = {}

func add_item(key:String, value:String):
	inventory.set(key, value)


func spawn_inventory():
	for inventory_item in inventory:
		match inventory:
			{"item": "goji", ..}:
				var instance = goji_item.instantiate()
				$"../../../SubViewportContainer/SubViewport/CanvasLayer/world/boxes".add_child(instance)
				instance.global_position = $"../../../SubViewportContainer/SubViewport/CanvasLayer/spawnmarker".global_position
				instance.add_to_group("inventory")
				await get_tree().create_timer(0.3).timeout
			{"type": "cube", ..}:
				var instance = cube_item.instantiate()
				$"../../../SubViewportContainer/SubViewport/CanvasLayer/world/boxes".add_child(instance)
				instance.global_position = $"../../../SubViewportContainer/SubViewport/CanvasLayer/spawnmarker".global_position
				instance.add_to_group("inventory")
				await get_tree().create_timer(0.2).timeout
			_:
				print("you fucked it up!")

func kill_inventory():
	get_tree().call_group("inventory", "queue_free")
	

#search a folder for the specific object in question

func change_item(state_name: String) -> void:
		get_tree().call_group("held", "queue_free")
		print("change state")
		var upper_name = state_name.to_upper()
		
		
		if upper_name in items:
			items_state = items.get(upper_name)
			print(items_state)
		match items_state:
			0:
				print("none")
			1:
				print("Goji")
				var instance = GOJI_SCENE.instantiate()
				$Held/Camera3D.add_child(instance)
				instance.global_position = $Held/Camera3D/CameraMarker.global_position
				instance.add_to_group("held")
			2:
				print("Cuob")
				var instance = CUBE_SCENE.instantiate()
				$Held/Camera3D.add_child(instance)
				instance.global_position = $Held/Camera3D/CameraMarker.global_position
				instance.add_to_group("held")
			_:
				print("nothin")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(items_state)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_taste_pressed() -> void:
	pass # Replace with function body.
