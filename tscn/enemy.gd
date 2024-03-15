extends CharacterBody2D

@export var enemy_speed = 200

var player = null

func _ready():
	player = get_tree().get_nodes_in_group("player")[0]

func _process(_1delta):
	follow()

func follow():
	if player != null:
		velocity = position.direction_to(player.position) * enemy_speed
		
		move_and_slide()


func _on_area_2d_body_entered(body):
	if body.is_in_group("Bullets"):
		queue_free()
