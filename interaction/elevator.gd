
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

export(int) var distance=100
export(float) var max_speed=64.0


var done=false
var	target=0
var speed=0
var active=false
var moved=0


func _fixed_process(delta):

	if (done or not active):
		return

	var tomove = speed * delta
	if (speed<max_speed):
		speed+=20*delta
		if (speed>max_speed):
			speed=max_speed
			
	if (distance>0):
		moved+=tomove
		if (moved>target):
			moved=target
			done=true
	else:
		moved-=tomove
		if (moved<target):
			moved=target
			done=true
			
	if (done):
		set_fixed_process(false)
		
	set_pos( Vector2(get_pos().x,moved) )


func _triggered():

	if (active or done):
		return

	set_fixed_process(true)
	active=true
	target=get_pos().y+distance
	moved=get_pos().y
	speed=0


func _ready():
	# Initalization here
	pass


