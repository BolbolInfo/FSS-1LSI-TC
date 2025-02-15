extends Node
@onready var player: CharacterBody2D = %player

@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.move_to_think()
	animation_player.play("move_in_city")

	await animation_player.animation_finished
	await get_tree().create_timer(2).timeout
	SceneTrans.change_scene("res://teacher_room.tscn")
