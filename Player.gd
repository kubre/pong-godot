extends Area2D

export (int) var speed: = 160
var direction: int

func _ready() -> void:
    pass

func _physics_process(delta: float) -> void:

    if Input.is_action_pressed("ui_up"):
        direction = -1
    elif Input.is_action_pressed("ui_down"):
        direction = 1
    else:
        direction = 0

    # Movement
    position.y += delta * direction * speed
    # Magic numbers for screen size - half paddles height
    position.y = clamp(position.y, 20, 340)
