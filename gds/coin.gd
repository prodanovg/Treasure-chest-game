extends Area3D

const ROT_SPEED = 2
const NUM_COINS_TO_WIN = 10
@onready var score_label: Label = get_node("/root/Node3D/CanvasLayer/ScoreLabel")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_y(deg_to_rad(ROT_SPEED))
	


func _on_body_entered(body: Node3D) -> void:
	Global.coins += 1
	score_label.text = "Score: " + str(Global.coins)
	queue_free()

	if Global.coins >= NUM_COINS_TO_WIN:
		score_label.add_theme_font_size_override("font_size",50)
		score_label.add_theme_color_override("font_color",Color.RED)
		score_label.position=Vector2(300,250)
		
		score_label.text = "You win!! Final Score: " + str(Global.coins)
		await get_tree().create_timer(3.0).timeout  
		Global.coins = 0
		get_tree().quit()
