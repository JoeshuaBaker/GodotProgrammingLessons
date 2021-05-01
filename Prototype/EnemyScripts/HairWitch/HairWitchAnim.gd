extends Object

class_name HairWitchAnim

const Idle		: String = "Idle"
const Charge 	: String = "Charge"
const Flee	 	: String = "Flee"
const Fire	 	: String = "Fire"
const Shield	: String = "Shield"
const Recover	: String = "Recover"
const Stun 		: String = "Stun"

enum Type {
	Search,
	Charge,
	Flee,
	Fire,
	Shield,
	Recover,
	Stun
}

static func strToEnum(var animName : String) -> int:
	return Type.get(animName)

static func enumToStr(var animValue : int) -> String:
	return Type.keys()[animValue]
