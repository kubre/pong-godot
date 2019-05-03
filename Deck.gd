extends Node2D


onready var ball: = $Ball
var speed = 100
var direction: int

func _on_Ball_increase_Computer_score() -> void:
    var score: = int($ComputerScore.text)
    $ComputerScore.text = String(score + 1)


func _on_Ball_increase_Player_score() -> void:
    var score: = int($PlayerScore.text)
    $PlayerScore.text = String(score + 1)


func _physics_process(delta: float) -> void:
    if ball.get_pos().y > $Computer.position.y:
        direction = 1
    else:
        direction = -1

    $Computer.position.y += direction * lerp(0, speed * delta, delta * 50)
    # Magic numbers for screen size - half paddles height
    $Computer.position.y = clamp($Computer.position.y, 20, 340)