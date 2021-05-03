extends EnemyState

#inherited variables
#var azumi : Azumi
#var stateMachine : EnemyStateMachine

func enter(_lastState : EnemyState):
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
