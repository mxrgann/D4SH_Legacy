extends Control

onready var cont = $Panel/contButton
onready var quit = $Panel/quitButton

func _ready():
	if Global.currentLevel == 1:
		cont.disabled = true;
	else: 
		cont.disabled = false;
	
	if OS.get_name() == "HTML5":
		quit.disabled = true;

func _on_playButton_button_up():
	Global.currentLevel = 1;
	Global.nextLevel();
	


func _on_quitButton_button_up():
	get_tree().quit();


func _on_contButton_button_up():
	Global.nextLevel();
