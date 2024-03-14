extends Area2D

@onready var Enemy1 = preload("res://tscn/enemy.tscn")
@onready var Enemy2 = preload("res://tscn/enemy2.tscn")
@onready var Enemy3 = preload("res://tscn/enemy3.tscn")
var bool_spawn = true

var random = RandomNumberGenerator.new()

func _ready():
	random.randomize()
	
func _process(_delta):
	spawn()
	
func spawn():
	if bool_spawn:
		$Timer.start()
		bool_spawn = false
		var enemie_instance1 = Enemy1.instantiate()
		enemie_instance1.position = Vector2(random.randi_range(30,1250), random.randi_range(30,600))
		var enemie_instance2 = Enemy2.instantiate()
		enemie_instance2.position = Vector2(random.randi_range(30,1250), random.randi_range(30,600))
		var enemie_instance3 = Enemy3.instantiate()
		enemie_instance3.position = Vector2(random.randi_range(30,1250), random.randi_range(30,600))
		add_child(enemie_instance1)
		add_child(enemie_instance2)
		add_child(enemie_instance3)

func _on_timer_timeout():
	bool_spawn = true
