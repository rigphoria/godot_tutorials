extends KinematicBody2D


var speed = 10000.0
var diagonalMultiplier = 0.7
var velocity:Vector2 = Vector2()

#Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#zero out velocity in case no buttons are pressed this frame
	velocity.x = 0
	velocity.y = 0

	#vertical movement
	if Input.is_action_pressed("up"):
		velocity.y -= speed
	if Input.is_action_pressed("down"):
		velocity.y += speed

	#horizontal movement
	if Input.is_action_pressed("left"):
		velocity.x -= speed
	if Input.is_action_pressed("right"):
		velocity.x += speed

	#if both axes have movement use a diagonal multipler to slow them down
	if velocity.x != 0 && velocity.y != 0:
		velocity *= diagonalMultiplier;
		velocity *= delta
	else:
		velocity *= delta

	print(velocity)

	#use our velocity value to actually move
	velocity = move_and_slide(velocity)