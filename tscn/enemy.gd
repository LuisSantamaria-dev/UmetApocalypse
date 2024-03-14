extends CharacterBody2D

var motion = Vector2.ZERO

func _ready():
	pass

func _physics_process(_delta):
	var Player = get_parent().get_node("Player")
	
	position += (Player.position - position)/50
	#look_at(Player.position)
	
	move_and_collide(motion)


func _on_area_2d_body_entered(body):
	if "Bullet" in body.name:
		queue_free()
