class_name  Character

extends Node

var chest := Equipment.new()
var legs := Equipment.new()

class Equipment:
	var armor := 10
	var weight := 5

@export var profession : String
@export var health: int

func _ready():
	chest.armor = 10
	legs.armor = 3
	print(chest.armor)
	print(legs.armor)


func die():
	health = 0
	print(profession + "die")
