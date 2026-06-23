extends Control

@onready var play = $VBoxContainer/Play
#@onready var endless_btn = $VBoxContainer/EndlessButton
#@onready var coop_btn = $VBoxContainer/TwoPlayerButton
@onready var settings_btn = $VBoxContainer/Settings
@onready var animation_player : AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	## Connect the buttons to their respective functions when clicked
	play.pressed.connect(GlobalManager._on_play_pressed)
	animation_player.play("rotate")
	##endless_btn.pressed.connect(_on_endless_pressed)
	##coop_btn.pressed.connect(_on_twoplayer_pressed)
	#settings_btn.pressed.connect(_on_settings_pressed)
	
	# Check saving/caching system to see if the shop button should be visible yet
	#$VBoxContainer/ShopButton.visible = SaveManager.load_shop_status()
#
#func _on_play_pressed() -> void:
	# Set a global variable tracking the mode before switching scenes
	#GlobalGameManager.current_mode = "SOLO_ENDLESS"
	#get_tree().change_scene_to_file("res://scenes/Modes.tscn")
	

#func _on_endless_pressed() -> void:
	## Set a global variable tracking the mode before switching scenes
	##GlobalGameManager.current_mode = "SOLO_ENDLESS"
	#get_tree().change_scene_to_file("res://scenes/pong_game.tscn")
#
#func _on_twoplayer_pressed() -> void:
	##GlobalGameManager.current_mode = "TWO_PLAYER"
	#get_tree().change_scene_to_file("res://scenes/2Player.tscn")

#func _on_settings_pressed() -> void:
	## This can toggle a separate small popup window/panel on your screen
	## where they can change background contrast colors!
	#$AccessibilityPanel.visible = !$AccessibilityPanel.visible
