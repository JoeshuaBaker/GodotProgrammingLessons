extends Object

class_name Utilities

static func anyDirectionPressed() -> bool:
	return (
		Input.is_action_pressed("ui_up") or 
		Input.is_action_pressed("ui_down") or 
		Input.is_action_pressed("ui_left") or 
		Input.is_action_pressed("ui_right"))
