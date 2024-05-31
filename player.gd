extends CharacterBody2D

class_name Player


@export var move_speed : float = 100
@export var starting_direction: Vector2 = Vector2(0, 1.1)
@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

var lemons: int = 0
	

		
func _physics_process(_delta):
	velocity = Vector2.ZERO
	#Get input direction 
	if Input.is_action_pressed("right"):
		velocity.x += 1.0
	if Input.is_action_pressed("left"):
		velocity.x -= 1.0
	if Input.is_action_pressed("down"):
		velocity.y += 1.0
	if Input.is_action_pressed("up"):
		velocity.y -= 1.0

	if velocity == Vector2.ZERO:
		$AnimationTree.get("parameters/playback").travel("Idle")
	else:
		$AnimationTree.get("parameters/playback").travel("Walk")
		$AnimationTree.set("parameters/Idle/blend_position", velocity)
		$AnimationTree.set("parameters/Walk/blend_position", velocity)
		
	velocity = velocity.normalized() * move_speed
	move_and_slide()
	
	
	
	
	
	
	
	
	
	

func player():
	pass


