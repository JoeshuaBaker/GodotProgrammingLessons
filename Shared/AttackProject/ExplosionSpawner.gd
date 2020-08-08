extends Node2D

class_name ExplosionSpawner

var acc = 0.0
var explosionScene
var sprite
var explosionQueue = []

#dir is -1 if facing left, 1 if facing right
func Attack1(dir:int):
	
	for i in range(-5, 6):
		SetDelayedExplosion(Vector2(2*dir, i), 0.1*abs(i))
	pass
	
func Attack2(dir:int):
	pass
	
func Attack3(dir:int):
	pass
	
func Attack4(dir:int):
	pass
	
func Attack5(dir:int):
	pass




func _ready():
	explosionScene = load("res://Explosion.tscn")
	sprite = $"../Sprite"
	
	#uncomment these lines for star pattern on startup
	#for i in range(10):
	#	if i != 0:
	#		starPattern(i)

func starPattern(var i:int, var delay:float = 0):
	SetDelayedExplosion(Vector2(i, 0), delay)
	SetDelayedExplosion(Vector2(0, i), delay)
	SetDelayedExplosion(Vector2(0, -i), delay)
	SetDelayedExplosion(Vector2(-i, 0), delay)
	SetDelayedExplosion(Vector2(i, i), delay)
	SetDelayedExplosion(Vector2(-i, i), delay)
	SetDelayedExplosion(Vector2(i, -i), delay)
	SetDelayedExplosion(Vector2(-i, -i), delay)


func _process(delta):

	for i in range(explosionQueue.size() - 1, -1, -1):
		explosionQueue[i].x -= delta
		if explosionQueue[i].x <= 0:
			CreateExplosion(Vector2(explosionQueue[i].y, explosionQueue[i].z))
			explosionQueue.remove(i)

func CreateExplosion(offset:Vector2):
	var explosionInstance = explosionScene.instance()
	explosionInstance.position = sprite.position/3 + offset
	add_child(explosionInstance)

func SetDelayedExplosion(offset:Vector2, delay:float):
	if offset.x == 0 and offset.y == 0:
		return
		
	var yfactor = 0 if offset.y <= 0 else 10
	var yZerofactor = 5 if offset.y == 0 else 0
	explosionQueue.push_back(Vector3(delay, 20*offset.x, yZerofactor + yfactor + offset.y*15))
