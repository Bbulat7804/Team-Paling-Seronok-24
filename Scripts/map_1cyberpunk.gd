extends Node2D

@onready var santa : Area2D =  $SantaPowerUp
@onready var shield : Area2D =  $ShieldPowerUp
@onready var strength : Area2D =  $StrengthPowerUp

var SantaPosition
var ShieldPosition
var StrengthPosition
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SantaPosition = santa.position
	ShieldPosition = shield.position
	StrengthPosition = strength.position
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
