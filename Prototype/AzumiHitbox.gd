extends Area

class_name AzumiHitbox

onready var collisionShape : CollisionShape = $CollisionShape
onready var Azumi : Azumi = $".."
onready var stateMachine : AzumiStateMachine = $"../StateMachine"

export var damage : int = 0
export var hitstop : float = 0

func _ready():
	reset()

func reset():
	damage = 0
	hitstop = 0
	collisionShape.disabled = true
	translation = Vector3.ZERO


func _on_Hitbox_area_entered(area):
	print("Collision Triggered")
	area.takeDamage(damage)
	stateMachine.pause(hitstop)
