extends CharacterBody2D

# Expose these variables to the Godot Inspector for easy tuning
@export var speed: float = 400.0
#@export_enum("Player 1", "Player 2", "CPU") var controller_type: String = "Player 1"

# We'll need a reference to the ball if this paddle is controlled by the CPU
@onready var ball = get_node_or_null("../Ball") 

func _physics_process( _delta: float) -> void:
	var input_direction: float = 0.0

	# Basic AI: Track the ball's Y position
	if ball:
		# If the ball is below the paddle, move down. If above, move up.
		if ball.global_position.y > global_position.y + 10:
			input_direction = 1.0
		elif ball.global_position.y < global_position.y - 10:
			input_direction = -1.0

	# 2. Apply the movement
	velocity.y = input_direction * speed
	velocity.x = 0 # Keep the paddle locked on the X axis
	
	# move_and_slide handles the physics movement automatically
	move_and_slide()
	
	# 3. Optional: Screen Clamping (Keep paddle from leaving the screen)
	# Adjust 0 and 600 based on your game's window height resolution
	#global_position.y = clamp(global_position.y, 50, 550)
