extends Node2D

@export var enemy: PackedScene
var score = 0

func _on_timer_timeout():
	var enemy_scene = enemy.instantiate()
	
	var enemy_spawn = $Path2D/PathFollow2D
	enemy_spawn.progress_ratio = randf()
	enemy_scene.position = enemy_spawn.global_position
	
	var rotation = enemy_spawn.rotation + deg_to_rad(90) + deg_to_rad(randi_range(-45, 45))
	enemy_scene.direction = Vector2(1, 0).rotated(rotation)
	
	add_child(enemy_scene) 
	
	enemy_scene.rotation = rotation


func _on_score_timer_timeout():
	score += 1
	$Label.text = str(score)
