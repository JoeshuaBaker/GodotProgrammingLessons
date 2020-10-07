extends Object

class_name AzumiAnim

const AirAttack : String = "AirAttack"
const Attack1 	: String = "Attack1"
const Attack2 	: String = "Attack2"
const Attack3 	: String = "Attack3"
const Dash 		: String = "Dash"
const Fall		: String = "Fall"
const Idle 		: String = "Idle"
const Jump 		: String = "Jump"
const Kick 		: String = "Kick"
const Pinwheel 	: String = "Pinwheel"
const Push 		: String = "Push"
const Run 		: String = "Run"
const Run2 		: String = "Run2"
const Slam 		: String = "Slam"
const Stinger 	: String = "Stinger"
const WallCling : String = "WallCling"

enum Type {
	AirAttack,
	Attack1,
	Attack2,
	Attack3,
	Dash,
	Idle,
	Fall,
	Jump,
	Kick,
	Pinwheel,
	Push,
	Run,
	Run2,
	Slam,
	Stinger,
	WallCling
}

static func strToEnum(var animName : String) -> int:
	return Type.get(animName)

static func enumToStr(var animValue : int) -> String:
	return Type.keys()[animValue]
