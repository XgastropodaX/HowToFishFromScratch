extends Area3D

@export var target_position: Vector3 = Vector3(0, 4.532, 0)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_entered(body: Node3D) -> void:
	print("gotcha")
	body.global_position = target_position
