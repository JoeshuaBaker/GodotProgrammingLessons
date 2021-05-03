extends Camera

class_name AzumiCamera

export var trauma : float = 0.0
export var traumaDecay : float = 0.01
export var decaySmoothness : int = 2
export var maxAngle : Vector3 = Vector3(0,0,0)
export var maxOffset : float = 0.0
export var debugTrauma : float = 0.5
export var zoom : float = 0.0
export var sizeBounds : Vector2 = Vector2(1, 5)

onready var azumi : Azumi = $"../azumi_parent/Azumi"
onready var cameraTraumaDebug : Sprite3D = $"../CameraTraumaDebug"
onready var cameraShakeDebug : Sprite3D = $"../CameraShakeDebug"
var basePos : Vector3 = Vector3(0,0,0)
var baseRot : Quat = Quat(Vector3(0,0,0))
var shake : float = 0.0
var rng

# Called when the node enters the scene tree for the first time.
func _ready():
	basePos = get_transform().origin
	baseRot = Quat(get_transform().basis)
	rng = RandomNumberGenerator.new()
	rng.randomize()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("debug_zoom_up"):
		zoom += 0.1
	if Input.is_action_just_pressed("debug_zoom_down"):
		zoom -= 0.1
	zoom = clamp(zoom, 0, 1)
	var zoomOffset : Vector3 = lerp(basePos, azumi.transform.origin, zoom)
	zoomOffset.y = 0
	zoomOffset.z = 0
	var zoomSize : float = lerp (sizeBounds.y, sizeBounds.x, zoom)
	
	trauma -= traumaDecay
	if Input.is_action_just_pressed("debug_camera"):
		trauma += debugTrauma
	
	trauma = clamp(trauma, 0, 1)
	
	shake = trauma
	for i in (decaySmoothness - 1):
		shake *= trauma
	
	cameraTraumaDebug.scale.x = trauma*5
	cameraShakeDebug.scale.x = shake*5
	
	var shakeOffset : Vector3 = Vector3(
		rng.randf_range(-1, 1)*maxOffset*shake,
		rng.randf_range(-1, 1)*maxOffset*shake,
		0)
	var shakeAngles : Vector3 = Vector3(
		rng.randf_range(-1, 1)*maxAngle.x*shake,
		rng.randf_range(-1, 1)*maxAngle.y*shake,
		rng.randf_range(-1, 1)*maxAngle.z*shake)
		
	transform.origin = basePos + zoomOffset + shakeOffset
	transform.basis = baseRot * Quat(shakeAngles)
	size = zoomSize
	pass
