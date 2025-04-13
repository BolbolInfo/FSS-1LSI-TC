extends Node

@onready var player: CharacterBody2D = %player
@onready var player_move_to_teacher: AnimationPlayer = $player_move_to_teacher
@onready var player_talk_to_teacher: Label = $"../player_talk_to_teacher"
@onready var dialog_animation: AnimationPlayer = $dialog_animation
@onready var teacher_talk: Label = $"../teacher_talk"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.move_to_think()
	player_move_to_teacher.play("move_to")
	await player_move_to_teacher.animation_finished
	player.stop_moving()
	player.talk()
	dialog_animation.play("dialog")
	await dialog_animation.animation_finished
	await get_tree().create_timer(0.5).timeout
	SceneTrans.change_scene("res://computer_room.tscn")
func _process(delta: float) -> void:
	if player_move_to_teacher.is_playing():
		pass
	elif player_talk_to_teacher.text!="":
		player.talk()
	else:
		player.stop_moving()
		
