extends Control
@onready var menuopen = false 
@onready var bag: Control = $"."
@onready var selected_item = ""
@onready var buttons: CanvasLayer = $Buttons
const TESTLOGUE = preload("uid://bu1ddu8stknkd")
@onready var game_manager: Node = $"../.."
@onready var held: CanvasLayer = $GridContainer/SubViewportContainer2/SubViewport2/Held

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false

#Inventory should have categories. items, keyItems, 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("bag"):
		print("unpaused")
		if self.visible == false:
			held.spawn_inventory()
			buttons.visible = true
			menuopen = true
			self.visible = menuopen		
		else:
			held.kill_inventory()
			menuopen = false
			buttons.visible = false
			self.visible = menuopen	
