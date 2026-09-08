extends CanvasLayer
@onready var player: CharacterBody3D = $"../../../../../../../GameManager/Player"


#get the name of the object
var SPATIAL_2 = preload("uid://bno314oj5cy0")


#search a folder for the specific object in question

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("tester"):
		print("huh??")



func spawn_spatial() -> void:
	add_child(SPATIAL_2)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
