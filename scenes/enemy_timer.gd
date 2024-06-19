extends Timer

var customer = preload("res://scenes/customer.tscn")
@onready var thing =  $"../stand/Sprite2D"

func _on_timeout():
	var e = customer.instantiate()
	e.position = Vector2(431,290)
	e.player = thing
	
	get_parent().add_child(e)
	
	thing = e
