extends Area2D
#carregamento da fumaça

var pre_smoke = preload ("res://scenes/smoke.tscn")
var t_smoke = 0

  #carregamento da explosao da fumaça
var pre_fumaca = preload("res://scenes/fumaca.tscn")

#carregamento da explosao com o chao
var pre_explosao = preload("res://scenes/explosao.tscn")

export var vel = 100

func _ready():
	pass 

func _process(delta):

#tempo para instanciar uma fumaça
	t_smoke += delta
	if t_smoke > rand_range(0.1,0.2):
		Smoke()
		t_smoke = 0
	
	vel += 3
	self.position.y += vel * delta
	if self.position.y > 700:
		self.queue_free()
	
	


func _on_bomba_body_entered(body):
	 if body.name == "player":
		 get_parent().pontos += 10
		 Emitir_fumaca()
		 queue_free()
		 


func _on_bomba_area_entered(area):
	if area.name == "chao":
		get_parent().pontos -= 10
		Emitir_explosao()
		queue_free()

func Smoke():
	var s = pre_smoke.instance()
	s.position = position + Vector2(rand_range(30,15),-20)
	get_parent().add_child(s)

func Emitir_fumaca():
	var f = pre_fumaca.instance()
	f.position = position
	get_parent().add_child(f)


func Emitir_explosao():
	var e = pre_explosao.instance()
	e.position = position
	get_parent().add_child(e)
	
