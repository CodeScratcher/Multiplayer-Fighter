extends KinematicBody2D
export var max_speed = 100
export var accel = 10
export var decel = 0.2
export var max_run_speed = 200
export var run_accel = 15
export var run_decel = 0.2
var motion = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var cur_max = max_speed
	var cur_accel = accel
	var cur_decel = decel
	if Input.is_action_pressed("run"):
		cur_max = max_run_speed
		cur_accel = run_accel
		cur_decel = run_decel
	motion.x = clamp(motion.x, -cur_max, cur_max)
	motion.y = clamp(motion.y, -cur_max, cur_max)
	if Input.is_action_pressed("up"):
		motion.y -= cur_accel
	elif Input.is_action_pressed("down"):
		motion.y += cur_accel
	else:
		motion.y = lerp(motion.y, 0, cur_decel)
	if Input.is_action_pressed("left"):
		motion.x -= cur_accel
	elif Input.is_action_pressed("right"):
		motion.x += cur_accel
	else:
		motion.x = lerp(motion.x, 0, cur_decel)
	move_and_collide(motion)
