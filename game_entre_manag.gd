extends Node

@onready var player: CharacterBody2D = %player
@onready var enter: AnimationPlayer = $"../enter"
@onready var go_to_chair: AnimationPlayer = $"../go_to_chair"
@onready var player_sit_back_cos: Sprite2D = $"../PlayerSitBackCos"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.walk_cost()
	enter.play("move")
	await enter.animation_finished
	player.talk_cos()
	await get_tree().create_timer(2).timeout
	player.walk_cost()
	go_to_chair.play("move")
	await  go_to_chair.animation_finished
	player.visible = false
	player_sit_back_cos.visible = true
	
