extends Node2D

var player_in_area = false
var customer_in_area = false
var the_body = null
var customer_body = null


signal money_made



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact") && player_in_area:
		# if both the player and a customer are in the area sell
		# the lemonade and make the customer leave
		if the_body != null and customer_body!=null:
			
			customer_body.queue_free()
			
			## because that customer has been removed
			customer_in_area = false
			customer_body = null
			emit_signal("money_made")
		



# checking to see if both the player or a customer has entered the area of the stand
func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player_in_area = true
		the_body = body
	# make sure to not reassign to a new one
	if body.has_method("customer") and !customer_in_area:
		customer_in_area = true
		customer_body = body
		
		
	
		


func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
		the_body = null
	if body.has_method("customer"):
		customer_in_area = false
		customer_body = null
