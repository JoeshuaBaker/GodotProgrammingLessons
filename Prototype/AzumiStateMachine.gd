extends AnimationPlayer

class_name AzumiStateMachine

export(Array, AzumiAnim.Type) var cancelFilter = []
var emptyFilter = []
onready var state : Object = $Idle
onready var azumi : Azumi = $".."
var pauseTimer : float = 0
var paused : bool = true

func _ready():
	transition(AzumiAnim.Idle)
	
func _process(delta):
	if paused:
		pauseTimer -= delta
		if pauseTimer <= 0:
			play()
		else:
			return
	
	state.update(delta)
	
func pause(var seconds : float):
	paused = true
	pauseTimer = seconds
	stop(false)

func transition(nextStateName : String, cancel : bool = false) -> bool:
	var nextState = get_node(nextStateName)
	nextState.stateMachine = self
	nextState.azumi = azumi
	
	if cancel:
		var cancelStateIndex = cancelFilter.find(AzumiAnim.strToEnum(nextStateName))
		if cancelStateIndex == -1: return false
		
		state.exit(nextState, true)
	else:
		state.exit(nextState)
	
	nextState.enter(state)
	state = nextState
	cancelFilter = emptyFilter
	return true
	
func finished(_animName : String):
	state.end()
