extends Node

var health = 100
var text:String = "JACK"
var number:= 22
@export var seenumber:= 22

enum Alignment {ALLY , NEUTRAL,ENEMY}
enum Alignment2 {ALLY = 0 , NEUTRAL = 1,ENEMY = 2}
var FriendlyElf = Alignment.ALLY
@export var EvilElf = Alignment

@onready var weapon = $Player/Weapon
@export var my_node:Node
@export var my_sprite2d:Sprite2D

var xp = 0
signal gmsignal

signal levelchamged(new_health)
var level :=0:
	set(value):
		level = (clamp(value,1,99))
		levelchamged.emit(level)
var chance :=0.2
var chance_pct:int:
	get:
		return chance * 100
	set(value):
		chance = float(value) / 100.0

@export var NPC1 :Character


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Jack現有生命" + str(health))
	$Label.text = "Hello Jack"
	$Label.modulate = Color.RED
	gmsignal.connect(_on_gmsignal)
	## gmsignal.disconnect(_on_gmsignal)
	level = -10
	
	print(chance_pct)
	chance = 0.6
	print(chance_pct)
	chance_pct = 40
	print(chance_pct)
	
	NPC1.die()
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
		# dictionaries()
		# enums()
		#Match()
		Modifyingnodes()
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

func enums():
	var NPC = Alignment.ALLY
	if NPC == Alignment.ALLY:
		print("hi")
	else:
		print("out")
		
func Match():
	match FriendlyElf:
		Alignment.ALLY:
			print("ALLY")
		Alignment.NEUTRAL:
			print("NEUTRAL")
		Alignment.ENEMY:
			print("ENEMY")
		_:
			print("default")

func Modifyingnodes():
	print(weapon.get_path())
	
	if my_node is Node2D:
		print("Node2D")
	else:
		print("not Node2D")


func _on_button_pressed():
	print("ya")
	pass # Replace with function body.
	
func _on_timer_timeout():
	xp += 1
	gmsignal.emit()
	print("xp add")

func _on_gmsignal():
	if xp == 5:
		print("level up")


func _on_levelchamged(new_health):
	print(new_health)
