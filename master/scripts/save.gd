extends Node

func _save():
	var data = {
		"lvl" : Global.currentLevel
		
		
	};
	var json = to_json(data)
	var save = File.new();
	save.open("res://master/save/save.json", File.WRITE);
	save.store_line(json);
	save.close();
	print("Save Success!");

func _load():
	var save = File.new();
	if not save.file_exists("res://master/save/save.json"):
		_save();
		return
	save.open("res://master/save/save.json", File.READ);
	var data = parse_json(save.get_as_text());
	save.close();
	
	Global.currentLevel = data.lvl;
