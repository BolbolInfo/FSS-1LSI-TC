extends Node

@onready var player: CharacterBody2D = %player
@onready var player_move_to_teacher: AnimationPlayer = $player_move_to_teacher
@onready var player_talk_to_teacher: Label = $"../player_talk_to_teacher"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.move_to_think()
	player_move_to_teacher.play("move_to")
	await player_move_to_teacher.animation_finished
	player.stop_moving()
	player.talk()
	await player_talk_to_teacher.transform()
	await get_tree().create_timer(2).timeout
	SceneTrans.change_scene("res://computer_room.tscn")
