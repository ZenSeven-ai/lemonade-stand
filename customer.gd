extends CharacterBody2D

const speed = 60

@export var player: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

var stop = false
var target_reached = false
var is_angry = false
var start_angry = false

func _ready():

	nav_agent.path_desired_distance = 70
	nav_agent.target_desired_distance = 70
	
	

	
	
func _physics_process(delta: float) -> void:
	
		var dir = to_local(nav_agent.get_next_path_position()).normalized()
		velocity = dir * speed
		nav_agent.set_velocity_forced(velocity)
		
		if nav_agent.is_target_reached():
			velocity = Vector2.ZERO
			## if you arent angry and you havent started the timer yet and the player is at the stand start the timer
			if is_angry == false and start_angry == false and player ==  get_parent().get_node("stand/Sprite2D"):
					start_angry = true
					$angry.start()
			if !target_reached:
				target_reached = true
			
			return
	
	
	
	
	
# finds best way to get to player
func make_path() -> void:
	if player != null:
		nav_agent.target_position = player.global_position

	
	
# every time the timer times out make a new path to the player
func _on_timer_timeout():


		if target_reached == true and is_angry == false and nav_agent.distance_to_target() >70: 
			$".".player = get_parent().get_node("stand/Sprite2D")
			player =  get_parent().get_node("stand/Sprite2D")
		make_path()
	


func _on_navigation_agent_2d_velocity_computed(safe_velocity):
	velocity = velocity.move_toward(safe_velocity, .25)
	move_and_slide()





func _on_angry_timeout():

	target_reached = false
	is_angry = true
	## switch to player position after timeout
	player = get_parent().get_node("player/Sprite2D")
	$".".player = get_parent().get_node("player/Sprite2D")

