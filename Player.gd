extends KinematicBody2D

export var run_speed := 350
export var jump_speed := -1000
export var gravity := 3500
onready var sprite := $AnimatedSprite

var velocity := Vector2()

func get_input():
	velocity.x = Input.get_action_strength("right")-Input.get_action_strength("left")
	velocity.y = Input.get_action_strength("down")-Input.get_action_strength("up")
	velocity = velocity.normalized() * run_speed
	#if is_on_floor() and jump:
	if velocity.x > 0:
		sprite.play("right")
	elif velocity.x < 0:
		sprite.play("left")
	elif velocity.y > 0:
		sprite.play("down")
	elif velocity.y < 0:
		sprite.play("up")
	else:
		sprite.stop()

# Movimento lateral com gravidade
func get_input_side():
	velocity.x = Input.get_action_strength("right")-Input.get_action_strength("left")
#	velocity.y = Input.get_action_strength("down")-Input.get_action_strength("up")
	velocity.x *= run_speed
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_speed
	if velocity.x > 0:
		sprite.play("right")
	elif velocity.x < 0:
		sprite.play("left")
	else:
		sprite.stop()
func _physics_process(delta):
	velocity.y += gravity * delta
	get_input_side()
	velocity = move_and_slide(velocity, Vector2.UP);
