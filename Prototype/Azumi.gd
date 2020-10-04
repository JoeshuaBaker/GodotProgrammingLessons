extends Spatial

class_name Azumi

onready var animSprite : AnimatedSprite3D = $"AnimatedSprite3D"
onready var animPlayer : AnimationPlayer = $"StateMachine"
export var isInvincible: bool = false
export var onGround: bool = false
export var horizontalSpeed : float = 2.0
export var verticalSpeed : float = 0.5
export var jumpSpeed : float = 3.0
export var gravity : float = 4.5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
