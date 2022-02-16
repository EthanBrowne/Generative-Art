int slope = newslope();
int y = 1000/2;
int x = 0;
int xinc = 6;
int oldy = y;
int oldx = x;
int c = xinc;
int [] colors = {#FF0000, #FFA500, #FFFF00, #00FF00, #0000FF, #A020F0};
ArrayList<Wacky> circleList = new ArrayList<Wacky>();
void setup() {
	size(1000,1000);
	background(0,0,0);
}

void draw() {
	fill(0,0,0,20);
	rect(0, 0, width, height, 10);
	updateX();
	updateY();
	int r = int(random(0, 35));
	if (r == 0){
		stroke(0,0,0);
		Wacky placeHolder = new Wacky(x,y);
		circleList.add(placeHolder);
		slope = newslope();
	}
	for (int i = 0; i <= colors.length-1; i++){
		stroke(colors[i]);
		line(oldx, oldy+i*5, x, y+i*5);
	}
	for (Wacky i: circleList){
		i.drawAndShrink();
	}
	oldy = y;
	oldx = x;
}

int newslope() {
	return int(random(-10,11));
}

void updateX(){
	if (oldx >= 1000){
		c = -xinc;
	}
	else if (oldx <= 0){
		c = xinc;
	}
	x+=c;
}

void updateY(){
	if (y + slope >= height || y + slope <= 0){
		slope = slope *-1;
	}
	y += slope;
}

class Wacky{
	int r = int(random(50,150));
	int x;
	int y;
	Wacky(int x, int y){
		this.x = x;
		this.y = y;
	}
	void drawAndShrink(){
		stroke(227,223,255);
		circle(x,y,r);
		if (r > 0){
			r--;
		}
	}
}