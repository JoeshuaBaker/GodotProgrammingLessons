extends Node2D

export var HP:int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	if HP == 100:
		print("Blue Wizard is feeling perky.")
	elif HP <= 0:
		print("Blue Wizard is fuckin deeaaaad! !kill")
	elif HP < 25:
		print("Blue Wizard needs food badly.")
	else:
		print("Blue Wizard is just vibin, yo.")
		
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
