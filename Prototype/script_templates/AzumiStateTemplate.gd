extends AzumiState

#inherited variables -- commented here as a reference
#export(AzumiStateMachine.animationTypeAzumi) var animation : int
#var azumi : Azumi
#var stateMachine : AzumiStateMachine

func enter(lastState : AzumiState):
	pass

func update(delta):
	pass

func exit(nextState : AzumiState):
	pass
	
#alt exit for cancelling into another state; defaults to passthrough for exit
func cancel(nextState : AzumiState):
	.cancel(nextState)

#called when animationplayer finishes and needs a new state to transition to
func end():
	.end()
