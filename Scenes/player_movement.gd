extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var stun_timer = $StunTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@export var movement_speed : float = 500
var character_direction : Vector2

@export var stun_duration : float = 0.5
@export var stun_velocity : float = 50.0
var is_stunned : bool = false
var stun_direction : Vector2

func apply_knockback() -> void:
	pass

func stun() -> void:
	if is_stunned:
		return
	
	is_stunned = true
	stun_timer.wait_time = stun_duration
	stun_timer.start()
	animated_sprite.play("stun")

func _physics_process(_delta: float) -> void:
	if is_stunned:
		velocity = stun_direction * stun_velocity
		move_and_slide()
		return
	
	character_direction.x = Input.get_axis("Left", "Right")
	character_direction.y = Input.get_axis("Up", "Down")
	character_direction = character_direction.normalized()
	
	if character_direction.x > 0: animated_sprite.flip_h = false
	elif character_direction.x < 0: animated_sprite.flip_h = true
	
	if character_direction:
		velocity = character_direction * movement_speed
		animated_sprite.play("run")
	else:
		velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
		animated_sprite.play("idle")
		
	move_and_slide()
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("NPC"):
		# Calculates reverse direction from collision
		stun_direction = -(body.global_position - global_position).normalized()
		stun()
	if body.is_in_group("Map"):
		# Calculates reverse direction from collision
		stun_direction = -(body.global_position - global_position).normalized()
		stun()


func _on_stun_timer_timeout() -> void:
	is_stunned = false
