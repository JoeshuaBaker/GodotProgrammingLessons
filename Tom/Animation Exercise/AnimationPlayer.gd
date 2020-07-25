extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var direction:Vector2 = Vector2(0,0)
var sprite: Sprite
var currentState: int = -1
var speed: int = 0
export var maxSpeed: int = 4
export var jumpSpeed: int = 2

enum states {
	Idle,
	Run,
	Jump,
	Throw
}

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite = $"../Sprite"
	#set Azumi sprite to idle
	transition(states.Idle)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	processState()

func transition(nextState: int):
	#transition to idle state
	if nextState == states.Idle:
		play("idle")
		speed = 0
	
	#transition to run state
	elif nextState == states.Run:
		play("run")
		speed = maxSpeed
	
	#transition to attacking state
	elif nextState == states.Throw:
		play("throw")
		speed = 0
	
	#transition to jumping state
	elif nextState == states.Jump:
		play("jump")
		speed = jumpSpeed
	
	#pull the state from the argument into a global variable to use outside of this scope
	currentState = nextState

func processState():
	#Process idle state
	if currentState == states.Idle:
		#If any movement key is pressed, as defined in checkMovementInput, transition to the walking state
		if checkMovementInput():
			transition(states.Run)
		#If the attack button is pressed, transition to the attack state
		elif checkAttackInput():
			transition(states.Throw)
	
	#Process running state
	if currentState == states.Run:
		#If no movement keys are pressed, return to idle
		if not checkMovementInput():
			transition(states.Idle)
		#Check if the attack key is pressed. If so, move to attack state
		elif checkAttackInput():
			transition(states.Throw)
		#Check if the jump key is pressed
		elif checkJumpInput():
			transition(states.Jump)
		else:
			sprite.position += direction * speed
	
	#Process attack state
	if currentState == states.Throw:
		#check to see if animation is done playing
		if not is_playing():
			transition(states.Idle)
	
	#Process jump state
	if currentState == states.Jump:
		#if animation is finished, return to idle
		if not is_playing():
			transition(states.Idle)
		#Otherwise, move at jumpSpeed
		else:
			sprite.position += direction * speed

func checkJumpInput() -> bool:
	return Input.is_action_just_pressed("ui_select")

func checkAttackInput() -> bool:
	return Input.is_action_just_pressed("ui_focus_next")

func checkMovementInput() -> bool:
	if Input.is_action_pressed("ui_up"):
		direction.y = -1
	
	elif Input.is_action_pressed("ui_down"):
		direction.y = 1
	
	else:
		direction.y = 0
	
	if Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		direction.x = -1
		sprite.flip_h = true
	elif Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		direction.x = 1
		sprite.flip_h = false
	else:
		direction.x = 0
		
	return direction != Vector2.ZERO
	
	print(direction)
