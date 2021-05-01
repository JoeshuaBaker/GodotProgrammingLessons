extends EnemyState

#inherited variables
#var azumi : Azumi
#var stateMachine : EnemyStateMachine
var waitFrames : int = 0

func enter(_lastState : EnemyState):
	waitFrames = 0;
	pass

func update(delta):
	checkTransition(delta)
	waitFrames += 1
	pass

#if cancel is true, this state was cancelled early
func exit(_nextState : EnemyState, var _cancel : bool = false):
	pass

#called when animationplayer finishes and needs a new state to transition to
func end():
	pass
	
func checkTransition(_delta) -> bool:
	if waitFrames >= 60:
		stateMachine.transition(HairWitchAnim.Recover)
	return false
