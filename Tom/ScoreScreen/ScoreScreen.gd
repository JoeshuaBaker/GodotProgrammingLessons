extends MarginContainer

var score:float = 0
var delay:float = 0
var parameterBox:ParameterBox
var scoreLabel:Label
var timeLabel:Label
var punchesLabel:Label
var kicksLabel:Label
var flipsLabel:Label
var fateLabel:Label
var hitsLabel:Label
var missesLabel:Label
var rankLabel:Label

var labelAcc:float
var label:Label = null
var labelCurrentValue:float
var labelMaxValue:float
var labelValueThreshold:float
var labelPointsPerValue
var increasing:bool
var sum:bool = true
var labelSet:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	parameterBox = $ParameterBox
	scoreLabel = $ParameterBox/Score/ScoreLabel
	timeLabel = $ParameterBox/TimeRemaining/Value/TimeLabel
	punchesLabel = $ParameterBox/Punches/Value/PunchesLabel
	kicksLabel = $ParameterBox/Kicks/Value/KicksLabel
	flipsLabel = $"ParameterBox/Ninja Flips/Value/FlipsLabel"
	fateLabel = $"ParameterBox/Shackles Of Fate/Value/FateLabel"
	hitsLabel = $"ParameterBox/Shuriken Accuracy/Value/HitsLabel"
	missesLabel = $"ParameterBox/Shuriken Accuracy/Value2/MissesLabel"
	rankLabel = $"ParameterBox/Rank Achieved/Rank Achieved/Value/RankLabel"
	pass # Replace with function body.

func beginScoreTally(aLabel:Label, maxValue:float, time:float, pointsPerValue, inc:bool, sumOrMult:bool):
	label = aLabel
	increasing = inc
	
	if increasing:
		labelCurrentValue = 0
	else:
		labelCurrentValue = maxValue
		
	
	labelMaxValue = maxValue
	if maxValue > 0:
		labelValueThreshold = time/maxValue
	else:
		labelValueThreshold = 0
		return
	labelPointsPerValue = pointsPerValue
	sum = sumOrMult
	labelAcc = 0
	labelSet = true
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if delay > 0:
		delay -= delta
		return
		
	if labelSet:
		labelAcc += delta
		while labelAcc > labelValueThreshold:
			labelAcc -= labelValueThreshold
			if increasing:
				labelCurrentValue += 1
				if labelCurrentValue >= labelMaxValue: labelSet = false
			else:
				labelCurrentValue -= 1
				if labelCurrentValue <= 0: labelSet = false
			if sum:
				score += labelPointsPerValue
			else:
				score *= labelPointsPerValue
				score = round(score)
		label.text = String(labelCurrentValue)
		scoreLabel.text = "Score: " + String(score)
	else:
		if label == null:
			beginScoreTally(timeLabel, parameterBox.time, parameterBox.timeTime, parameterBox.timePoints, false, true)
		elif label == timeLabel:
			beginScoreTally(punchesLabel, parameterBox.punches, parameterBox.punchesTime, parameterBox.punchesPoints, true, true)
		elif label == punchesLabel:
			beginScoreTally(kicksLabel, parameterBox.kicks, parameterBox.kicksTime, parameterBox.kicksPoints, true, true)
		elif label == kicksLabel:
			beginScoreTally(flipsLabel, parameterBox.ninjaFlips, parameterBox.ninjaFlipsTime, parameterBox.ninjaFlipsMult, true, false)
		elif label == flipsLabel:
			label = fateLabel
			if parameterBox.shacklesOfFate:
				fateLabel.text = "Cast Off!"
				score *= parameterBox.shacklesOfFateMult
				score = round(score)
				scoreLabel.text = "Score: " + String(score)
				fateLabel.set("custom_colors/font_color",Color(0,1,0))
			else:
				fateLabel.text = "Shackled..."
				fateLabel.set("custom_colors/font_color",Color(1,0,0))
			delay = parameterBox.shacklesOfFateTime
			return
		elif label == fateLabel:
			beginScoreTally(hitsLabel, parameterBox.accuracy.x, parameterBox.accuracyTime, parameterBox.hitsPoints, true, true)
		elif label == hitsLabel:
			beginScoreTally(missesLabel, parameterBox.accuracy.y, parameterBox.accuracyTime, -1*parameterBox.missesPoints, true, true)
		elif label == missesLabel:
			if score < parameterBox.ninjaThreshold or score == 0:
				rankLabel.text = "Ninja Pupil..."
			elif score < parameterBox.ninjaMasterThreshold:
				rankLabel.text = "Ninja"
			elif score < parameterBox.senseiThreshold:
				rankLabel.text = "Ninja Master!"
			else:
				rankLabel.text = "Sensei!!!"
		delay = parameterBox.timeBetweenScores
