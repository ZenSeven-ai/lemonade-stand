extends Node2D

var player_in_area = false
var the_body = null


signal money_made



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact") && player_in_area:
		if the_body != null:
			emit_signal("money_made")
		




func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player_in_area = true
		the_body = body
		


func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
		the_body = null
