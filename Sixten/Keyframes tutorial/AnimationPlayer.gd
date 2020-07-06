extends AnimationPlayer


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var animation = self.get_animation("walkcycle")
	animation.track_set_key_value(animation.find_track("AnimatedSprite:position"),1,Vector2(960,-15))
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
