extends Area3D
const ROT_SPEED = 2
const NUM_CHESTS_TO_WIN = 60
@onready var score_label: Label = get_node("/root/Node3D/CanvasLayer/ScoreLabel")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_y(deg_to_rad(ROT_SPEED))


func _on_body_entered(body: Node3D) -> void:
	Global.chests += 30
	score_label.text = "Score: " + str(Global.chests)
	queue_free()

	if Global.chests >= NUM_CHESTS_TO_WIN:
		score_label.add_theme_font_size_override("font_size",50)
		score_label.add_theme_color_override("font_color",Color.RED)
		score_label.position=Vector2(300,250)
		
		score_label.text = "You win!! Final Score: " + str(Global.chests)
		await get_tree().create_timer(3.0).timeout  
		Global.chests = 0
		get_tree().quit()
