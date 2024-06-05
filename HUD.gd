extends CanvasLayer
var lemon_count = 0

func _ready():
	# initilize HUD to 0
	$lemons.text = str(lemon_count)
	
	
	


func _on_lemon_collected():
	lemon_count = lemon_count + 3
	_ready()
	
