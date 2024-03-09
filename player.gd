extends Area2D

@export var speed: int
var screen_size

func _ready():
	screen_size = get_viewport().size

func _process(delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("up"):
		direction.y -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1

	if direction.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	position += direction * speed * delta * 60
	position = position.clamp(Vector2.ZERO, screen_size)

	if direction.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif direction.x < 0:
		$AnimatedSprite2D.flip_h = true

	if  direction.y > 0:
		$AnimatedSprite2D.flip_v = true
	elif direction.y < 0:
		$AnimatedSprite2D.flip_v = false

	if direction.x != 0:
		$AnimatedSprite2D.animation = "walk"
	elif direction.y != 0:
		$AnimatedSprite2D.animation = "up"


func _on_area_entered(area):
	$"../Timer".stop()
	$"../Label".visible = false
	$"../Label/ScoreTimer".stop()
	$"../BGM".stop()
	$"../Death".play()
	get_tree().change_scene_to_file("res://game_over.tscn")
	queue_free()
