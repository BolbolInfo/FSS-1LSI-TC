extends Node

@onready var player: CharacterBody2D = %player
@onready var move_to_think_animator: AnimationPlayer = $move_to_think_animator

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(2).timeout
	player.move_to_think()
	
	move_to_think_animator.play("move")
	await  move_to_think_animator.animation_finished
	player.stop_moving()
	await get_tree().create_timer(1.5).timeout
	player.talk()
	
