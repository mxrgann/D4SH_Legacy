extends Node
var currentLevel = 1;
var sequences = [];
var maximumSequenceIndex;
var currentLap = 1;
var maxLaps= 5;
var currentSequenceIndex = 0;

func _process(delta):
	maximumSequenceIndex = sequences.max();

func refresh():
	sequences = [];
	get_tree().reload_current_scene();
	
func reset(laps):
	currentLap = 1;
	maxLaps= laps;
	currentSequenceIndex = 0;

func nextLevel():
	refresh();
	get_tree().change_scene("master/scenes/levels/level" + str(currentLevel) + ".tscn");

func complete():
	if Global.currentLevel == 3:
		get_tree().change_scene("res://master/scenes/main_menu.tscn");
	else:
		get_tree().change_scene("res://master/scenes/level_complete.tscn");
	Global.currentLevel += 1;
	Save._save();
