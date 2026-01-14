extends CharacterBody2D

enum Facing { LEFT, RIGHT, UP, DOWN}
@export var facing = Facing.LEFT
@export var speed : float = 200
@export var direction = Vector2.ZERO
@onready var ray_cast = $RayCast2D
@onready var stop_timer = $StopTimer
@onready var del_timer = $DeleteTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	del_timer.start()
	if facing == Facing.LEFT:
		$AnimationPlayer.play("Left")
		direction = Vector2.LEFT
	elif facing == Facing.RIGHT:
		$AnimationPlayer.play("Right")
		direction = Vector2.RIGHT
	elif facing == Facing.UP:
		$AnimationPlayer.play("Up")
		direction = Vector2.UP
	elif facing == Facing.DOWN:
		$AnimationPlayer.play("Down")
		direction = Vector2.DOWN
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity = direction * speed
	move_and_slide()
	
func _process(delta: float):
	if ray_cast.is_colliding():
		var collider = ray_cast.get_collider()
		if collider.is_in_group("vehicle"):
			speed = 0
			stop_timer.start()

func _on_stop_timer_timeout() -> void:
	speed = 200
	if facing == Facing.LEFT:
		$AnimationPlayer.play("Left")
		direction = Vector2.LEFT
	elif facing == Facing.RIGHT:
		$AnimationPlayer.play("Right")
		direction = Vector2.RIGHT
	elif facing == Facing.UP:
		$AnimationPlayer.play("Up")
		direction = Vector2.UP
	elif facing == Facing.DOWN:
		$AnimationPlayer.play("Down")
		direction = Vector2.DOWN

func _on_delete_timer_timeout() -> void:
	queue_free()
