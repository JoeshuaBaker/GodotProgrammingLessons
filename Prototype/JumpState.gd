extends AzumiState

#inherited variables -- commented here as a reference
#export(AzumiStateMachine.animationTypeAzumi) var animation : int
#var azumi : Azumi
#var stateMachine : AzumiStateMachine
var velocity : float
var retainMovement : Vector2

func enter(lastState : AzumiState):
	stateMachine.play(AzumiAnim.Jump)
	azumi.onGround = false
	azumi.scale.x = abs(azumi.scale.x)
	velocity = azumi.jumpSpeed
	if lastState.name == AzumiAnim.Run:
		retainMovement.x = lastState.dir.x*azumi.horizontalSpeed
		retainMovement.y = lastState.dir.y*azumi.verticalSpeed

func update(delta):
	azumi.translate(Vector3(retainMovement.x*delta, velocity*delta, retainMovement.y*delta))
	velocity -= azumi.gravity*delta
	if velocity <= 0:
		end()
	checkTransition(delta)

#if cancel is true, this state was cancelled early
func exit(_nextState : AzumiState, var _cancel : bool = false):
	azumi.translation.y = 0
	velocity = 0
	retainMovement = Vector2.ZERO
	
#alt exit for cancelling into another state; defaults to passthrough for exit
func cancel(nextState : AzumiState):
	.cancel(nextState)

#called when animationplayer finishes and needs a new state to transition to
func end():
	stateMachine.play(AzumiAnim.Fall)
	
func checkTransition(_delta) -> bool:
	if azumi.translation.y <= 0:
		return stateMachine.transition(AzumiAnim.Idle)
	return false
