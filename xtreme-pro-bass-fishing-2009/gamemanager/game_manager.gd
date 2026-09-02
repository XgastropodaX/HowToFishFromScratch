extends Node
@onready var player: CharacterBody3D = $Player
@onready var interaction = 0.0
@onready var tween
@onready var minigaming = false
@onready var instance
@onready var scene
@onready var full_image: TextureRect
@onready var dialogue_interactor
@onready var item_name = ""

func _ready():
	pass
	
func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("tester"):
		pass
		#var scene = load("res://systems/minigame test.tscn")
		#var instance = scene.instantiate()
		#add_child(instance)
		
		#var destination: String
		#if get_tree().current_scene.name == "World":
			#destination = "res://levels/engine_room.tscn"
		#if get_tree().current_scene.name == "engine_room":
			#destination = "res://levels/world.tscn"
		#get_tree().change_scene_to_file(destination)

#Record the speaker's name and the text associated in a dictionary of arrays.
var history: Array = []	
#Records the name of the item from the metadata so it can be displayed in the hud


func _process(delta: float) -> void:
	pass

func teleport(destination,gibble,fade):
	player.moveable = false
	if fade == "y":
		player.audio_stream_player.play()
		player.animation_player.play("fade")
		await player.animation_player.animation_finished
	get_tree().change_scene_to_file(destination)
	

func dialogue(balloon,script,text,interactable):
	player.moveable = false
	var balloon_node = DialogueManager.show_dialogue_balloon_scene(balloon, script, text)
	dialogue_interactor = interactable
	balloon_node.dialogue_change_signal.connect(dialogue_change)
	balloon_node.exterior_change_signal.connect(exterior_change)

func exterior_change(change):
	pass
	
func dialogue_change(next_dialogue):
	print(next_dialogue)
	dialogue_interactor.set_meta("Dialogue",next_dialogue)
	player.moveable = true


func _on_collision_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	pass # Replace with function body.
