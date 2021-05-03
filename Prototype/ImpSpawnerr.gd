extends Spatial

onready var enemiesNode : Spatial = $"../Enemies"
onready var combatMusic : AudioStreamPlayer = $"../CombatMusic"
onready var elevatorMusic : AudioStreamPlayer = $"../ElevatorMusic"
onready var titleScreen = $"../JankyTitleScreen"
onready var labelSprite : Sprite3D = $"../JankyTitleScreen/LabelSprite"
onready var titleScreenLabel = $"../JankyTitleScreen/Viewport/Label"
var timer : float = 0
var impScene
export var spawnTimer : float = 0
export var spawnIncrement : float = 5
export var maxImps = 7
var rng
var spawning = false
var music = false
var quitting = false
var done = false


# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	rng.randomize()
	impScene = load("res://models/imp/imp.tscn")
	timer = 0
	spawnTimer = 0
	spawning = false
	music = false
	quitting = false
	done = false
	pass # Replace with function body.

func start():
	spawning = true
	timer = 2.5
	spawnTimer = 2.5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not spawning or done:
		return
		
	if Input.is_action_just_pressed("ui_quit"):
		timer = 0
		spawnTimer = 0
		quitting = true
		titleScreenLabel.text = "Coming Soon!"
		
	timer += delta
	spawnTimer += delta
		
	if quitting:
		if timer > 5.0:
			titleScreen.opacity = (timer - 5.0)/3.0
			labelSprite.opacity = (timer - 5.0)/3.0
		combatMusic.volume_db -= delta*10.0
		if timer > 8.0:
			elevatorMusic.play()
			elevatorMusic.volume_db = 0
			done = true
		return
	
	if spawnTimer > spawnIncrement:
		spawnTimer = 0
		if enemiesNode.get_child_count() < maxImps:
			var count = rng.randf()
			if not music:
				combatMusic.play()
				music = true
				count = 1.0
				
			while count > 0:
				var impInstance = impScene.instance()
				enemiesNode.add_child(impInstance)
				impInstance.randomizePos()
				count -= .2
			
