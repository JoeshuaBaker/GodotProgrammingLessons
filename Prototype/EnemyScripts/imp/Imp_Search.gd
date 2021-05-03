extends EnemyState

#inherited variables
#var azumi : Azumi
#var stateMachine : EnemyStateMachine
onready var imp : Spatial = $"../.."
onready var forwardPoint : Spatial = $"../../ForwardPoint"
export var rotationSpeedBounds : Vector2 = Vector2(0.5, 1)
export var moveSpeedBounds : Vector2 = Vector2(0.75, 1.25)
export var distanceToAttackBounds : Vector2 = Vector2(0.75, 1.25)
var rotationSpeed : float
var moveSpeed : float
var distanceToAttack : float
var withinAttackRange = false

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.seed = hash(imp.name)
	rotationSpeed = rotationSpeedBounds.x + (rotationSpeedBounds.y - rotationSpeedBounds.x)*rng.randf()
	moveSpeed = moveSpeedBounds.x + (moveSpeedBounds.y - moveSpeedBounds.x)*rng.randf()
	distanceToAttack = distanceToAttackBounds.x + (distanceToAttackBounds.y - distanceToAttackBounds.x)*rng.randf()

func enter(_lastState : EnemyState):
	stateMachine.play("Run")
	pass
	
func turn(target, delta):
	var imp_pos = imp.global_transform.origin
	var target_pos = target.global_transform.origin
	var rotation_speed = rotationSpeed*delta
	var wtransform = imp.global_transform.looking_at(Vector3(target_pos.x,imp_pos.y,target_pos.z),Vector3(0,1,0))
	var wrotation = Quat(imp.global_transform.basis).slerp(Quat(wtransform.basis), rotation_speed)
	imp.global_transform = Transform(Basis(wrotation), imp.global_transform.origin)

func moveTo(target, delta):
	var dir : Vector3 =  (forwardPoint.global_transform.origin - imp.global_transform.origin).normalized()
	var distToAzumi : float = (imp.global_transform.origin - azumi.global_transform.origin).length()
	withinAttackRange = distToAzumi <= distanceToAttack
	if not withinAttackRange:
		imp.global_transform.origin = imp.global_transform.origin + dir*moveSpeed*delta;
		imp.global_transform.origin.y = 0

func update(delta):
	turn(azumi, delta)
	moveTo(azumi, delta)
	checkTransition(delta)
	pass

#if cancel is true, this state was cancelled early
func exit(_nextState : EnemyState, var _cancel : bool = false):
	pass

#called when animationplayer finishes and needs a new state to transition to
func end():
	pass
	
func checkTransition(_delta) -> bool:
	if withinAttackRange:
		stateMachine.transition(ImpAnim.Attack)
	return false
