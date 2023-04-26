extends Node2D

var doorSound
var victorySound

# Called when the node enters the scene tree for the first time.
func _ready():
	doorSound = get_node("DoorSound")
	victorySound = get_node("VictorySound")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("jump"):
		doorSound.play()
		victorySound.play()
		Globals.door_open = true
		get_tree().change_scene_to_file("res://scene_root.tscn")
