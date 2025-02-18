extends Node3D

@export var treasure_scene: PackedScene  
@export var number_of_treasures: int = 5  
@export var spawn_area: AABB  

func _ready():
	add_to_group("treasure_spawner")
	spawn_treasures()

func spawn_treasures():
	for _i in range(number_of_treasures):
		var treasure = treasure_scene.instantiate()
		var random_position = Vector3(
			randf_range(spawn_area.position.x, spawn_area.position.x + spawn_area.size.x),
			0,
			randf_range(spawn_area.position.z, spawn_area.position.z + spawn_area.size.z)
		)
		treasure.position = random_position
		treasure.add_to_group("treasure")
		add_child(treasure)
