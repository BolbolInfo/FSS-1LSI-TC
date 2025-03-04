extends Node

@onready var player: CharacterBody2D = %player
@onready var enter: AnimationPlayer = $"../enter"
@onready var go_to_chair: AnimationPlayer = $"../go_to_chair"
@onready var player_sit_back_cos: Sprite2D = $"../PlayerSitBackCos"
@onready var player_enter = %player_enter
@onready var player_enter_teacher = %player_enter_teacher
@onready var choice_1 = %choice_1
@onready var choice_2 = %choice_2
var index = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	choice_1.disabled = true
	choice_1.visible = false
	choice_2.disabled = true
	choice_2.visible = false
	player.walk_cost()
	enter.play("move")
	await enter.animation_finished
	player.talk_cos()
	player_enter.text = "bonjour, est ce que je peux entrer?"
	await get_tree().create_timer(2).timeout
	player_enter.text = ""
	player.stop_moving_cos()
	player_enter_teacher.text = "Bonjour, M. Ben Adi ! Bienvenue chez Google et merci d’être venu aujourd’hui."
	await get_tree().create_timer(2).timeout
	player_enter_teacher.text = ""
	player.walk_cost()
	go_to_chair.play("move")
	await go_to_chair.animation_finished
	player.visible = false
	player_sit_back_cos.visible = true
	choice_1.disabled = false
	choice_1.visible = true
	choice_2.disabled = false
	choice_2.visible = true
