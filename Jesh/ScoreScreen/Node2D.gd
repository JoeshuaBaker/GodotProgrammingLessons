extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var MyString:String = "Hello"
export var MyFloat:float = 3.14
export var MyInt:int = 5




# Called when the node enters the scene tree for the first time.
func _ready():
	var secondInt:int = MyInt
	secondInt += MyFloat
	print(secondInt)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
