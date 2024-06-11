extends CanvasLayer
var lemon_count = 0
var cups_count = 0
var coin_count = 0

func _ready():
	# initilize HUD to 0
	$lemons.text = str(lemon_count)
	$cups.text = str(cups_count)
	$coins.text = str(coin_count)
	
	
	


func _on_lemon_collected():
	lemon_count = lemon_count + 3
	_ready()
	


func _on_cups_cup_made():
	## need to make sure that you can only get cups 
	## when you have at least three lemons
	if lemon_count >=3:
		cups_count = cups_count + 1
		lemon_count = lemon_count - 3
	_ready()




func _on_stand_money_made():
	if cups_count > 0:
		cups_count = cups_count - 1
		coin_count = coin_count + 4
	_ready()
