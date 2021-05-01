extends Sprite3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var AzumiNode : Azumi = $".."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scale.x = float(AzumiNode.hp)/float(AzumiNode.hpMax)
	pass
