extends Control

func restart():
	get_tree().change_scene("res://Main.tscn")


func _on_Button_pressed() -> void:
	restart()
