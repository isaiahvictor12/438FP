extends CharacterBody2D

var speed = 125

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()	
	
	var motion = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		motion.x += 1
	if Input.is_action_pressed("ui_left"):
		motion.x -= 1
	if Input.is_action_pressed("ui_down"):
		motion.y += 1
	if Input.is_action_pressed("ui_up"):
		motion.y -= 1

	motion = motion.normalized() * speed * delta

	var collision = move_and_collide(motion)
	if collision:
		position = Vector2(93, 100)




func _on_trophy_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	Globals.key2_collected = true
	get_tree().change_scene_to_file("res://key_congrats.tscn")
