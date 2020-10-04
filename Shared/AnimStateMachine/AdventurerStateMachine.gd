extends AnimationPlayer

#Assignment: Add a jump state with the following specification:
#1. Add "Jump" to the states enum.
#2. Add an if statement to the transition function that checks nextState == Jump
#3. Set speed to jumpSpeed and play the jump animation within the jump transition
#4. Inside of the processState function, add an elif statement to the section
#that processes the Walk state. Plug checkJumpInput() into the elif statement. Inside
#the elif statement, call transition(states.Jump). This will transition from walk 
#to jump when the spacebar is pressed while walking.
#5. At the bottom of the processState function, add an if statement that checks 
#if the currentState==states.Jump. This will be the section that is called every
#frame while you are in the Jump state. Check if the animation player has finished
#playing an animation (you can copy the if statement from the Attack section that
#does the same thing). If the jump animation is finished, transition back to idle.

#Because the movement keys are not being checked while inside the jump state, it should
#lock you into the direction you were walking in while within the jump animation

#BONUS ASSIGNMENT: Add a jumping attack state. The jumping attack state should play
#the "Attack Down" animation, but otherwise work exactly the same way the Jump state does
#The jumping attack state should be entered by pressing attack while in the jump state.

enum states {
	Idle,
	Walk,
	Attack,
	Jump
}

export var array = []
var currentState:int = -1
var direction:Vector2 = Vector2(0,0)
var speed:int = 0
export var maxSpeed:int = 4
export var jumpSpeed:int = 2
var sprite:Sprite

# Called on start
func _ready():
	sprite = $"../Sprite"
	transition(states.Idle)

# Called every frame
func _process(delta):
	processState()
	
func transition(nextState:int):
	#transition to idle state
	if nextState == states.Idle:
		play("Idle")
		speed = 0
	
	#transition to walking state
	elif nextState == states.Walk:
		play("Walk", -1, 2.5, true)
		speed = maxSpeed
	
	#transition to attacking state
	elif nextState == states.Attack:
		play("Attack Straight")
		speed = 0
	
	elif nextState == states.Jump:
		play("Jump")
		speed = jumpSpeed
	
	currentState = nextState

func processState():
	#Process Idle state
	if currentState == states.Idle:
		#If a movement key is pressed, transition to walking state
		if checkMovementInput():
			transition(states.Walk)
		#If attack key is pressed, transition to attacking state
		elif checkAttackInput():
			transition(states.Attack)
	
	#Process Walking state
	if currentState == states.Walk:
		#If no movement key is pressed, transition back to walking state
		if not checkMovementInput():
			transition(states.Idle)
		#If attack key is pressed, transition to attacking state
		elif checkAttackInput():
			transition(states.Attack)
		elif checkJumpInput():
			transition(states.Jump)
		#Otherwise, update the sprite's position by direction * speed
		else:
			sprite.position += direction * speed
	
	#Process Attack state
	if currentState == states.Attack:
		#If attack animation is done playing, transition to idle
		if not is_playing():
			transition(states.Idle)
	
	if currentState == states.Jump:
		if not is_playing():
			transition(states.Idle)
		else:
			sprite.position += direction * speed


#Utility functions to process input. You shouldn't have to modify these at all.
func checkMovementInput() -> bool:
	if Input.is_action_pressed("ui_up"):
		direction.y = -1
	elif Input.is_action_pressed("ui_down"):
		direction.y = 1
	else:
		direction.y = 0
	
	if Input.is_action_pressed("ui_left"):
		direction.x = -1
		sprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		direction.x = 1
		sprite.flip_h = false
	else:
		direction.x = 0
	
	return direction != Vector2.ZERO

func checkJumpInput() -> bool:
	return Input.is_action_just_pressed("ui_select")

func checkAttackInput() -> bool:
	return Input.is_action_just_pressed("ui_attack")
