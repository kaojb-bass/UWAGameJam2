extends CharacterBody2D

@export var speed : float = 170
@export var direction = Vector2.LEFT

@onready var ray_cast = $RayCast2D
@onready var timer = $StopTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity = direction * speed
	move_and_slide()
	
func _process(delta: float):
	if ray_cast.is_colliding():
		var collider = ray_cast.get_collider()
		print(str(collider))
		if collider.is_in_group("vehicle"):
			speed = 0
			timer.start()

func _on_stop_timer_timeout() -> void:
	speed = 170
