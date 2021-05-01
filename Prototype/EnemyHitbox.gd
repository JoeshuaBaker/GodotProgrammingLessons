extends Area

class_name EnemyHitbox

export var damage : int = 5
onready var parent = $".."




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_EnemyHitbox_area_entered(area):
	parent.queue_free()
	pass # Replace with function body.
