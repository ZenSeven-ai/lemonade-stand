extends Node2D


var player_in_area = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# Make the tree animate to drop the lemons only if it has lemons
	if Input.is_action_just_pressed("interact") && $Sprite2D.frame == 0 && player_in_area:
		
		$AnimationPlayer.play("fall_lemons")
		
		
		# reset to the original state
		
		await get_tree().create_timer(10.0).timeout
		$Sprite2D.frame = 0  
		
		
		
		


func _on_interact_area_body_entered(body):
	if body.has_method("player"):
		player_in_area = true



func _on_interact_area_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
