extends Area2D

onready var tween := $Tween

func _ready() -> void:
	#tween.interpolate_property(self, "scale", Vector2(1,1), Vector2(1.5,1.5), 0.2)
	#tween.interpolate_property(self, "scale", Vector2(1.5,1.5), Vector2(1,1), 0.2,
	#	Tween.TRANS_LINEAR, Tween.EASE_OUT, 0.2)
	#tween.start()	
	$AnimationPlayer.play("scale")

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
	
	
func animation_finished():
	print("Finished!")
