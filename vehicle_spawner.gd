extends Node2D

@onready var car = preload("res://Scenes/car.tscn")
@onready var bus = preload("res://Scenes/bus.tscn")
@onready var roll = 0.0
enum TYPE {UP, DOWN, LEFT, RIGHT}
@export var type = TYPE.LEFT
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	roll = randf()
	var vehicle_obj = car.instantiate()
	if roll <= 0.8:
		vehicle_obj = car.instantiate()
	else:
		vehicle_obj = bus.instantiate()
	if type == TYPE.LEFT:
		vehicle_obj.facing = vehicle_obj.Facing.LEFT
	elif type == TYPE.RIGHT:
		vehicle_obj.facing = vehicle_obj.Facing.RIGHT
	elif type == TYPE.UP:
		vehicle_obj.facing = vehicle_obj.Facing.UP
	elif type == TYPE.DOWN:
		vehicle_obj.facing = vehicle_obj.Facing.DOWN
	vehicle_obj.position = position
	get_parent().add_child(vehicle_obj)
