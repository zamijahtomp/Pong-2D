extends CanvasLayer

# Reference to the actual background visual rectangle
@onready var bg_rect = $BGColor

# Define a few standard accessibility palettes
# (Background Color, Center Line Color)
const THEMES = {
	"default_dark": [Color("1a1a1a"), Color("333333")],
	"high_contrast_black": [Color("000000"), Color("ffffff")],
	"accessible_blue": [Color("0d1b2a"), Color("415a77")],
	"light_mode": [Color("f4f4f9"), Color("e0e0e0")]
}

func _ready() -> void:
	# Start with your classic dark arcade mode
	#apply_theme("default_dark")
	pass

func apply_theme(theme_name: String) -> void:
	if theme_name in THEMES:
		var colors = THEMES[theme_name]
		
		# Change the solid background color
		bg_rect.color = colors[0]
		
		# Optional: If you draw a dashed line down the center of the court using a line node, 
		# you can update its color here to match the new contrast level
		if get_node_or_null("CenterLine"):
			$CenterLine.modulate = colors[1]
			
func _input(event: InputEvent) -> void:
	# Just a temporary dev shortcut: Press 'T' to cycle to High Contrast mode
	if event.is_action_pressed("ui_focus_next"): # Usually mapped to Tab
		apply_theme("high_contrast_black")
