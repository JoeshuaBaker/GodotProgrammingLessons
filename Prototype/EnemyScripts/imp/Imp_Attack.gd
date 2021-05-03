extends EnemyState

#inherited variables
#var azumi : Azumi
#var stateMachine : EnemyStateMachine
onready var hitbox : EnemyHitbox = $"../../EnemyHitbox"

func enter(_lastState : EnemyState):
	stateMachine.play(ImpAnim.Attack)
	pass

func update(delta):
	checkTransition(delta)
	pass

#if cancel is true, this state was cancelled early
func exit(_nextState : EnemyState, var _cancel : bool = false):
	hitbox.reset()
	pass

#called when animationplayer finishes and needs a new state to transition to
func end():
	stateMachine.transition(ImpAnim.Search)
	
func checkTransition(_delta) -> bool:
	return false
