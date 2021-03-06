extends AzumiState

#inherited variables -- commented here as a reference
#export(AzumiStateMachine.animationTypeAzumi) var animation : int
#var azumi : Azumi
#var stateMachine : AzumiStateMachine

func enter(_lastState : AzumiState):
	stateMachine.play(AzumiAnim.Idle)
	azumi.onGround = true

func update(_delta):
	checkTransition(_delta)

#if cancel is true, this state was cancelled early
func exit(_nextState : AzumiState, var _cancel : bool = false):
	pass

#called when animationplayer finishes and needs a new state to transition to
func end():
	.end()

func checkTransition(_delta) -> bool:
	if Utilities.anyDirectionPressed():
		return stateMachine.transition(AzumiAnim.Run)
	if Input.is_action_just_pressed("ui_jump"):
		return stateMachine.transition(AzumiAnim.Jump)
	if Input.is_action_just_pressed("ui_select"):
		return stateMachine.transition(AzumiAnim.Attack1)
	return false
	
