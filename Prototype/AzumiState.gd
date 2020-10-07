extends Node

class_name AzumiState

export(AzumiAnim.Type) var animation : int
var azumi : Azumi
var stateMachine : AzumiStateMachine

func enter(_lastState : AzumiState):
	pass

func update(delta):
	checkTransition(delta)
	pass

#if cancel is true, this state was cancelled early
func exit(_nextState : AzumiState, var _cancel : bool = false):
	pass

#called when animationplayer finishes and needs a new state to transition to
func end():
	stateMachine.transition(AzumiAnim.Idle)
	
func checkTransition(_delta) -> bool:
	return false
