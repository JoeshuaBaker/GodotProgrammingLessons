extends AzumiState

#inherited variables -- commented here as a reference
#export(AzumiStateMachine.animationTypeAzumi) var animation : int
#var azumi : Azumi
#var stateMachine : AzumiStateMachine
onready var hitbox : AzumiHitbox = $"../../Hitbox"

func enter(lastState : AzumiState):
	stateMachine.play(AzumiAnim.Attack3)
	pass

func update(delta):
	checkTransition(delta)
	pass

#if cancel is true, this state was cancelled early
func exit(nextState : AzumiState, var _cancel : bool = false):
	hitbox.reset()
	pass

#called when animationplayer finishes and needs a new state to transition to
func end():
	.end()
	
func checkTransition(_delta) -> bool:
	return false
