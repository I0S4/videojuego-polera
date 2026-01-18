extends CharacterBody3D

var speed = 7
var jump_velocity = 3.5
var gravity = 9.81

func _physics_process(delta):
	# Gravedad
	if not is_on_floor():
		velocity.y -= gravity * delta
	# Salto
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	# Entrada WASD
	var input_dir = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	var direction = (transform.basis * Vector3(input_dir.x,0,input_dir.y)).normalized()
	# Movimiento
	if direction != Vector3.ZERO:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x,0,speed)
		velocity.z = move_toward(velocity.z,0,speed)

	move_and_slide()
