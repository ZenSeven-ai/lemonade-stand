extends CharacterBody2D

const speed = 60

@export var player: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

func _physics_process(delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()
	
	
# finds best way to get to player
func make_path() -> void:
	nav_agent.target_position = player.global_position

	
	
# every time the timer times out make a new path to the player
func _on_timer_timeout():
	make_path()
