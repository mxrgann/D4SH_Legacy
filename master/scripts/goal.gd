extends Node2D

export var sequences = [0];

onready var sprite = $Sprite;
onready var area = $Area2D;
onready var particles = $Particles2D;

func _ready():
	Global.sequences += sequences;

func _process(delta):
	sequenceCheck();
	
func parseArray():
	return sequences;

func sequenceCheck():
	match sequences.has(Global.currentSequenceIndex):
		false:
			sprite.visible = false;
			area.monitoring = false;
		true:
			sprite.visible = true;
			area.monitoring = true;


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		if Global.currentSequenceIndex == Global.maximumSequenceIndex:
			Global.currentSequenceIndex = 0;
			if Global.currentLap != Global.maxLaps:
				Global.currentLap += 1;
			else:
				if Global.currentLevel == 3:
					get_tree().change_scene("res://master/scenes/main_menu.tscn");
				else:
					get_tree().change_scene("res://master/scenes/level_complete.tscn");
					Global.currentLevel += 1;
		else:
			Global.currentSequenceIndex += 1;
		$goalSound.play();
		particles.emitting = true;
