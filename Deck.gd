extends Node2D
class_name Deck
"""
Deck is just world node to increase score and handle the AI
"""


onready var ball: = $Ball
# Increase the speed for difficulty
var speed: = 190
var direction: int


"""
Increase the computer score
"""
func _on_Ball_increase_Computer_score() -> void:
    var score: = int($ComputerScore.text)
    $ComputerScore.text = String(score + 1)


"""
Increase the player score
"""
func _on_Ball_increase_Player_score() -> void:
    var score: = int($PlayerScore.text)
    $PlayerScore.text = String(score + 1)


"""
Move the Computer Paddle
"""
func _physics_process(delta: float) -> void:
    # All the AI Magic
    if ball.get_pos().y > $Computer.position.y:
        direction = 1
    else:
        direction = -1

    # Smooth out movement still little buggy don't know why
    $Computer.position.y +=  direction * lerp(0, speed, delta * 0.65)
    # Magic numbers for screen size - half paddles height
    $Computer.position.y = clamp($Computer.position.y, 20, 340)

