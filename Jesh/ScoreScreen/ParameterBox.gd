extends VBoxContainer
class_name ParameterBox
# 
enum NinjaRanks {
	NinjaPupil,
	Ninja,
	NinjaMaster,
	Sensei
}
export var timeBetweenScores:float = 0.0

export var time:float = 0.0 #remaining amount of time
export var timeTime:float = 0.0 #how much time it should take to decrement time
export var timePoints:int = 0 #points for every sec of remaining time

export var punches:int = 0 #number of successful punches
export var punchesTime:float = 0 #how much time it should take to increment punches
export var punchesPoints:int = 0 #how many points awarded per punch

export var kicks:int = 0 #number of successful kicks
export var kicksTime:float = 0 #how much time it should take to increment kicks
export var kicksPoints:int = 0 #how many points awarded per kick

export var ninjaFlips:int = 0 #number of successful ninja flips
export var ninjaFlipsTime:float = 0 #how much time it should take to increment ninjaFlips
export var ninjaFlipsMult:float = 0 #score multiplier per ninja flip

export var shacklesOfFate:bool = false #are the shackles of fate cast off?
export var shacklesOfFateTime:float = 0.0
export var shacklesOfFateMult:float = 0.0 #one time multiplier for shackles of fate

export var accuracy:Vector2 = Vector2(0,0) #how many shuriken hits (X) and misses (Y)
export var accuracyTime:float = 0.0 #how much time it should take to increment accuracy
export var hitsPoints:int = 0 #how much to increase score by per hit
export var missesPoints:int = 0 #how much to decrease score by per miss

export var ninjaThreshold:int = 0 #Minimum score to be awarded "Ninja"
export var ninjaMasterThreshold:int = 0 #Minimum score to be awarded "Ninja Master"
export var senseiThreshold:int = 0 #Minimum score to be awarded "Sensei"



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
