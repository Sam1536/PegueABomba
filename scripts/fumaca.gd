extends Sprite


func _ready():
	pass 


func _process(delta):
	pass


func _on_anim_animation_finished(anim_name):
	queue_free()
