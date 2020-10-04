extends Node

class_name AzumiState

export(AzumiAnim.Type) var animation : int
var azumi : Azumi
var stateMachine : AzumiStateMachine

func enter(_lastState : AzumiState):
	pass

func update(_delta):
	pass

func exit(_nextState : AzumiState):
	pass

#alt exit for cancelling into another state; defaults to passthrough for exit
func cancel(nextState : AzumiState):
	exit(nextState)

#called when animationplayer finishes and needs a new state to transition to
func end():
	stateMachine.transition(AzumiAnim.Idle)
