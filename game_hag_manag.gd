extends Node
@onready var player: CharacterBody2D = %player
@onready var hagg: AnimatedSprite2D = %hagg
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var player_to_father = $"../player_to_father"
@onready var father_to_player: Label = $"../father_to_player"
@onready var dialog: AnimationPlayer = $"../dialog"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hagg.play("talk")
	player.move_to_think()
	animation_player.play("move")
	await  animation_player.animation_finished
	player.talk()
	dialog.play("dialog")
	await dialog.animation_finished
	SceneTrans.change_scene("res://entretient.tscn")
func _process(delta: float) -> void:
	if animation_player.is_playing():
		pass
	elif player_to_father.text!="":
		player.talk()
	else:
		player.stop_moving()
	
	
