extends AzumiState

#inherited variables -- commented here as a reference
#export(AzumiStateMachine.animationTypeAzumi) var animation : int
#var azumi : Azumi
#var stateMachine : AzumiStateMachine
var dir : Vector2

func enter(lastState : AzumiState):
	stateMachine.play(AzumiAnim.Run)
	pass

func update(delta):
	dir = processMoveInput()
	if dir == Vector2.ZERO:
		stateMachine.transition(AzumiAnim.Idle)
		return
	else:
		if dir.x == -1:
			azumi.animSprite.flip_h = true
		elif dir.x == 1:
			azumi.animSprite.flip_h = false
			
		azumi.translate(Vector3(dir.x*azumi.horizontalSpeed*delta, 
								0, 
								dir.y*azumi.verticalSpeed*delta))
	if Input.is_action_just_pressed("ui_select"):
		stateMachine.transition(AzumiAnim.Jump)

func exit(nextState : AzumiState):
	pass
	
#alt exit for cancelling into another state; defaults to passthrough for exit
func cancel(nextState : AzumiState):
	.cancel(nextState)

#called when animationplayer finishes and needs a new state to transition to
func end():
	.end()
	
func processMoveInput() -> Vector2:
	var dir : Vector2 = Vector2()
	if Input.is_action_pressed("ui_up"):
		dir.y -= 1
	if Input.is_action_pressed("ui_down"):
		dir.y += 1
	if Input.is_action_pressed("ui_left"):
		dir.x -= 1
	if Input.is_action_pressed("ui_right"):
		dir.x += 1
	return dir
