PGraphics pg;

float x = 450;
float oldx = x;
int y = 950;
float mx = 0;
int my = 4;
int circleX = 500;
int circleY = 250;
ArrayList<Wacky> circleList = new ArrayList<Wacky>();
ArrayList<Wacky> growList = new ArrayList<Wacky>();

void setup() {
	size(1000,1000);
	background(255,255,255);
	pg = createGraphics(1000,1000);
}

void draw() {
	pg.beginDraw();
	fill(255,255,255);
	rect(0,0,width,height);
	collide();
	fill(0,0,0);
	circle(circleX, circleY, 15);
	int r = int(random(0,26));
	if (r == 0){
		Wacky placeHolder = new Wacky(circleX+int(random(-10,11)),circleY+int(random(-10,11)));
		circleList.add(placeHolder);
	}
	rect(x, y, height/10, width/100);
	if(keyPressed){
		oldx = x;
		if(key == 'a' && x >= 0){
			x -= 5;
		}else if(key == 'd' && x+height/10 <= width){
			x += 5;
		}
	}
	for (Wacky i: circleList){
		i.drawAndShrink();
	}
	circleY += my;
	circleX += mx;
	pg.endDraw();
	image(pg, 0, 0);
}

void collide(){
	if(circleX > x && circleX < x+width/10 && circleY >= y){
		my = -4;
		mx = random(-3,3);
		while (mx > -1 && mx < 1){
			mx = random(-3,3);
		}
	}else if(circleX < 0 || circleX > width){
		mx = mx*-1;
	}else if(circleY < 0){
		my = my*-1;
	}else if(circleY > width){
		respawn();
	}
}

void respawn(){
	circleX = 500;
	circleY = 250;
	mx = 0;
}
class Wacky{
	//color list
	int [] colors = {#FF0000, #FFA500, #FFFF00, #00FF00, #0000FF, #A020F0};
	//radius of circle
	int r = int(random(15,60));
	//postion values of circle
	float x;
	int y;
	Wacky(float x, int y){
		//sets postion of circle to the x and y value of the change in slope
		this.x = x;
		this.y = y;
	}
	//function that shrinks the circles radius and draws it.
	void drawAndShrink(){
		noFill();
		pg.stroke(colors[int(random(0,colors.length))]);
		pg.circle(x,y,r);
		if (r > 0){
			r--;
		}
	}
	void drawAndGrow(){
		noFill();
		stroke(0,0,0);
		circle(x,y,r);
		r++;
	}
}