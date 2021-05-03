extends Spatial

onready var enemiesNode : Spatial = $"../Enemies"
onready var combatMusic : AudioStreamPlayer = $"../CombatMusic"
var timer : float = 0
var impScene
export var spawnTimer : float = 0
export var spawnIncrement : float = 5
export var maxImps = 7
var rng
var spawning = false
var music = false


# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	rng.randomize()
	impScene = load("res://models/imp/imp.tscn")
	timer = 0
	spawnTimer = 0
	pass # Replace with function body.

func start():
	spawning = true
	timer = 2.5
	spawnTimer = 2.5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not spawning:
		return
	
	timer += delta
	spawnTimer += delta
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
			
			
