extends Node

@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("pop_up")
	await  animation_player.animation_finished
	SceneTrans.change_scene("res://father_room.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
