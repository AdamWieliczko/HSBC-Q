VectorOfTimes: {
	[t]
	vector: ("v"$.z.z) + 2 * til 1000;
	position: vector ? t;
	adjustedVector: vector[where t <= vector];
	(position; adjustedVector)
 }