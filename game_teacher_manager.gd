extends Node

@onready var player: CharacterBody2D = %player
@onready var player_move_to_teacher: AnimationPlayer = $player_move_to_teacher

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.move_to_think()
	player_move_to_teacher.play("move_to")
	await player_move_to_teacher.animation_finished
	player.stop_moving()
