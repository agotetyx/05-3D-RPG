extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialogue")

var dialogue = ["Welcome to my world! (Press E to continue)"
, "I am going to test your agility and accuracy"
, "Shoot all the targets in the given time or meet your doom"
, "The challenge begins once you press E ooo meta"
, "Good luck human"]

func _ready():
	$AnimationPlayer.play("Idle")
	Dialogue.connect("finished_dialogue", self, "finished")


func _on_Area_body_entered(body):
	print ("entered")
	Dialogue.start_dialogue(dialogue) 

func _on_Area_body_exited(body):
	print("exit ")
	Dialogue.hide_dialogue()
	
	
func finished():
	get_node("/root/Game/Target_container").show()
	Global.timer = 120
	Global.update_time()
	get_node("/root/Game/UI/Timer").start()
