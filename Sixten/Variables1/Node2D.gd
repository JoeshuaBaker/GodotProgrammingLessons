extends Node2D


# Declare member variables here. Examples:
export var hp: int


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hp < 25:
		print("Your HP is shitty")
	elif hp == 100:
		print("hundo health")
	
	if hp <= 0:
		print("Your Are Kill")
		
	pass
