extends Node2D


export var strong :String = "doomp"
export var gimpt :int = 1
export var flute :float = 68


func _ready() -> void:
	var groob = gimpt
	groob += flute
	print (groob)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
