float x = 450;
float oldx = x;
int y = 950;
float mx = 0;
int my = 4;
int circleX = 500;
int circleY = 250;
int oldCX = circleX;
int oldCY = circleY;
ArrayList<Wacky> circleList = new ArrayList<Wacky>();
ArrayList<Wacky> growList = new ArrayList<Wacky>();

void setup() {
	size(1000,1000);
	background(255,255,255);
}

void draw() {
	fill(255,255,255);
	rect(0,0,width,height,10);
	collide();
	noStroke();
	fill(255,255,255);
	rect(oldx,y,height/10, width/100);
	stroke(255,255,255);
	circle(oldCX, oldCY, 15);
	fill(0,0,0);
	circle(circleX, circleY, 15);
	int r = int(random(0,31));
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
	oldCX = circleX;
	oldCY = circleY;
	circleY += my;
	circleX += mx;

}

void collide(){
	if(circleX > x && circleX < x+width/10 && circleY >= y){
		my = -4;
		mx = random(-3,3);
		while (mx > -.5 && mx < .5){
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
	int r = int(random(15,45));
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
		stroke(colors[int(random(0,colors.length))]);
		circle(x,y,r);
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