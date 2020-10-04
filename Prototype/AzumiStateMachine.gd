extends AnimationPlayer

class_name AzumiStateMachine

export(Array, AzumiAnim.Type) var cancelFilter = []
onready var state : Object = $Idle
onready var azumi : Azumi = $".."

func _ready():
	transition(AzumiAnim.Idle)
	
func _process(delta):
	state.update(delta)

func transition(nextStateName : String, cancel : bool = false):
	var nextState = get_node(nextStateName)
	nextState.stateMachine = self
	nextState.azumi = azumi
	
	if cancel:
		var cancelStateIndex = cancelFilter.find(nextState.animation)
		if cancelStateIndex == -1: return
		
		state.cancel(nextState)
	else:
		state.exit(nextState)
	
	nextState.enter(state)
	state = nextState
	
func finished():
	state.end()
	pass
