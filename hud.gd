extends CanvasLayer

var intro_lifetime = 200
var fish1_entered = false
var fish2_entered = false
var fish3_entered = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$IntroScreen.visible = Globals.first
	$PauseScreen.visible = false
	$InteractText.visible = false	
	$NeedMoreKeysText.visible = false
	$Key1.visible = Globals.key1_collected
	$Key2.visible = Globals.key2_collected	
	$Key3.visible = Globals.key3_collected
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	intro_lifetime -= 1
	if intro_lifetime == 0:
		$IntroScreen.visible = false
		
	if Input.is_action_just_pressed("pause"):
		if get_parent().get_node("Player").paused:
			get_parent().get_node("Player").paused = false
			$PauseScreen.visible = false
			
		else:
			get_parent().get_node("Player").paused = true
			$PauseScreen.visible = true
				
	
	if Input.is_action_just_pressed("interact"):
		if fish1_entered:
			Globals.position = get_parent().get_node("Player").position
			Globals.player_rotation = get_parent().get_node("Player").rotation
			Globals.head_rotation = get_parent().get_node("Player").get_node("Head").rotation
			get_tree().change_scene_to_file("res://fish1riddle.tscn")
		elif fish2_entered:
			Globals.position = get_parent().get_node("Player").position
			Globals.player_rotation = get_parent().get_node("Player").rotation
			Globals.head_rotation = get_parent().get_node("Player").get_node("Head").rotation
			get_tree().change_scene_to_file("res://fish2_maze.tscn")
		elif fish3_entered:
			Globals.position = get_parent().get_node("Player").position
			Globals.player_rotation = get_parent().get_node("Player").rotation
			Globals.head_rotation = get_parent().get_node("Player").get_node("Head").rotation
			get_tree().change_scene_to_file("res://fish3_challenge.tscn")
	
func _on_fish1_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player" and not Globals.key1_collected:
		$InteractText.visible = true
		fish1_entered = true

func _on_fish1_exited(body_rid, body, body_shape_index, local_shape_index):
	fish1_entered = false
	$InteractText.visible = false	

func _on_fish2_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player" and not Globals.key2_collected:
		$InteractText.visible = true
		fish2_entered = true

func _on_fish2_exited(body_rid, body, body_shape_index, local_shape_index):
	fish2_entered = false
	$InteractText.visible = false	
	
func _on_fish3_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player" and not Globals.key3_collected:
		$InteractText.visible = true
		fish3_entered = true

func _on_fish3_exited(body_rid, body, body_shape_index, local_shape_index):
	fish3_entered = false
	$InteractText.visible = false	


func _on_open_door_trigger_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if Globals.key1_collected and Globals.key2_collected and Globals.key3_collected and not Globals.door_open:
		Globals.position = get_parent().get_node("Player").position
		Globals.player_rotation = get_parent().get_node("Player").rotation
		Globals.head_rotation = get_parent().get_node("Player").get_node("Head").rotation	
		get_tree().change_scene_to_file("res://escape_screen.tscn")
	elif not Globals.door_open:
		$NeedMoreKeysText.visible = true
		


func _on_open_door_trigger_exited(body_rid, body, body_shape_index, local_shape_index):
	$NeedMoreKeysText.visible = false
