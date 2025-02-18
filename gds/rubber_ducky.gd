extends Area3D
const ROT_SPEED = 2
const NUM_DUCKIES_TO_WIN = 40
@onready var score_label: Label = get_node("/root/Node3D/CanvasLayer/ScoreLabel")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_y(deg_to_rad(ROT_SPEED))


func _on_body_entered(body: Node3D) -> void:
	Global.ducks += 10
	score_label.text = "Score: " + str(Global.ducks)
	queue_free()

	if Global.ducks >= NUM_DUCKIES_TO_WIN:
		score_label.add_theme_font_size_override("font_size",50)
		score_label.add_theme_color_override("font_color",Color.RED)
		score_label.position=Vector2(300,250)
		
		score_label.text = "You win!! Final Score: " + str(Global.ducks)
		await get_tree().create_timer(3.0).timeout  
		Global.ducks = 0
		get_tree().quit()
