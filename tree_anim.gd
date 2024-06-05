extends Node2D

signal lemon_collected

var player_in_area = false
var the_body = null


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# Make the tree animate to drop the lemons only if it has lemons
	if Input.is_action_just_pressed("interact") && $Sprite2D.frame == 0 && player_in_area:
	
		
		$AnimationPlayer.play("fall_lemons")
		
		#wait for animation
		await get_tree().create_timer(0.8).timeout
		
		# add lemons to the player
		if the_body != null:
			#the_body.add_lemon()
			emit_signal("lemon_collected")
			
		
		
		# reset to the original state
		await get_tree().create_timer(10.0).timeout
		$Sprite2D.frame = 0  
		
		
		
		


func _on_interact_area_body_entered(body):
	
	if body.has_method("player"):
		player_in_area = true
		the_body = body
		
		
		
		
		



func _on_interact_area_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
		the_body = null
