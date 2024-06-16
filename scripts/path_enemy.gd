extends Path2D

@onready var path_follow = $PathFollow2D

func _ready():
	path_follow.set_progress_ratio(1)

func _process(delta):
	path_follow.progress_ratio -= 0.35 * delta
