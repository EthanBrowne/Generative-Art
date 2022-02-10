int slope = newslope();
int y = 1000/2;
int x = 0;
int xinc = 6;
int oldy = y;
int oldx = x;
int c = xinc;
int bounces = 0;
int b = int(random(2,6));
int [] colors = {#012A36, #29274C, #7E52A0, #D295BF, #E6BCCD};
void setup() {
	size(1000,1000);
	background(0,0,0);
}

void draw() {
	if (b > bounces){
		updateX();
		updateY();
		int r = int(random(0, 10));
		if (r == 0){
			slope = newslope();
		}
		for (int i = 0; i <= colors.length-1; i++){
			stroke(colors[i]);
			line(oldx, oldy+i*5, x, y+i*5);
		}
		oldy = y;
		oldx = x;
	}
}

int newslope() {
	return int(random(-10,11));
}

void updateX(){
	if (oldx >= 1000){
		c = -xinc;
		bounces++;
	}
	else if (oldx <= 0){
		c = xinc;
		bounces++;
	}
	x+=c;
}

void updateY(){
	if (y + slope >= height || y + slope <= 0){
		slope = slope *-1;
	}
	y += slope;
}