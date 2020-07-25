extends Node2D


# Declare member variables here. Examples:
export var ThisIsAnInteger :int = 5
export var ThisIsAString :String = "shiiit"
export var ThisIsAFloat :float = 0.666
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var ImGonnaDieSoon = ThisIsAFloat
	ImGonnaDieSoon += ThisIsAnInteger
	print(ImGonnaDieSoon)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
