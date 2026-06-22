extends Control

# Grab references to both menu containers
@onready var main: Control = $"../Game/MainMenu"
@onready var modes: Control = $"../Game/Modes"
@onready var coop: Node2D = $"../Game/2Player"

func _ready() -> void:
	# Ensure the game opens to the main menu
	main.visible = true
	modes.visible = false

# Connect this to your Main Menu's "Start" button pressed signal
func _on_play_pressed() -> void:
	main.visible = false
	modes.visible = true

# Connect this to your Game Modes' "Back" button pressed signal
func _on_back_pressed() -> void:
	modes.visible = false
	main.visible = true
	
func _on_cpu_pressed() -> void:
	# Set a global variable tracking the mode before switching scenes
	#GlobalGameManager.current_mode = "SOLO_ENDLESS"
	modes.visible = false
	coop.visible = true

func _on_twoplayer_pressed() -> void:
	modes.visible = false
	coop.visible = true
	
func _on_settings_pressed() -> void:
	# This can toggle a separate small popup window/panel on your screen
	# where they can change background contrast colors!
	$AccessibilityPanel.visible = !$AccessibilityPanel.visible
