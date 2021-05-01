extends EnemyState

#inherited variables
#var azumi : Azumi
#var stateMachine : EnemyStateMachine
onready var fireballSpawnPoint : Spatial = $"../../FireballSpawnPoint"
onready var projectileRoot = $"../../../../Projectiles"
var waitFrames : int = 0
var fireballScene
var lastFireball

func _ready():
	fireballScene = load("res://Scenes/Projectile/Fireball.tscn")

func enter(_lastState : EnemyState):
	waitFrames = 0;
	lastFireball = fireballScene.instance()
	lastFireball.global_transform.origin = fireballSpawnPoint.global_transform.origin
	lastFireball.start(Vector3(-1, 0, 0))
	projectileRoot.add_child(lastFireball)
	pass

func update(delta):
	checkTransition(delta)
	waitFrames += 1
	pass

#if cancel is true, this state was cancelled early
func exit(_nextState : EnemyState, var _cancel : bool = false):
	pass

#called when animationplayer finishes and needs a new state to transition to
func end():
	pass
	
func checkTransition(_delta) -> bool:
	if waitFrames >= 60:
		stateMachine.transition(HairWitchAnim.Recover)
	return false
