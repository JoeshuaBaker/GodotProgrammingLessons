extends Area

class_name EnemyHitbox

export var damage : int = 5
onready var parent = $".."
export var destroyOnHit : bool = false
onready var collisionShape = $"CollisionShape"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func reset():
	damage = 0
	collisionShape.disabled = true
	translation = Vector3.ZERO
	pass

func _on_EnemyHitbox_area_entered(area):
	if destroyOnHit:
		parent.queue_free()
