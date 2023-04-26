extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()	


func _on_answer_text_submitted(new_text):
	if $Answer.text.to_lower() == "goldfish":
		Globals.key1_collected = true
		get_tree().change_scene_to_file("res://key_congrats.tscn")
