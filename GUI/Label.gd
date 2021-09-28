extends Label

onready var time := 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func updateTime():
	time += 1
	text = "Time: "+str(time)
