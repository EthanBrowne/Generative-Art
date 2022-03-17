PGraphics pg;
boolean b = true;
float x = 450;
float oldx = x;
float y = 950;
float mx = 0;
int my = 4;
float circleX = 500;
float circleY = 250;
ArrayList<Wacky> circleList = new ArrayList<Wacky>();

void setup() {
	pixelDensity(2);
	size(1000,1000);
	background(#182030);
	pg = createGraphics(1000,1000);
}

void draw() {
	pg.beginDraw();
	noStroke();
	fill(#182030,35);
	rect(0,0,width,height);
	collide();
	fill(#f9d71c);
	circle(circleX, circleY, 15);
	int r = int(random(0,8));
	if (r == 0){
		Wacky placeHolder = new Wacky(circleX+(random(-10,10)),circleY+(random(-10,10)));
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
	//for (Wacky i: circleList){
	//	i.drawAndShrink();
	//}
	circleY += my;
	circleX += mx;
	pg.endDraw();
	//image(pg, 0, 0);
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
	fill(#182030,35);
	rect(0,0,width,height);
		for (Wacky i: circleList){
		i.drawAndShrink();
	}
	image(pg,0,0);
}
class Wacky{
	//color list
	int [] colors = {#23C9FF,#7CC6FE, #CCD5FF, #E7BBE3, #C884A6};
	//radius of circle
	int r = int(random(15,width/2));
	//postion values of circle
	float x;
	float y;
	int w = 4;
	int color_;
	Wacky(float x, float y){
		//sets postion of circle to the x and y value of the change in slope
		this.x = x;
		this.y = y;
		
	}
	//function that shrinks the circles radius and draws it.
	void drawAndShrink(){
		color_ = colors[int(random(0,colors.length))];
		pg.strokeWeight(w);
		pg.noFill();
		pg.stroke(color_);
		pg.circle(x,y,r);
		if(r-w < 0){
			r = 0;
		}else if (r > 0){
			r-=w;
		}
	}
}