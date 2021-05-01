extends Node

class_name EnemyState

var azumi : Azumi
var stateMachine : EnemyStateMachine

func enter(_lastState : EnemyState):
	pass

func update(delta):
	checkTransition(delta)
	pass

#if cancel is true, this state was cancelled early
func exit(_nextState : EnemyState, var _cancel : bool = false):
	pass

#called when animationplayer finishes and needs a new state to transition to
func end():
	stateMachine.transition("Idle")
	
func checkTransition(_delta) -> bool:
	return false
