extends Node

var health = 100
var text:String = "JACK"
var number:= 22
@export var seenumber:= 22

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
		# JackLife()
		# add(1,2)
		# var addnumber = add(10,20)
		# random()
		# array()
		# loop()
		dictionaries()
	if event.is_action_released("my_action"):
		$Label.modulate = Color.RED
		
func JackLife():
	health-=20
	print(health)
	if(health <= 0):
		print("Jack升天")
	elif(health <= 50):
		print("Jack怕.jpg")
	else:
		print("Jack跟著")
		
func add(num1:int , num2:int) -> int:
	var result = num1 + num2
	print(result)
	return result
	
func random():
	var roll = randf()
	if roll >=0.8:
		print("20%機率物品");
	else:
		print("80%機率物品");
	
	var randomnumber = randi_range(0,100)
	print(str(randomnumber) + "%");

func array():
	var items = ["blade" , 2 , "55.444"]
	var items2:Array[String] = ["blade" , "bow"]
	print(items[2] , items2[1])
	items.remove_at(1)
	items.append("happycat")
	for item in items:
		if item.length() > 6 :
			print(item)
			
func loop():
	var number;
	for n in 8:
		print(n)
		
	var glass = 0
	
	while  glass < 1:
		glass+=0.1
		#continue
		#break
	print(glass)

func dictionaries():
	var player = {"Jack":99,"Hank":10}
	print(player["Jack"])
	player["WaterMan"] = 5
	for username in player:
		print(username + ": " + str(player[username]) )
		
	var playerex = {
		"Jack":{"Level":5, "Health":10},
		"Hank":{"Level":1, "Health":9}}
	print(playerex["Jack"]["Level"])
	print(playerex["Hank"]["Health"])
