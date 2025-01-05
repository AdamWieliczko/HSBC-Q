VectorOfTimes: { 
	[startTime; t]
	vector: ("v"$startTime) + 2 * til 1000; 
	position: vector ? t; 
	adjustedVector: vector[where t <= vector]; 
	(position; adjustedVector) 
 }