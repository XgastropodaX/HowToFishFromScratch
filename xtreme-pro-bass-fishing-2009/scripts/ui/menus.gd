extends CanvasLayer

@onready var item_label: RichTextLabel = $HUD/HUD/PanelContainer/Frame/ItemLabel
@onready var inspect_item = ""


enum MenuState {
	Closed,
	Pause,
	History,
	Bag,
	Dialogue
}

@onready var PlayerState = MenuState.Closed
var dialogue_running = false

func setmenustate()-> void:
	match [PlayerState, dialogue_running]:
		MenuState.Closed:
			print("nothing")
		MenuState.Pause:
			print("pause")
		MenuState.History:
			print("history")
		MenuState.Bag:
			print("Bag")
		MenuState.Dialogue:
			print("Talkin")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#func _on_button_pressed() -> void:
	#held.spawn_spatial()
	
