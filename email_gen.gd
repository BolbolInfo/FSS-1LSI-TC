extends Marker2D

const email_scene = preload("res://email.tscn")

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func shoot_bubble():

	var num_bubbles =5 # Number of bubbles to spawn in the spray.
	var spread_angle = 200  # Spread angle in degrees.
	var angle_step = spread_angle / (num_bubbles - 1)
	var start_angle = -spread_angle / 2
	for j in range(3):
		for i in range(num_bubbles):
			var email = email_scene.instantiate()
			email.global_position = global_position + Vector2(0, -10)  # Spawn slightly above player
			
			var my_random_number = rng.randf_range(0.8, 1.2)  # Add slight randomness
			var angle = start_angle + (i * angle_step * my_random_number)
			var direction = Vector2(0, -1).rotated(deg_to_rad(angle))  # Shoot upwards with spread

			email.direction = direction

			get_parent().add_child(email)
			await get_tree().create_timer(0.05).timeout
		await get_tree().create_timer(2).timeout
