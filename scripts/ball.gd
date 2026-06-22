extends Area2D

@export var initial_speed: float = 400.0
@export var speed_multiplier: float = 1.05 # Increases speed by 5% on every bounce

var speed: float = 0.0
var direction: Vector2 = Vector2.ZERO
var screen_size: Vector2

func _ready() -> void:
	screen_size = get_viewport_rect().size
	reset_ball()
	
	# Connect the built-in signal that detects when something enters the ball's area
	body_entered.connect(_on_body_entered)

func _process(delta: float) -> void:
	# Move the ball every frame
	position += direction * speed * delta
	
	# Bounce off the top and bottom walls manually
	if position.y <= 0 and direction.y < 0:
		direction.y *= -1
	elif position.y >= screen_size.y and direction.y > 0:
		direction.y *= -1
		
	# Check for scoring (Left/Right bounds)
	if position.x < 0:
		# Player 2 scores!
		reset_ball()
	elif position.x > screen_size.x:
		# Player 1 scores!
		reset_ball()

func reset_ball() -> void:
	# Put ball back in the center
	position = screen_size / 2
	speed = initial_speed
	
	# Launch in a random left/right direction, slightly angled up or down
	var x_dir = [-1.0, 1.0].pick_random()
	var y_dir = randf_range(-0.5, 0.5)
	direction = Vector2(x_dir, y_dir).normalized()

# This triggers automatically when a paddle (a physics body) enters the ball
func _on_body_entered(body: Node2D) -> void:
	# Check if the thing we hit is a paddle
	if "Paddle" in body.name or "Player" in body.name:
		# Flip the horizontal direction to bounce off
		direction.x *= -1
		
		# Slightly change the vertical angle based on where it hit the paddle
		# This lets players "steer" the ball depending on paddle movement
		direction.y += randf_range(-0.2, 0.2)
		direction = direction.normalized()
		
		# Amp up the speed for that intense arcade feel
		speed *= speed_multiplier
