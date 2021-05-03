extends Spatial

class_name Enemy

export var hp : int setget hp_set, hp_get

func hp_set(value : int):
	hp = value
	if hp <= 0:
		queue_free()
	
func hp_get() -> int:
	return hp
	
func getHit():
	pass
