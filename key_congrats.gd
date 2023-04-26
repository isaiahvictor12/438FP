extends Node2D

var pickupSound

# Called when the node enters the scene tree for the first time.
func _ready():
	pickupSound = get_node("PickupSound")
	pickupSound.play()	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("jump"):
		get_tree().change_scene_to_file("res://scene_root.tscn")
