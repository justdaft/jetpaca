
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

export var key_idx=0
export var no_key=false

var unlocked=false

func activated():

		if (unlocked):
			return
		get_node("anim").play("open")
		get_node("lock").unlock()
		unlocked=true
		


func _on_body_enter(b):
	if (not no_key and b and b extends preload("res://player/alpaca.gd") and not unlocked):
		if (get_node("/root/game_data").current_keys[key_idx]):
			activated()
			
func _ready():
	# Initalization here
	get_node("lock").set_index(key_idx)
#	get_node("lock").set_texture( [preload("res://art/keyhole1.png"),preload("res://art/keyhole2.png"),preload("res://art/keyhole2.png") ][key_idx] )
	if (no_key):
		get_node("lock").hide()
		key_idx=-1
	pass


