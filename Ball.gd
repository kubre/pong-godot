extends Area2D
class_name Ball
"""
Ball Class handles bounces and sound played for ball collisons
"""

export(int) var speed: = 200
onready var direction: = Vector2(-1, 0)

signal increase_Player_score
signal increase_Computer_score


"""
Move the ball every physics process
"""
func _physics_process(delta: float) -> void:
    translate(direction * delta * speed)


"""
Bounce the ball, increase score and play sounds handled here
"""
func _on_Ball_area_entered(area: Area2D) -> void:
    var obj = area.name
    if obj == "Player" or obj == "Computer":
        # Inverse horizontal direction and throw ball at random y direction
        direction.x = -direction.x
        direction.y = randf() * 2.0 - 1
        $HitSound.play()
    elif obj == "TopWall" or obj == "BottomWall":
        # Just inverse vertical direction
        direction.y = -direction.y
        $HitSound.play()
    elif obj == "PlayerGoal":
        emit_signal("increase_Computer_score")
        $Tween.interpolate_callback(self, 1, "reset_pos")
        $Tween.start()
        $GoalSound.play()
    elif obj == "ComputerGoal":
        emit_signal("increase_Player_score")
        $Tween.interpolate_callback(self, 1, "reset_pos")
        $Tween.start()
        $GoalSound.play()

    direction = direction.normalized()    # Just keep direction
    speed *= 1.1                          # Increase speed at 110%


"""
Reset Ball to it's original position
"""
func reset_pos() -> void:
    # Magic numvbers are center of screen - ball size
    position = Vector2(316, 176)
    direction.x = -direction.x
    direction.y = randf() - 1


"""
Provides position to other node(Mainly AI in Deck script)
"""
func get_pos() -> Vector2:
    return position
