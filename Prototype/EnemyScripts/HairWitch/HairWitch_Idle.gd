extends EnemyState

#inherited variables
#var azumi : Azumi
#var stateMachine : EnemyStateMachine
export var moveSpeed : float = 0.5
export var alignedThreshold : float = 0.1
export var framesToCharge : int = 30
export var azumiNearDistance : float = 1.5
onready var witchParent = $"../.."
var zOffset = 0
var framesAligned = 0

func enter(_lastState : EnemyState):
	stateMachine.play(HairWitchAnim.Idle)
	framesAligned = 0
	zOffset = 0
	pass

func update(delta):
	if checkTransition(delta):
		return
	zOffset = witchParent.get_translation().z - azumi.get_translation().z
	if abs(zOffset) > alignedThreshold:
		if zOffset < 0:
			witchParent.translate(Vector3(moveSpeed*delta,0,0))
		else:
			witchParent.translate(Vector3(-moveSpeed*delta,0,0))
	pass

#if cancel is true, this state was cancelled early
func exit(_nextState : EnemyState, var _cancel : bool = false):
	pass

#called when animationplayer finishes and needs a new state to transition to
func end():
	stateMachine.transition(HairWitchAnim.Idle)
	
func checkTransition(_delta) -> bool:
	if witchParent.get_translation().distance_to(azumi.get_translation()) <= azumiNearDistance:
		stateMachine.transition(HairWitchAnim.Flee)
	if abs(zOffset) < alignedThreshold:
		framesAligned += 1
	else:
		framesAligned = 0
	if framesAligned > framesToCharge:
		stateMachine.transition(HairWitchAnim.Charge)
	return false
