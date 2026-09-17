extends Control
@onready var menuopen = false 
@onready var bag: Control = $"."
@onready var selected_item = ""


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("bag"):
		print("unpaused")
		if self.visible == false:
			menuopen = true
			self.visible = menuopen		
		else:
			menuopen = false
			self.visible = menuopen	


func _on_button_pressed() -> void:
	print("helloworld")
