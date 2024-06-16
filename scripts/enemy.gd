extends Area2D

signal died

@export var speed = 500

#@onready var visible_notifier = $VisibleNotifier

func _ready():
#	visible_notifier.connect("screen_exited", _on_screen_exited)
	pass

func _physics_process(delta):
	global_position.x -= speed * delta

func _on_screen_exited():
	queue_free()

func _on_body_entered(body):
	body.take_damage()
	die()

func die():
	emit_signal("died")
	queue_free()
