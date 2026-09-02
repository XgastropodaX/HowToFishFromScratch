extends RigidBody3D

func lift_item(item:RigidBody3D,target_position:Vector3,delta):
		#attach to objects to move
		var I = 500.0 #influence #export to make adjustable
		var S = 20.0 #stiffness #export to make adjustable
		var P = target_position - item.global_position
		var M = item.mass
		var V = item.linear_velocity
		var impulse = (I*P) - (S*M*V)
		item.apply_central_impulse(impulse * delta)
