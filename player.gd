extends CharacterBody3D

const MOVE_SPEED = 7.5
const GRAVITY = -9.8
const JUMP_SPEED = 6.0
const ROTATE_SPEED = .10

var jumpSound
var paused = false
var sprint = false

func _ready():
	jumpSound = get_node("JumpSound")

func _physics_process(delta):
	var input_dir = Vector3.ZERO
	var basis = get_global_transform().basis
	var forward = -basis.z
	var right = basis.x
	
	if Input.is_action_pressed("move_forward"):
		input_dir += forward
	if Input.is_action_pressed("move_back"):
		input_dir -= forward
	if Input.is_action_pressed("move_left"):
		input_dir -= right
	if Input.is_action_pressed("move_right"):
		input_dir += right
	input_dir = input_dir.normalized()
	var temp_velocity = input_dir * MOVE_SPEED 
	
	# Sprinting mechanic
	if Input.is_action_pressed("sprint") && is_on_floor():
		sprint = true
	elif not Input.is_action_pressed("sprint") && is_on_floor():
		sprint = false
	
	if sprint:
		temp_velocity *= 1.8

	velocity.y += GRAVITY * delta 
	if is_on_floor() && Input.is_action_just_pressed("jump"):
		jumpSound.play()
		velocity.y = JUMP_SPEED 
	temp_velocity.y = velocity.y
	velocity = temp_velocity
	
	# If game is paused, player can't move
	if paused:
		velocity = Vector3.ZERO
	
	move_and_slide()

const MOUSE_SENSITIVITY = 0.002
var look_rotation = Vector2.ZERO

func _input(event):
	if event is InputEventMouseMotion and not paused:
		# Update the camera rotation based on the mouse movement
		look_rotation += event.relative * MOUSE_SENSITIVITY

		# Limit the camera rotation to prevent the player from rotating too far up or down
		look_rotation.y = clamp(look_rotation.y, -PI / 2, PI / 2)

		# Rotate the player/camera based on the camera rotation
		$Head.rotation.x = -look_rotation.y
		rotation.y = -look_rotation.x
		
