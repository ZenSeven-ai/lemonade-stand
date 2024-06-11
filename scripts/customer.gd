extends CharacterBody2D

var speed = 5
var motion = Vector2.ZERO
var the_body = null

var player_in_area = null


func _physics_process(delta):
	motion = Vector2.ZERO
	if player_in_area:
		position += (the_body.position - position)/ speed
		
	
		
		
func _on_detection_area_body_entered(body):
	if body.has_method("player"):
		player_in_area = true
		the_body = body
		
	


func _on_detection_area_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
		the_body = null


	
