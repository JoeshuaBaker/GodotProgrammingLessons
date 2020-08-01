extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	for i in range(500):
		if i < 250:
			print("Step", i, "Climbing up the hill...")
		else:
			print("Step", i, "Climbing down the hill...")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
