extends CharacterBody3D

var MOVE_SPEED = 5
var target_node: Node # Set this in the editor to the path of the node you want to follow
var target_position: Vector3 = Vector3.ZERO

func _ready():
	target_node = get_parent().get_node("Player")

func _physics_process(delta: float) -> void:
	if not target_node:
		return

	target_position = target_node.global_transform.origin
	var look_dir = target_position - global_transform.origin
	var look_rotation = Quaternion(Vector3.UP, atan2(look_dir.x, look_dir.z)) 
	global_transform.basis = Basis(look_rotation)
	velocity = global_transform.basis.z * MOVE_SPEED * delta
	var collision = move_and_collide(velocity)
	
	if collision and collision.get_collider() is CharacterBody3D:
		get_tree().change_scene_to_file("res://try_again.tscn")
	
