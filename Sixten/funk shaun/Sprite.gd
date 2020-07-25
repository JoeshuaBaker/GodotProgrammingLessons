extends Sprite


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

export var moveSpeed: float = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		move(Vector2(0,-1))
	if Input.is_action_pressed("ui_down"):
		move(Vector2(0,1))
	if Input.is_action_pressed("ui_left"):
		move(Vector2(-1,0))
	if Input.is_action_pressed("ui_right"):
		move(Vector2(1,0))
	pass

func move(speed:Vector2):
	position += speed * moveSpeed
	$"AudioStreamPlayer2D".play(.44)

#func moveUp():
#	position += Vector2(0,-1)
#
#func moveDown():
#	position += Vector2(0,1)
#
#func moveLeft():
#	position += Vector2(-1,0)
#
#func moveRight():
#	position += Vector2(1,0)
