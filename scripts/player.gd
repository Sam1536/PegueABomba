extends KinematicBody2D


export var speed = 300
onready var spr_player = $sprite


func _ready():
	pass 



func _process(delta):
	var dir = Vector2(0,0)
	#print(self.global_position) #63 e 452 limite da tela 
	if Input.is_action_pressed("left"):
		spr_player.flip_h = true #sprite virar
		# OU spr_player.scale.x = -1
		dir.x = -1
		$shape.position.x = -23 #para o colisor virar junto com o personagem 
	
	if Input.is_action_pressed("right"):
		spr_player.flip_h = false 
		# OU spr_player.scale.x = 1
		dir.x = 1
		$shape.position.x = 24.5
	
	if self.position.x < 63: # limite de tela
		self.position.x = 63
	
	if self.position.x > 452:
		self.position.x = 452
	
	
	move_and_slide(dir * speed)
	
