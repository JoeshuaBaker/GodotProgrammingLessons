extends AzumiState

#inherited variables -- commented here as a reference
#export(AzumiStateMachine.animationTypeAzumi) var animation : int
#var azumi : Azumi
#var stateMachine : AzumiStateMachine

func enter(_lastState : AzumiState):
	stateMachine.play(AzumiAnim.Idle)
	azumi.onGround = true

func update(_delta):
	if Utilities.anyDirectionPressed():
		stateMachine.transition(AzumiAnim.Run)
	if Input.is_action_just_pressed("ui_select"):
		stateMachine.transition(AzumiAnim.Jump)

func exit(_nextState : AzumiState):
	pass
	
#alt exit for cancelling into another state; defaults to passthrough for exit
func cancel(nextState : AzumiState):
	.cancel(nextState)

#called when animationplayer finishes and needs a new state to transition to
func end():
	.end()
