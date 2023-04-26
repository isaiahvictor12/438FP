extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	print(Globals.player_rotation)
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$Player.position = Globals.position
	
	# not working :(
	#$Player.rotation = Globals.player_rotation
	#$Player/Head.rotation = Globals.head_rotation
	
	if not Globals.door_open:
		$Tower/Door.position.x = -2.112
		$Tower/Door.position.z = 4.228
		$Tower/Door.rotation.y = PI * 0.5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		get_tree().quit()
		
