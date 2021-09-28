extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
onready var sceneLimit := $Level/SceneLimit
onready var player := $Level/Player

func _ready() -> void:
	print("Total children: "+str(get_child_count()))
	
func _physics_process(delta: float) -> void:
	if player.position.y > sceneLimit.position.y:
		get_tree().change_scene("res://Levels/GameOver.tscn")
