extends Sprite3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var fadeTime = 1.0
var timer = 0.0
var fading = false
onready var spawner = $"../Imp Spawner"
onready var elevatorMusic : AudioStreamPlayer = $"../ElevatorMusic"


# Called when the node enters the scene tree for the first time.
func _ready():
	timer = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_click"):
		fading = true
		timer = fadeTime
		
	if fading:
		opacity = timer/fadeTime
		timer -= delta
		elevatorMusic.volume_db -= delta*25
		
		if timer <= 0:
			queue_free()
			elevatorMusic.stop()
			spawner.start()
	
