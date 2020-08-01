extends Sprite




func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		if myScaleFunction(2, 8):
			print("I successfully scaled up")
		else:
			print("I could not scale up any further...")
	if Input.is_action_just_pressed("ui_down"):
		myScaleFunction(.5, 1000000)

#scale the sprite when the enter key is pressed.
func myScaleFunction(scaleFactor:float, scaleMax:float) -> bool:
	if scale.x > scaleMax and scale.y > scaleMax:
		return false
	else:
		scale *= scaleFactor
		return true
