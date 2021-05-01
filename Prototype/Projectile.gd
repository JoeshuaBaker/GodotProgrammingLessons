extends Spatial

enum ProjectileType {Linear, Square}

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(ProjectileType) var projectileType = ProjectileType.Linear 
var direction : Vector3
var moving : bool = false
export var speed : float = 1
export var accel : float = 0.1
export var speedMax : float = 2.5


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start(dir : Vector3):
	direction = dir
	moving = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if moving:
		move(delta)
#	pass

func move(delta):
	if projectileType == ProjectileType.Linear:
		translate(direction*speed*delta)
	elif projectileType == ProjectileType.Square:
		speed += accel
		translate(direction*speed*delta)
