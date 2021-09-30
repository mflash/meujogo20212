extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
onready var sceneLimit := $Level/SceneLimit
onready var player := $Level/Player

func _ready() -> void:
	print("Total children: "+str(get_child_count()))
	$Music.play()
	print("Audio bus count:"+str(AudioServer.bus_count))
			
func _physics_process(delta: float) -> void:
	
	# Se o jogador passar do limite vertical da cena, game over!
	if player.position.y > sceneLimit.position.y:
		get_tree().change_scene("res://Levels/GameOver.tscn")
		
	# Ao clicar com o mouse, faz toggle no
	# filtro passa-baixa do canal Music
	# (alterna freq. de corte entre 2500 e 500)
	if Input.is_action_just_pressed("click"):
		var ae := AudioServer.get_bus_effect(2,0)
		if ae is AudioEffectLowPassFilter:
			if ae.cutoff_hz == 500:
				ae.cutoff_hz = 2500
			else:
				ae.cutoff_hz = 500
