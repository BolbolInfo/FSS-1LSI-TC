extends Node

@onready var player_animation: AnimationPlayer = $"../player_animation"
@onready var player: CharacterBody2D = %player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.move_to_think()
	player_animation.play("movement")
	await player_animation.animation_finished
	player.stop_moving()
