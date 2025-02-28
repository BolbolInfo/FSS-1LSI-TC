extends Node
@onready var player: CharacterBody2D = %player
@onready var hagg: AnimatedSprite2D = %hagg
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var player_to_father = $"../player_to_father"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hagg.play("talk")
	player.move_to_think()
	animation_player.play("move")
	await  animation_player.animation_finished
	player.talk()
	await player_to_father.player_to_father()
	SceneTrans.change_scene("res://entretient.tscn")
