extends Control



func _on_contButton_button_up():
	Global.nextLevel();


func _on_menuButton_button_up():
	get_tree().change_scene("res://master/scenes/main_menu.tscn");
