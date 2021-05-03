extends Area

class_name EnemyHurtbox

onready var enemy : Enemy = $".."

func takeDamage(var damage : int):
	enemy.hp -= damage
	if damage >= 0:
		enemy.getHit()
