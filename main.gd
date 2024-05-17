extends Node

var health = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Jack現有生命" + str(health))
	$Label.text = "Hello Jack"
	$Label.modulate = Color.RED
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if event.is_action_pressed("my_action"):
		$Label.modulate = Color.CORNFLOWER_BLUE
		health-=20
		print(health)
		if(health <= 0):
			print("Jack升天")

	if event.is_action_released("my_action"):
		$Label.modulate = Color.RED
