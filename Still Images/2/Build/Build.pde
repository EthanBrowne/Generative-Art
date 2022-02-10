void setup() {
	size(1000, 1000);
	background(0,0,0);
	for(int i = 1000; i > 0; i--){
		square(500, 500, 100);
		rotate(radians(int(random(0, 90))));
		//fill(random(0, 255), random(0, 255), random(0, 255));
	}
	
}