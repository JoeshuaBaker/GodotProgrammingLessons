extends Node2D

func _ready():
	var x = 0
	while x < 10000:
		x += 5
		print(x)
		for i in range(10):
			x += 1
			print(x)
