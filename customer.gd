extends CharacterBody2D

const speed = 60

@export var player: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

var stop = false

func _ready():
	nav_agent.path_desired_distance = 60
	nav_agent.target_desired_distance = 60
	
	
func _physics_process(delta: float) -> void:
	
	
		
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	nav_agent.set_velocity_forced(velocity)
	
	if nav_agent.is_target_reached():
		velocity = Vector2.ZERO
		print("done")
		return
	
	
	
	
	
# finds best way to get to player
func make_path() -> void:
	nav_agent.target_position = player.global_position

	
	
# every time the timer times out make a new path to the player
func _on_timer_timeout():
	make_path()


func _on_navigation_agent_2d_velocity_computed(safe_velocity):
	velocity = velocity.move_toward(safe_velocity, .25)
	move_and_slide()


	
