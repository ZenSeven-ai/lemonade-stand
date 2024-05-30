extends CharacterBody2D

class_name Player


@export var move_speed : float = 100
@export var starting_direction: Vector2 = Vector2(0, 1.1)
@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

	
func _ready():
	

	update_animation_paramteters(starting_direction)
	
		
		
func _physics_process(_delta):
	#Get input direction 
	
	
	
	
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	update_animation_paramteters(input_direction)
	
	#Update velocity
	velocity = input_direction * move_speed
	
	
	
	#Move character
	move_and_slide()
	pick_new_state()
	
func update_animation_paramteters(moveInput: Vector2):
	if(moveInput != Vector2.ZERO):
		animation_tree.set("parameters/Idle/blend_position", moveInput)
		animation_tree.set("parameters/Walk/blend_position", moveInput)
			
		
func pick_new_state():
	if(velocity != Vector2.ZERO):
		state_machine.travel("Walk")
	else:
		state_machine.travel("Idle")

func player():
	pass


