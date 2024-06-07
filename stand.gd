extends Node2D

var player_in_area = false
var the_body = null



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact") && player_in_area :
		pass
		


func _on_interact_area_body_entered(body):
	
	if body.has_method("player"):
		player_in_area = true
		the_body = body
		
		
		
		
		



func _on_interact_area_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
		the_body = null
