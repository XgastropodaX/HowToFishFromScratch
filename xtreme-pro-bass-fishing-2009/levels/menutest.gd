extends Control
@onready var menuopen = false 
@onready var bag: Control = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("tester"):
		bag.grab_focus()
		print("huh??")
		menuopen = not menuopen
		self.visible = menuopen
