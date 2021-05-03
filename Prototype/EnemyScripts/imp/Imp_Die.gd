extends EnemyState

#inherited variables
#var azumi : Azumi
#var stateMachine : EnemyStateMachine
onready var imp : Imp = $"../.."
var awayVec : Vector3
export var flySpeed : float = 4.0
export var arcHeight : float = 2.0
export var arcSpeed : float = 4.0
var height : float
var updown : bool = false


func enter(_lastState : EnemyState):
	awayVec = azumi.global_transform.origin - imp.global_transform.origin
	stateMachine.play("Hit2")
	height = 0
	updown = false

func update(delta):
	imp.translate(awayVec*flySpeed*delta)
	if not updown:
		height += arcSpeed*delta
		imp.transform.origin.y += arcSpeed*delta
		if height > arcHeight:
			updown = true
	else:
		height -= arcSpeed*delta


#if cancel is true, this state was cancelled early
func exit(_nextState : EnemyState, var _cancel : bool = false):
	pass

#called when animationplayer finishes and needs a new state to transition to
func end():
	imp.queue_free()
	pass
	
func checkTransition(_delta) -> bool:
	return false
