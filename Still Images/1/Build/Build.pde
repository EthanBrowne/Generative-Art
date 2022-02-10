void setup() {
	size(1000,1000);
	background(39,45,46);
	int [][] colors = {{218,112,214},{75,0,130},{0, 0, 0},{35, 35, 53},{29, 17, 53},{12, 22, 79},{186, 30, 104},{86, 67, 253},{118, 73, 254},{252, 251, 254},{53,1,44},{0,194,209}};
	for (int counter = int(random(1000,10000)); counter > 0; counter--){
		int length = int(random(3, 15));
		int shape = int(random(0,3));
		int x = int(random(0,1000));
		int y = int(random(0,1000));
		int colornum = int(random(0,colors.length));
		if (shape == 0){
			circle(x, y, length);
		}else if(shape == 1){
			triangle(x, y, x+length, y+length, x+length, y);
		}else if(shape == 2){
			square(x,y,length);
		}
		rotate(radians(random(0,90)));
		noStroke();
		fill(colors[colornum][0], colors[colornum][1], colors[colornum][2]);
	}
}