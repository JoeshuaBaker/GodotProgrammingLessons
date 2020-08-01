extends Node2D


func _ready():
	for i in range(500):
		var enemyScene = load("res://Enemy.tscn")
		var enemyInstance = enemyScene.instance()
		enemyInstance.position.x = random(500)
		enemyInstance.position.y = random(500)
		add_child(enemyInstance)
	pass 

func random(var randRange:int) -> int:
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	return rng.randf()*randRange

