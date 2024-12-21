extends Map

@onready var santa : Area2D =  $SantaPowerUp
@onready var shield : Area2D =  $ShieldPowerUp
@onready var strength : Area2D =  $StrengthPowerUp
var SantaPowerUpScene = preload("res://Scenes/SantaPowerUp.tscn")
var StrengthPowerUpScene = preload("res://Scenes/StrengthPowerUp.tscn")
var ShieldPowerUpScene = preload("res://Scenes/ShieldPowerUp.tscn")
var SantaPowerUp
var ShieldPowerUp
var StrengthPowerUp
var SantaPosition
var ShieldPosition
var StrengthPosition
var powerUpRandomIndex = 3000
var rand
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SantaPosition = santa.position
	ShieldPosition = shield.position
	StrengthPosition = strength.position
	remove_child(santa)
	remove_child(shield)
	remove_child(strength)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rand = int(randi_range(0,powerUpRandomIndex))
	randomize()
	if mode != GameManager.POWERUP:
		return
	if rand==750:
		_spawnSanta()
	elif rand==1500:
		_spawnShield()
	elif rand==2250:
		_spawnStrength()
	pass

func _intializePowerUp():
	ShieldPowerUp = ShieldPowerUpScene.instantiate()
	SantaPowerUp = SantaPowerUpScene.instantiate()
	StrengthPowerUp = StrengthPowerUpScene.instantiate()
	
func _spawnSanta():
	SantaPowerUp = SantaPowerUpScene.instantiate()
	SantaPowerUp.position = SantaPosition
	add_child(SantaPowerUp)
	
func _spawnStrength():
	StrengthPowerUp = StrengthPowerUpScene.instantiate()
	StrengthPowerUp.position = StrengthPosition
	add_child(StrengthPowerUp)

func _spawnShield():
	ShieldPowerUp = ShieldPowerUpScene.instantiate()
	ShieldPowerUp.position = ShieldPosition
	add_child(ShieldPowerUp)
