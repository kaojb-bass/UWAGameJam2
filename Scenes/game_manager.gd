extends Node2D
@onready var run_timer = $"Run Timer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	run_timer.wait_time = 5
	# Set to 5 seconds for testing purposes
	# TODO: Set it back to 30 seconds after testing!
	
	run_timer.one_shot = true
	run_timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if run_timer.time_left != 0:
		print("Time Left: ", roundi(run_timer.time_left))


func _on_run_timer_timeout() -> void:
	print("Time Out!")
