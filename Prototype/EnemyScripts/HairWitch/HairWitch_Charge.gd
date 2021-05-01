extends EnemyState

#inherited variables
#var azumi : Azumi
#var stateMachine : EnemyStateMachine
onready var label : Label = $"../../Viewport/Label"
onready var witchParent = $"../.."
var chargeFrameThreshold = 120
var chargeFrames : int = 0
export var alignedThreshold : float = 0.25

func enter(_lastState : EnemyState):
	chargeFrames = 0
	pass

func update(delta):
	chargeFrames += 1
	label.text = "Charge " + str(chargeFrames)
	checkTransition(delta)
	pass

#if cancel is true, this state was cancelled early
func exit(_nextState : EnemyState, var _cancel : bool = false):
	pass

#called when animationplayer finishes and needs a new state to transition to
func end():
	pass
	
func checkTransition(_delta) -> bool:
	if chargeFrames >= chargeFrameThreshold:
		if abs(azumi.get_translation().z - witchParent.get_translation().z) <= alignedThreshold:
			return stateMachine.transition(HairWitchAnim.Fire)
		else:
			return stateMachine.transition(HairWitchAnim.Shield)
	return false
