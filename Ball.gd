extends Area2D


export(int) var speed: = 200
onready var direction = Vector2(-1, 0)

signal increase_Player_score
signal increase_Computer_score

func _ready() -> void:
    #    direction = position.normalized()
    pass


func _process(delta: float) -> void:
    translate(direction * delta * speed)


func _on_Ball_area_entered(area: Area2D) -> void:

    var obj = area.name

    if obj == "Player" or obj == "Computer":
        # Inverse horizontal direction and throw ball at random y direction
        direction.x = -direction.x
        direction.y = randf() * 2.0 - 1
    elif obj == "TopWall" or obj == "BottomWall":
        # Just inverse vertical direction
        direction.y = -direction.y
    elif obj == "PlayerGoal" or obj == "ComputerGoal":
        if obj == "Computer":
            emit_signal("increase_Computer_score")
        else:
            emit_signal("increase_Player_score")

        position = Vector2(316, 176)
        direction.x = -direction.x
        direction.y = randf() - 1

    direction = direction.normalized()
    speed *= 1.1

func get_pos() -> Vector2:
    return position