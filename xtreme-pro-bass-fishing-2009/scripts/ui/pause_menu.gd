extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	get_tree().paused = false

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("esc"):
		if get_tree().paused:
			print("unpaused")
			visible = false
			get_tree().paused = false
		else:
			print("HEY!")
			visible = true
			get_tree().paused = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_resume_pressed() -> void:
	visible = false
	get_tree().paused = false
