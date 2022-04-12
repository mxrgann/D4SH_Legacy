extends KinematicBody2D

const ACCELERATION = 1000;
const MAX_SPEED = 500;
const FRICTION = 0.25;
const GRAVITY = 500;
const JUMP_FORCE = 275;
const DASH_FORCE = 300;

onready var animPlayer = $AnimationPlayer;
onready var jumpSound = $jumpSound;
onready var hurtSound = $hurtSound

var motion = Vector2.ZERO;
var fall_mult = 1;

func _physics_process(delta):
	var x_vel = Input.get_action_strength("move_right") - Input.get_action_strength("move_left");
	fall_mult = 1;
	
	if x_vel != 0:
		motion.x += x_vel * ACCELERATION * delta;
		motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED);
	else:
		motion.x = lerp(motion.x, 0, FRICTION);
	motion.y += GRAVITY * fall_mult * delta;
	
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMP_FORCE;
			jumpSound.play();
			
	if is_on_wall():
		fall_mult = 0.5;
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMP_FORCE;
			jumpSound.play();
	
	if Input.is_action_just_pressed("dash"):
		motion.x += x_vel * DASH_FORCE;
		jumpSound.play();
	
	
	motion = move_and_slide(motion, Vector2.UP);

func dieDeath():
	hurtSound.play();

