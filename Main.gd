extends Node2D

var total : float = 0

# Chamada quando o nodo estiver pronto para uso
# (quando todos os seus filhos estiverem _ready também)
func _ready() -> void:
	update_score(total)

# Chamada sincronizada com o cálculo de Física
# Padrão: 1/60 de segundo
func _physics_process(delta: float) -> void:
	total += delta
#	print(delta)
	update_score(total)
	
	if Input.is_action_pressed("right"):
		position.x += 1
	
func update_score(current_score: float) -> void:
	$Score.text = str(current_score)

# Chamada quando ocorrer algum evento de entrada
func _input(event: InputEvent) -> void:
#	if event is InputEventKey:
#		print("Key event:",event.scancode)
	if event.is_action_pressed("right"):
		print("Right action")

# Callback do signal timeout (Timer)	
func _on_Timer_timeout() -> void:
	pass
#	$Score.visible = !$Score.visible
	
