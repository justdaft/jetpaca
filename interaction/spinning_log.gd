# This file is part of the Jetpaca game
# Copyright (c) 2009-2016 Juan Linietsky, Ariel Manzur
# Distributed under the terms of the MIT license (cf. LICENSE.md file)

extends StaticBody2D

# member variables here, example:
# var a=2
# var b="textvar"

var r=0
var rnode=null

func _process(delta):
	r-=delta*get_constant_angular_velocity()
	rnode.set_rot(r)
	

func _on_enter_screen():
	set_process(true)

func _on_exit_screen():
	set_process(false)

func _ready():
	# Initalization here
	rnode=get_node("sprite")
	pass


