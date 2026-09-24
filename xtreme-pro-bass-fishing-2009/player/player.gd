extends CharacterBody3D

signal movement
@onready var forward = $beams/fBeam
@onready var uforward = $beams/fUbeam
@onready var dforward = $beams/fDbeam
@onready var backward = $beams/bBeam
@onready var ubackward = $beams/bUbeam
@onready var dbackward = $beams/bDbeam
@onready var left = $beams/lBeam
@onready var uleft = $beams/lUbeam
@onready var dleft = $beams/lDbeam
@onready var right = $beams/rBeam
@onready var uright = $beams/rUbeam
@onready var dright = $beams/rDbeam
@onready var camera = $head/SubViewportContainer/SubViewport/Camera3D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var special_light: OmniLight3D = $head/OmniLight3D
@onready var menus: CanvasLayer = $"../Menus"
@onready var game_manager: Node = $".."
@onready var moveable = true
@onready var x_plus = 0
@onready var z_plus = 0
@onready var captain_path = 0.0



var direction = Vector3.FORWARD
var is_animating = false

var movespeed = 0.75

func _ready():
	game_manager.player = self

################################################################################
# Move Forward to next box
################################################################################
func moveForward():
	if $beams/fBeam.is_colliding():
		var gibble = forward.get_collider()
		if not gibble.get_meta("Interaction") == null:
			is_animating = true
			moveable = false
			var tween :=create_tween()
			var collision_point: Vector3 = gibble.global_position
			tween.tween_property(self,"global_position", collision_point, movespeed)
			await tween.finished
			movement.emit()
			is_animating = false
			moveable = true
			rotation_fix()
			gibble_interaction(gibble,true,"forward")
		else: blockade_interaction(gibble)
	elif $beams/fUbeam.is_colliding():
		is_animating = true
		var tween :=create_tween()
		var collision_point: Vector3 = uforward.get_collider().global_position
		tween.tween_property(self,"global_position", collision_point, movespeed)
		is_animating = false
	elif $beams/fDbeam.is_colliding():
		is_animating = true
		var tween :=create_tween()
		var collision_point: Vector3 = dforward.get_collider().global_position
		tween.tween_property(self,"global_position", collision_point, movespeed)
		is_animating = false
################################################################################
# Move Back
################################################################################
func moveBack():
	if $beams/bBeam.is_colliding():
		var gibble = backward.get_collider()
		if not gibble.get_meta("Interaction") == null:
			is_animating = true
			moveable = false
			var tween :=create_tween()
			var collision_point: Vector3 = gibble.global_position
			tween.tween_property(self,"global_position", collision_point, movespeed)
			await tween.finished
			movement.emit()
			is_animating = false
			moveable = true
			rotation_fix()
			gibble_interaction(gibble,true,"backward")
		else: blockade_interaction(gibble)
	elif $beams/bUbeam.is_colliding():
		is_animating = true
		var tween :=create_tween()
		var collision_point: Vector3 = ubackward.get_collider().global_position
		tween.tween_property(self,"global_position", collision_point, movespeed)
		is_animating = false
	elif $beams/bDbeam.is_colliding():
		is_animating = true
		var tween :=create_tween()
		var collision_point: Vector3 = dbackward.get_collider().global_position
		tween.tween_property(self,"global_position", collision_point, movespeed)
		is_animating = false
################################################################################
# Move Left
################################################################################
func moveLeft():
	if $beams/lBeam.is_colliding():
		var gibble = left.get_collider()
		if not gibble.get_meta("Interaction") == null:
			is_animating = true
			moveable = false
			var tween :=create_tween()
			var collision_point: Vector3 = gibble.global_position
			tween.tween_property(self,"global_position", collision_point, movespeed)
			await tween.finished
			movement.emit()
			is_animating = false
			moveable = true
			rotation_fix()
			gibble_interaction(gibble,true,"left")
		else: blockade_interaction(gibble)
	elif $beams/lUbeam.is_colliding():
		is_animating = true
		var tween :=create_tween()
		var collision_point: Vector3 = uleft.get_collider().global_position
		tween.tween_property(self,"global_position", collision_point, movespeed)
		is_animating = false
	elif $beams/lDbeam.is_colliding():
		is_animating = true
		var tween :=create_tween()
		var collision_point: Vector3 = dleft.get_collider().global_position
		tween.tween_property(self,"global_position", collision_point, movespeed)
		is_animating = false
################################################################################
# Move right
################################################################################
func moveRight():
	if $beams/rBeam.is_colliding():
		var gibble = right.get_collider()
		if not gibble.get_meta("Interaction") == null:
			is_animating = true
			moveable = false
			var tween :=create_tween()
			var collision_point: Vector3 = gibble.global_position
			tween.tween_property(self,"global_position", collision_point, movespeed)
			await tween.finished
			movement.emit()
			is_animating = false
			moveable = true
			rotation_fix()
			gibble_interaction(gibble,true,"right")
		else: blockade_interaction(gibble)
	elif $beams/rUbeam.is_colliding():
		is_animating = true
		var tween :=create_tween()
		var collision_point: Vector3 = uright.get_collider().global_position
		tween.tween_property(self,"global_position", collision_point, movespeed)
		is_animating = false
	elif $beams/rDbeam.is_colliding():
		is_animating = true
		var tween :=create_tween()
		var collision_point: Vector3 = dright.get_collider().global_position
		tween.tween_property(self,"global_position", collision_point, movespeed)
		is_animating = false
################################################################################
# Turning Left!
################################################################################
func turnLeft():
	is_animating = true
	moveable = false
	var tween :=create_tween()
	tween.tween_property(self, "rotation:y", deg_to_rad(90), movespeed).as_relative()
	await tween.finished
	movement.emit()
	is_animating = false
	moveable = true
	rotation_fix()
################################################################################
# Turning Right!
#################################################a###############################
func turnRight():
	is_animating = true
	moveable = false
	var tween :=create_tween()
	tween.tween_property(self, "rotation:y", deg_to_rad(-90), movespeed).as_relative()
	await tween.finished
	movement.emit()
	is_animating = false
	moveable = true
	
	rotation_fix()
################################################################################
# FIX THAT ROTATION!
################################################################################
func rotation_fix():
	if rotation_degrees.y > 260 and rotation_degrees.y < 280 or rotation_degrees.y > -100 and rotation_degrees.y < -80:
		rotation_degrees.y = 270
	elif rotation_degrees.y > 170 and rotation_degrees.y < 190 or rotation_degrees.y > -190 and rotation_degrees.y < -170:
		rotation_degrees.y = 180
	elif rotation_degrees.y > 80 and rotation_degrees.y < 100 or rotation_degrees.y > -280 and rotation_degrees.y < -260:
		rotation_degrees.y = 90
	else: rotation_degrees.y = 0
	print(rotation_degrees)
################################################################################
# Sprinting!
################################################################################
func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("sprint"):
		movespeed = 0.65
	if event.is_action_released("sprint"):
		movespeed = 0.75
	if moveable:
		if is_animating:
				return 
		elif event.is_action_pressed("forward"):
			moveForward()
		elif event.is_action_pressed("backward"):
			moveBack()
		elif event.is_action_pressed("left"):
			moveLeft()
		elif event.is_action_pressed("right"):
			moveRight()
		elif event.is_action_pressed("lamera"):
			turnLeft()
		elif event.is_action_pressed("ramera"):
			turnRight()
################################################################################
# Gibble Interactions!
################################################################################
func gibble_interaction(gibble,disable,directions):
	match gibble.get_meta("Interaction"):
			2.0: #Teleport Trigger
				game_manager.teleport(gibble.get_meta("Resource"),gibble,gibble.get_meta("Text"))
			3.0: #Dialogue Trigger
				var SCRIPT = load(gibble.get_meta("Resource"))
				var BALLOON = load(gibble.get_meta("Balloon"))
				game_manager.dialogue(BALLOON,SCRIPT,gibble.get_meta("Text"),self)
				gibble.set_meta("Interaction",0.0)
			4.0: #Turn Left
				turnLeft()
				gibble.set_meta("Interaction",0.0)
			5.0: #Turn Right
				turnRight()
				gibble.set_meta("Interaction",0.0)
			6.0: #Animate Something!
				game_manager.animation_player(gibble.get_meta("Resource"),gibble.get_meta("Text"),gibble.get_meta("Balloon"))
			7.0: #Many At Once!
				match gibble.get_meta("Resource"):
					#####Chapter 1####
					"testgibble":
						match directions:
							"forward":
								turnLeft()
								await turnLeft()
								moveable = false
							"backward":
								turnRight()
								await turnRight()
								moveable = false
							"left":
								turnLeft()
								await turnLeft()
								turnLeft()
								await turnLeft()
								moveable = false
							"right":
								pass
						var balloon = load("res://dialogue/Talking Balloon/balloon.tscn")
						var script = load("res://Dialogue/writing/test.dialogue")
						game_manager.dialogue(balloon,script,"cutTest",self)
						gibble.set_meta("Interaction",0.0)
					#"ch1A_delia_1":
						#match directions:
							#"forward":
								#turnLeft()
								#await turnLeft()
								#moveable = false
							#"backward":
								#turnRight()
								#await turnRight()
								#moveable = false
							#"left":
								#turnLeft()
								#await turnLeft()
								#turnLeft()
								#await turnLeft()
								#moveable = false
							#"right":
								#pass
						#var balloon = load("res://dialogue/Talking Balloon/balloon.tscn")
						#var script = load("res://dialogue/Script/chapter1_ship.dialogue")
						#game_manager.dialogue(balloon,script,"delia_cutscene",self)
						#gibble.set_meta("Interaction",0.0)
						#$"../../blockades/blockade7".global_position.y = 3
						#$"../../gibblezone/engiegib2/gibble5".set_meta("Interaction",6.0)
					#"ch1_scienist_1":
						#match directions:
							#"forward":
								#pass
							#"backward":
								#turnRight()
								#await turnRight()
								#turnRight()
								#await turnRight()
								#moveable = false
							#"left":
								#turnLeft()
								#await turnLeft()
								#moveable = false
							#"right":
								#turnRight()
								#await turnRight()
								#moveable = false
						#var balloon = load("res://dialogue/Talking Balloon/balloon.tscn")
						#var script = load("res://dialogue/Script/chapter1_ship.dialogue")
						#game_manager.dialogue(balloon,script,"scientist_cutscene",self)
						#$"../../blockades/blockade8".global_position.y = 1.171
						#$"../../Interactable Characters/Models/Heidi".queue_free()
						#gibble.set_meta("Interaction",0.0)
					#####Chapter 2####
					#"ch2_simon_1":
						#match directions:
							#"forward":
								#turnLeft()
								#await turnLeft()
								#moveable = false
							#"backward":
								#turnRight()
								#await turnRight()
								#moveable = false
							#"left":
								#turnLeft()
								#await turnLeft()
								#turnLeft()
								#await turnLeft()
								#moveable = false
							#"right":
								#pass
						#var balloon = load("res://dialogue/Talking Balloon/balloon.tscn")
						#var script = load("res://dialogue/Script/chapter2_ship.dialogue")
						#game_manager.dialogue(balloon,script,"simon_cutscene",self)
						#match str(get_path_to(gibble)):
							#"../../gibblezone/rec/gibble104":
								#$"../../Interactable Characters/Models/Ztra".queue_free()
								#$"../../Interactable Characters/Models/Ztra2".queue_free()
							#"../../gibblezone/hangargiib/gibble13":
								#$"../../Interactable Characters/Models/Ztra2".queue_free()
								#$"../../Interactable Characters/Models/Ztra3".queue_free()
							#"../../gibblezone/operations/gibble149":
								#$"../../Interactable Characters/Models/Ztra".queue_free()
								#$"../../Interactable Characters/Models/Ztra3".queue_free()
						#$"../../gibblezone/rec/gibble104".set_meta("Interaction",6.0)
						#$"../../gibblezone/rec/gibble104".set_meta("Resource","open_door")
						#$"../../gibblezone/hangargiib/gibble13".set_meta("Interaction",6.0)
						#$"../../gibblezone/hangargiib/gibble13".set_meta("Resource","open_door")
						#$"../../gibblezone/operations/gibble149".set_meta("Interaction",6.0)
						#$"../../gibblezone/operations/gibble149".set_meta("Resource","open_door")
					#"ch2_delia_2":
						#match directions:
							#"forward":
								#turnLeft()
								#await turnLeft()
								#moveable = false
							#"backward":
								#turnRight()
								#await turnRight()
								#moveable = false
							#"left":
								#turnLeft()
								#await turnLeft()
								#turnLeft()
								#await turnLeft()
								#moveable = false
							#"right":
								#pass
						#$"../../gibblezone/engiegib2/gibble4".set_meta("Interaction",6.0)
						#$"../../blockades/blockade8".queue_free()
						#game_manager.animation_player("close_door","../Doors/Door7","")
						#var balloon = load("res://dialogue/Talking Balloon/balloon.tscn")
						#var script = load("res://dialogue/Script/chapter2_ship.dialogue")
						#game_manager.dialogue(balloon,script,"delia_cutscene",self)
						#gibble.set_meta("Interaction",6.0)
						#gibble.set_meta("Resource","close_door")
					#"c2_withdraw":
						#special_light.light_energy = 4.0
						#turnRight()
						#var balloon = load("res://dialogue/Talking Balloon/balloon.tscn")
						#var script = load("res://dialogue/Script/chapter2_ship.dialogue")
						#game_manager.dialogue(balloon,script,"withdraw_cutscene",self)
						#$"../../gibblezone/engiegib2/gibble24".set_meta("Interaction",6.0)
						#$"../../gibblezone/engiegib2/gibble24".set_meta("Resource","close_door")
						#$"../../gibblezone/engiegib2/gibble20".set_meta("Interaction",6.0)
						#$"../../gibblezone/engiegib2/gibble20".set_meta("Resource","close_door")
						#$"../../gibblezone/engiegib2/gibble13".set_meta("Interaction",6.0)
						#$"../../gibblezone/engiegib2/gibble13".set_meta("Resource","close_door")
						#$"../../gibblezone/engiegib2/gibble18".set_meta("Interaction",6.0)
						#$"../../gibblezone/engiegib2/gibble18".set_meta("Resource","close_door")
					#"ch2_behind_sol":
						#match rotation_degrees.y:
							#180.0:
								#turnRight()
								#await turnRight()
								#moveable = false
							#0.0:
								#turnLeft()
								#await turnLeft()
								#moveable = false
							#90.0:
								#pass
							#270.0:
								#turnRight()
								#await turnRight()
								#turnRight()
								#await turnRight()
								#moveable = false
						#$"../../Gibbles/gibble43".set_meta("Interaction",0.0)
						#var balloon = load("res://dialogue/Talking Balloon/balloon.tscn")
						#var script = load("res://dialogue/Script/chapter2_engine.dialogue")
						#game_manager.dialogue(balloon,script,"behind_sol",self)
					#####Chapter 3####
					#"ch3_empty":
						#game_manager.animation_player("open_door","../Doors/Door16","")
						#match directions:
							#"forward":
								#turnLeft()
								#await turnLeft()
								#turnRight()
								#await turnRight()
								#turnRight()
								#await turnRight()
								#turnLeft()
								#await turnLeft()
							#"backward":
								#turnRight()
								#await turnRight()
								#turnLeft()
								#await turnLeft()
								#turnLeft()
								#await turnLeft()
								#turnRight()
								#await turnRight()
							#"left":
								#turnLeft()
								#await turnLeft()
								#turnLeft()
								#await turnLeft()
								#turnRight()
								#await turnRight()
							#"right":
								#turnRight()
								#await turnRight()
								#turnRight()
								#await turnRight()
								#turnLeft()
								#await turnLeft()
						#moveable = false
						#var balloon = load("res://dialogue/Talking Balloon/balloon.tscn")
						#var script = load("res://dialogue/Script/chapter3_ship.dialogue")
						#game_manager.dialogue(balloon,script,"empty_cutscene",self)
						#gibble.set_meta("Interaction",6.0)
						#gibble.set_meta("Resource","open_door")
					#"ch3_doctor":
						#match str(get_path_to(gibble)):
							#"../../gibblezone/medbay/gibble77":
								#$"../../Interactable Characters/Models/Ztra3".queue_free()
							#"../../gibblezone/medbay/gibble69":
								#match directions:
									#"forward":
										#turnRight()
										#await turnRight()
										#moveable = false
									#"backward":
										#turnLeft()
										#await turnLeft()
										#moveable = false
									#"left":
										#pass
									#"right":
										#turnRight()
										#await turnRight()
										#turnRight()
										#await turnRight()
										#moveable = false
						#$"../../gibblezone/medbay/gibble68".set_meta("Interaction",6.0)
						#$"../../gibblezone/medbay/gibble68".set_meta("Resource","open_door")
						#$"../../blockades/blockade5".queue_free()
						#var balloon = load("res://dialogue/Talking Balloon/balloon.tscn")
						#var script = load("res://dialogue/Script/chapter3_ship.dialogue")
						#game_manager.dialogue(balloon,script,"doctor_cutscene",self)
						#$"../../gibblezone/medbay/gibble69".set_meta("Interaction",6.0)
						#$"../../gibblezone/medbay/gibble69".set_meta("Resource","close_door")
						#$"../../gibblezone/medbay/gibble77".set_meta("Interaction",6.0)
						#$"../../gibblezone/medbay/gibble77".set_meta("Resource","open_door")
					#"ch3_captain":
						#match str(get_path_to(gibble)):
							#"../../gibblezone/engiegib2/gibble24":
								#x_plus = 1
								#z_plus = 0
								#captain_path = 0.0
							#"../../gibblezone/engiegib2/gibble20":
								#x_plus = 0
								#z_plus = 1
								#captain_path = 1.0
							#"../../gibblezone/engiegib2/gibble13":
								#x_plus = 0
								#z_plus = -1
								#captain_path = 2.0
							#"../../gibblezone/engiegib2/gibble18":
								#x_plus = -1
								#z_plus = 0
								#captain_path = 3.0
						#match directions:
							#"forward":
								#captain_path +=0.1
								#$"../../Interactable Characters/Models/Ztra4".global_position.x = global_position.x + x_plus
								#$"../../Interactable Characters/Models/Ztra4".global_position.z = global_position.z + z_plus
								#turnLeft()
								#await turnLeft()
								#turnLeft()
								#await turnLeft()
								#moveable = false
							#"backward":
								#captain_path +=0.2
								#$"../../Interactable Characters/qqqModels/Ztra4".global_position.x = global_position.x - x_plus
								#$"../../Interactable Characters/Models/Ztra4".global_position.z = global_position.z - z_plus
								#turnRight()
								#await turnRight()
								#turnRight()
								#await turnRight()
								#moveable = false
							#"left":
								#captain_path +=0.1
								#$"../../Interactable Characters/Models/Ztra4".global_position.x = global_position.x + x_plus
								#$"../../Interactable Characters/Models/Ztra4".global_position.z = global_position.z + z_plus
								#turnRight()
								#await turnRight()
								#moveable = false
							#"right":
								#captain_path +=0.1
								#$"../../Interactable Characters/Models/Ztra4".global_position.x = global_position.x + x_plus
								#$"../../Interactable Characters/Models/Ztra4".global_position.z = global_position.z + z_plus
								#turnLeft()
								#await turnLeft()
								#moveable = false
						#var balloon = load("res://dialogue/Talking Balloon/balloon.tscn")
						#var script = load("res://dialogue/Script/chapter3_ship.dialogue")
						#game_manager.dialogue(balloon,script,"captain_cutscene",self)
						#$"../../gibblezone/engiegib2/gibble24".set_meta("Interaction",6.0)
						#$"../../gibblezone/engiegib2/gibble24".set_meta("Resource","close_door")
						#$"../../gibblezone/engiegib2/gibble20".set_meta("Interaction",6.0)
						#$"../../gibblezone/engiegib2/gibble20".set_meta("Resource","close_door")
						#$"../../gibblezone/engiegib2/gibble13".set_meta("Interaction",6.0)
						#$"../../gibblezone/engiegib2/gibble13".set_meta("Resource","close_door")
						#$"../../gibblezone/engiegib2/gibble18".set_meta("Interaction",6.0)
						#$"../../gibblezone/engiegib2/gibble18".set_meta("Resource","close_door")
					#"medbay_close":
						#$"../../blockades/blockade5".position.y = 0
						#game_manager.animation_player("close_door","../Doors/Door6","")
						#$"../../Interactable Characters/Models/Ztra2".queue_free()




################################################################################
# Blockade Interactions!
################################################################################
func blockade_interaction(blockade):
	if not blockade.get_meta("Reason") == null:
		var balloon = load("res://dialogue/Talking Balloon/balloon.tscn")
		var script = load("res://dialogue/Script/door_locked.dialogue")
		game_manager.dialogue(balloon,script,blockade.get_meta("Reason"),self)
