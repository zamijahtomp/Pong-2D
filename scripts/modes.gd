extends Control

@onready var cpu_btn = $VBoxContainer/CPU
@onready var coop_btn = $"VBoxContainer/2Player"
@onready var back_btn = $VBoxContainer/Back

func _ready() -> void:
	# Connect the buttons to their respective functions when clicked
	cpu_btn.pressed.connect(_on_cpu_pressed)
	coop_btn.pressed.connect(_on_twoplayer_pressed)
	back_btn.pressed.connect(GlobalManager._on_back_pressed)
	
	# Check saving/caching system to see if the shop button should be visible yet
	#$VBoxContainer/ShopButton.visible = SaveManager.load_shop_status()

func _on_cpu_pressed() -> void:
	# Set a global variable tracking the mode before switching scenes
	#GlobalGameManager.current_mode = "SOLO_ENDLESS"
	get_tree().change_scene_to_file("res://scenes/2Player.tscn")

func _on_twoplayer_pressed() -> void:
	#GlobalGameManager.current_mode = "TWO_PLAYER"
	get_tree().change_scene_to_file("res://scenes/2Player.tscn")
