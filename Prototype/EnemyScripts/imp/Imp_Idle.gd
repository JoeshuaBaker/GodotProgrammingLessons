extends EnemyState

#inherited variables
#var azumi : Azumi
#var stateMachine : EnemyStateMachine
export var fallAccel : float = 0.98
export var terminalVel : float = 3
var fallSpeed : float = 0
onready var imp : Enemy = $"../.."
onready var camera : AzumiCamera = $"../../../../Camera"

func enter(_lastState : EnemyState):
	stateMachine.play("Idle")
	fallSpeed = 0
	pass

func update(delta):
	fallSpeed += fallAccel*delta
	imp.translate(Vector3(0, -fallSpeed, 0))
	fallSpeed = min(fallSpeed, terminalVel)
	imp.transform.origin.y = max(imp.transform.origin.y, 0)
	checkTransition(delta)
	pass

#if cancel is true, this state was cancelled early
func exit(_nextState : EnemyState, var _cancel : bool = false):
	pass

#called when animationplayer finishes and needs a new state to transition to
func end():
	stateMachine.transition("Idle")
	
func checkTransition(_delta) -> bool:
	if imp.transform.origin.y <= 0:
		stateMachine.transition(ImpAnim.Search)
		camera.trauma += .15
	return false
