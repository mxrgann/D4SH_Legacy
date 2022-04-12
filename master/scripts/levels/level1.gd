extends Node2D


func _ready():
	Global.reset(5);

func _on_deathBarrier_body_entered(body):
	if body.is_in_group("player"):
		Global.refresh();
