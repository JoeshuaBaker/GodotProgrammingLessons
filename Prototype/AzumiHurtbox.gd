extends Area

class_name AzumiHurtbox

onready var AzumiRoot : Azumi = $".."


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Hurtbox_area_entered(area):
	if "damage" in area:
		AzumiRoot.getHit(area.damage)
		area.damage = 0
	pass # Replace with function body.
