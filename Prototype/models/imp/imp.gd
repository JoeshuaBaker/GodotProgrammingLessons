extends Enemy

class_name Imp
onready var stateMachine : EnemyStateMachine = $AnimationPlayer

export var heightRange : Vector2 = Vector2(10, 20)
export var xBound : float = 5.5
export var yBound : float = 4

func hp_set(value : int):
	hp = value
	if hp <= 0:
		stateMachine.transition(ImpAnim.Die)
	
func hp_get() -> int:
	return hp

func randomizePos():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	transform.origin = Vector3(-xBound*rng.randf() + xBound*rng.randf(),
	heightRange.x + (heightRange.y - heightRange.x)*rng.randf(),
	-yBound*rng.randf() + yBound*rng.randf())

func getHit():
	if hp > 0:
		stateMachine.transition(ImpAnim.Stun)
	else:
		stateMachine.transition(ImpAnim.Die)
