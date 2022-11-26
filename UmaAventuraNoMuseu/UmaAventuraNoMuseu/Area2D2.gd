extends Area2D

var player = null
var canInteract: bool = true

func unfreeze():
	player.set_physics_process(true)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	if Input.is_action_just_pressed("interagir") and player != null and canInteract:
		canInteract = false
		var cena = preload("res://Info2Nivel2.tscn").instance()
		get_parent().get_node("CanvasLayer2").add_child(cena)
		cena.connect("closed", self, "unfreeze")
		player.set_physics_process(false)
		player.get_node("Animacao").play("parada")

func _on_Area2D2_body_entered(body):
	player = body
	


func _on_Area2D2_body_exited(body):
	player = null
	canInteract = true
