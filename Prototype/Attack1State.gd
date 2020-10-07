extends AzumiState

#inherited variables -- commented here as a reference
#export(AzumiStateMachine.animationTypeAzumi) var animation : int
#var azumi : Azumi
#var stateMachine : AzumiStateMachine
onready var hitbox : AzumiHitbox = $"../../Hitbox"
var queueAttack : bool = false

func enter(_lastState : AzumiState):
	stateMachine.play(AzumiAnim.Attack1)
	pass

func update(delta):
	checkTransition(delta)
	pass

#if cancel is true, this state was cancelled early
func exit(_nextState : AzumiState, var _cancel : bool = false):
	queueAttack = false
	hitbox.reset()
	pass

#called when animationplayer finishes and needs a new state to transition to
func end():
	.end()
	
func checkTransition(_delta) -> bool:
	if queueAttack or Input.is_action_just_pressed("ui_select"):
		queueAttack = true
		return stateMachine.transition(AzumiAnim.Attack2, true)
	return false
