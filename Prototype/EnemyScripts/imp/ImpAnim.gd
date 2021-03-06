extends Object

class_name ImpAnim

const Idle		: String = "Idle"
const Search	: String = "Search"
const Charge 	: String = "Charge"
const Attack 	: String = "Attack"
const Stun	 	: String = "Stun"
const Die		: String = "Die"

enum Type {
	Idle,
	Search,
	Charge,
	Attack,
	Stun,
	Die
}

static func strToEnum(var animName : String) -> int:
	return Type.get(animName)

static func enumToStr(var animValue : int) -> String:
	return Type.keys()[animValue]
