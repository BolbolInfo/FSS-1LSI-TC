extends Node

@onready var player: CharacterBody2D = %player
@onready var camera_2d: Camera2D = $"../Camera2D"
@onready var move_stage_animator = $move_stage_animator


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(5).timeout
	player.move_from_stage()
	move_stage_animator.play("move_stage")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
