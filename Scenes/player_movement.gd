extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

@export var movement_speed : float = 500
var character_direction : Vector2

func _physics_process(delta):
	character_direction.x = Input.get_axis("Left", "Right")
	character_direction.y = Input.get_axis("Up", "Down")
	character_direction = character_direction.normalized()
	#if character_direction.x > 0: %sprite.flip_h = false
	#elif character_direction.x < 0: %sprite.flip_h = false
	
	if character_direction:
		velocity = character_direction * movement_speed
		#walk animation
	else:
		velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
		
	move_and_slide()
	
