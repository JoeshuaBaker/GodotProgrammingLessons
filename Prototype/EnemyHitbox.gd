extends Area

class_name EnemyHitbox

onready var enemy : Enemy = $".."

func takeDamage(var damage : int):
	enemy.hp -= damage
