extends AzumiState

#inherited variables -- commented here as a reference
#export(AzumiStateMachine.animationTypeAzumi) var animation : int
#var azumi : Azumi
#var stateMachine : AzumiStateMachine
var dir : Vector2
onready var hitbox = $"../../Hitbox"

func enter(_lastState : AzumiState):
	stateMachine.play(AzumiAnim.Run)
	pass

func update(delta):
	dir = processMoveInput()
	if checkTransition(delta):
		return
	else:
		if dir.x == -1:
			azumi.animSprite.flip_h = true
			azumi.scale.x = abs(azumi.scale.x)*-1
			azumi.translate(Vector3(-1*dir.x*azumi.horizontalSpeed*delta, 
								0, 
								dir.y*azumi.verticalSpeed*delta))
		elif dir.x == 1:
			azumi.animSprite.flip_h = false
			azumi.scale.x = abs(azumi.scale.x)
			azumi.translate(Vector3(dir.x*azumi.horizontalSpeed*delta, 
								0, 
								dir.y*azumi.verticalSpeed*delta))
		else:
			azumi.translate(Vector3(dir.x*azumi.horizontalSpeed*delta, 
								0, 
								dir.y*azumi.verticalSpeed*delta))
		
		

#if cancel is true, this state was cancelled early
func exit(_nextState : AzumiState, var _cancel : bool = false):
	pass

#called when animationplayer finishes and needs a new state to transition to
func end():
	.end()
	
func processMoveInput() -> Vector2:
	var inputDir = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		inputDir.y -= 1
	if Input.is_action_pressed("ui_down"):
		inputDir.y += 1
	if Input.is_action_pressed("ui_left"):
		inputDir.x -= 1
	if Input.is_action_pressed("ui_right"):
		inputDir.x += 1
	return inputDir

func checkTransition(_delta) -> bool:
	if dir == Vector2.ZERO:
		return stateMachine.transition(AzumiAnim.Idle)
	if Input.is_action_just_pressed("ui_jump"):
		return stateMachine.transition(AzumiAnim.Jump)
	if Input.is_action_just_pressed("ui_select"):
		return stateMachine.transition(AzumiAnim.Attack1)
	return false
