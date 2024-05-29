extends Area2D

var showInteractionLabel = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# Make the tree animate to drop the lemons only if it has lemons
	if Input.is_action_just_pressed("interact") && $StaticBody2D/Sprite2D.frame == 0:
		
		$StaticBody2D/Sprite2D.frame+=1
		await get_tree().create_timer(1.0).timeout
		$StaticBody2D/Sprite2D.frame+=1
		
		
		# reset the tree to it's original state
		await get_tree().create_timer(10.0).timeout
		$StaticBody2D/Sprite2D.frame = 0  
		
		
		
		


func _on_body_entered(body):
	if body is Player: showInteractionLabel = true


func _on_body_exited(body):
	if body is Player: showInteractionLabel = false
