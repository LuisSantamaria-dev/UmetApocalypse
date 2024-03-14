extends CharacterBody2D

@export var SPEED = 300.0
@export var bullet_speed = 1000
var bullet = preload("res://tscn/bullet.tscn")

func _physics_process(_delta):
	
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
	var directionx = Input.get_axis("move_left","move_right")
	if directionx:
		velocity.x = directionx * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var directiony = Input.get_axis("move_up","move_down")
	if directiony:
		velocity.y = directiony * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("shoot"):
		fire()
		$ShootSound.play()
		$MuzzleFlash.show()
		$MuzzleFlash/Timer.start()

func fire():
	
	var bullet_instance = bullet.instantiate()
	bullet_instance.position = $SpawnBullet.get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.set_linear_velocity(Vector2(bullet_speed, 0).rotated(rotation))
	get_tree().get_root().add_child(bullet_instance)

func kill():
	get_tree().reload_current_scene()

func _on_area_2d_body_entered(body):
	if "Enemy" in body.name:
		kill()
