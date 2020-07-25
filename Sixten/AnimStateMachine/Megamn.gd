extends AnimationPlayer


enum states {Idle, Walk, Duck}

var currentState: int = -1
var speed: int = 0
export var walkSpeed: int = 2
var direction:Vector2 = Vector2(0,0)
var sprite: AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite = $"../AnimatedSprite"
	transition(states.Idle)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	processState()
	pass

func transition(nextState:int):
	if nextState == states.Idle:
		play ("Idle")
		speed = 0
	
	elif nextState == states.Walk:
		play ("Walk")
		speed = walkSpeed
	
	elif nextState == states.Duck:
		play ("Duck")
		speed = 0
	
	currentState = nextState
	
	pass

func processState():
	#Process Idle state
	if currentState == states.Idle:
		#If a movement key is pressed, transition to walking state
		if checkMovementInput():
			transition(states.Walk)
		#If attack key is pressed, transition to attacking state
		elif checkDuckInput():
			transition(states.Duck)
	
	if currentState == states.Walk:
		if not checkMovementInput():
			transition(states.Idle)
		elif checkDuckInput():
			transition(states.Duck)
		else:
			sprite.position += direction * speed
	
	if currentState == states.Duck:
		if not checkDuckInput():
			transition(states.Idle)

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
		sprite.flip_h= false
	else:
		direction.x = 0
	
	return direction != Vector2.ZERO

func checkJumpInput() -> bool:
	return Input.is_action_just_pressed("ui_select")

func checkDuckInput() -> bool:
	return Input.is_action_pressed("ui_attack")
