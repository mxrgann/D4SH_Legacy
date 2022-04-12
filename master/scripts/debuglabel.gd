extends Label

func _process(delta):
	text = ("FPS: " + str(Engine.get_frames_per_second())
	 + "\n Sequences: " + str(Global.sequences)
	 + "\n Current Sequence Index: " + str(Global.currentSequenceIndex)
	 + "\n Maximum Sequence Index: " + str(Global.maximumSequenceIndex)
	 + "\n Current Level: " + str(Global.currentLevel));
