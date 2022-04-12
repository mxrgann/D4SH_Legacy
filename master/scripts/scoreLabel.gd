extends Label

func _process(delta):
	text = "Lap: " + str(Global.currentLap) + "/" + str(Global.maxLaps);
