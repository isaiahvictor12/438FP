extends Area3D

var doorSound 

# Called when the node enters the scene tree for the first time.
func _ready():
	doorSound = get_parent().get_parent().get_parent().get_node("DoorSound")
	set_collision_layer_value(1, true) # set the collision layer to default
	set_collision_mask_value(1, true) # set the collision mask to default


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if Globals.door_open and Globals.first:
		Globals.first = false
		Globals.door_open = false
		doorSound.play()
		get_parent().position.x = -2.112
		get_parent().position.z = 4.228
		get_parent().rotation.y = PI * 0.5
	
