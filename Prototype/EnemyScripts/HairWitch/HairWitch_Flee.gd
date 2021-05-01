extends EnemyState

#inherited variables
#var azumi : Azumi
#var stateMachine : EnemyStateMachine
export var azumiNearDistance : float = 1.5
export var fleeSpeedBase : float = 0.5
export var fleeSpeedMax : float = 1.5
export var fleeSpeedGrow : float = 1
export var framesToFlee : int = 120
onready var witchParent = $"../.."
var speed = 0
var fleeFrames = 0

func enter(_lastState : EnemyState):
	speed = fleeSpeedBase
	fleeFrames = framesToFlee
	pass

func update(delta):
	if checkTransition(delta):
		return
	var zOffset = witchParent.get_translation().z - azumi.get_translation().z
	speed = min(speed + fleeSpeedGrow*delta, fleeSpeedMax)
	if zOffset < 0:
		witchParent.translate(Vector3(-speed*delta,0,0))
	else:
		witchParent.translate(Vector3(speed*delta,0,0))
		
	if witchParent.get_translation().distance_to(azumi.get_translation()) > azumiNearDistance:
		fleeFrames -= 1
	pass

#if cancel is true, this state was cancelled early
func exit(_nextState : EnemyState, var _cancel : bool = false):
	pass

#called when animationplayer finishes and needs a new state to transition to
func end():
	stateMachine.transition(HairWitchAnim.Idle)
	
func checkTransition(_delta) -> bool:
	if fleeFrames <= 0:
		return stateMachine.transition(HairWitchAnim.Idle)
	return false
