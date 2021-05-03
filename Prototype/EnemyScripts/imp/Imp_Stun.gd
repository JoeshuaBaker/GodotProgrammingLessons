extends EnemyState

#inherited variables
#var azumi : Azumi
#var stateMachine : EnemyStateMachine
onready var imp : Imp = $"../.."

func enter(_lastState : EnemyState):
	if imp.hp <= 0:
		stateMachine.transition(ImpAnim.Die)
		return
	
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	if rng.randf() > 0.5:
		stateMachine.play("Hit")
	else:
		stateMachine.play("Hit2")
	pass

func update(delta):
	checkTransition(delta)
	pass

#if cancel is true, this state was cancelled early
func exit(_nextState : EnemyState, var _cancel : bool = false):
	pass

#called when animationplayer finishes and needs a new state to transition to
func end():
	stateMachine.transition(ImpAnim.Search)
	
func checkTransition(_delta) -> bool:
	return false
