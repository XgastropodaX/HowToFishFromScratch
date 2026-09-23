extends Control
@onready var game_manager: Node = $"../../../.."
@onready var BALLOON = ""
@onready var SCRIPT = ""
@onready var DIALOGUE = ""
@onready var held: CanvasLayer = $"../../GridContainer/SubViewportContainer2/SubViewport2/Held"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_taste_pressed() -> void:
	game_manager.dialogue(load(BALLOON),load(SCRIPT),DIALOGUE+"_taste",self)


func _on_smell_pressed() -> void:
	game_manager.dialogue(load(BALLOON),load(SCRIPT),DIALOGUE+"_smell",self)


func _on_touch_pressed() -> void:
	game_manager.dialogue(load(BALLOON),load(SCRIPT),DIALOGUE+"_touch",self)


func _on_listen_pressed() -> void:
	game_manager.dialogue(load(BALLOON),load(SCRIPT),DIALOGUE+"_listen",self)
