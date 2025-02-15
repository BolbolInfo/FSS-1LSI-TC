extends CharacterBody2D


@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	pass


func move_from_stage():
	animated_sprite_2d.play("walk")
	
func move_to_think():

	animated_sprite_2d.play("walk")
func stop_moving():
	animated_sprite_2d.play("idle")

func talk():
	animated_sprite_2d.play("talk")
