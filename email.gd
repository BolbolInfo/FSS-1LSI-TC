extends Sprite2D


var speed: float   # Movement speed of the bubble.
var lifetime: float = 0.5  # Duration before the bubble disappears.

var direction = Vector2.ZERO  # Direction the bubble travels.

var rng = RandomNumberGenerator.new()
func _ready():
	# Start the bubble's lifetime timer. 
	lifetime= rng.randf_range(1,3)
	$Timer.start(lifetime)
	speed = rng.randf_range(10,15)

func _physics_process(delta):
	position += direction * speed * delta


func _on_timer_timeout() -> void:
	queue_free()
