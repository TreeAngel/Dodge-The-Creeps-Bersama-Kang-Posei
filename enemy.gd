extends Area2D

@export var speed: int
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
var direction = Vector2.ZERO

func _ready():
	var animation_name = sprite.sprite_frames.get_animation_names()
	sprite.play(animation_name[randi() % animation_name.size()])

func _process(delta):
	position += direction * speed

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
