extends Node3D

var time

# Called when the node enters the scene tree for the first time.
func _ready():
	time = 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	time -= 1
	$TextEdit.text = "Time Left: " + str(time)
	if time == 0:
		Globals.key3_collected = true
		get_tree().change_scene_to_file("res://key_congrats.tscn")
