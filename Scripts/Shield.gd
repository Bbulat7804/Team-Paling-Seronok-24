extends Area2D

#reference

func _ready():
  
	timer.connect("timeout", self, "_on_Timer_timeout")

func _on_Area2D_body_entered(body):
  
	if body.is_in_group("Shield"): 
	  
		timer.start()

func _on_Timer_timeout():
   
	print("Timer expired after collision!")
  
