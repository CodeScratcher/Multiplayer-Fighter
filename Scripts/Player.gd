extends KinematicBody

export var turn_speed = 0.2
export var gravity = 50
export var terminal_velocity = 700
export var jump_force = 500
export var max_speed = 100
export var accel = 10
export var decel = 0.2
export var max_run_speed = 200
export var run_accel = 15
export var run_decel = 0.2
var motion = Vector3()
var angle = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	motion.y -= gravity
	var cur_max = max_speed
	var cur_accel = accel
	var cur_decel = decel
	if Input.is_action_pressed("run"):
		cur_max = max_run_speed
		cur_accel = run_accel
		cur_decel = run_decel
	motion.x = clamp(motion.x, -cur_max, cur_max)
	motion.z = clamp(motion.z, -cur_max, cur_max)
	if Input.is_action_pressed("up"):
		motion.z -= cur_accel
	elif Input.is_action_pressed("down"):
		motion.z += cur_accel
	else:
		motion.z = lerp(motion.z, 0, cur_decel)
	if Input.is_action_pressed("left"):
		motion.x -= cur_accel
	elif Input.is_action_pressed("right"):
		motion.x += cur_accel
	else:
		motion.x = lerp(motion.x, 0, cur_decel)
	angle = lerp(angle, -get_viewport().get_mouse_position().x, turn_speed)
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = jump_force
	if motion.y < -1024:
		get_tree().reload_current_scene ()
	motion = move_and_slide(motion.rotated(Vector3(0, 1, 0), deg2rad(angle)), Vector3(0, 1, 0))
	rotation_degrees.y = angle
