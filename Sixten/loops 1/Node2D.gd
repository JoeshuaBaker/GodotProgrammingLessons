extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var numbers = range(0,256,2)
var x = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in numbers:
		print ("hey, ", i, ", what's good?")

	while x < 10000:
		x += 5
		print ("x =", x)
		for _i in range(10):
			x += 1
			print ("PSYCH! x now = ", x)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
