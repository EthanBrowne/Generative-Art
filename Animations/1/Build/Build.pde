//Global Variables
int slope = newslope();
int y = 1000/2;
int x = 0;
int xinc = 6;
int oldy = y;
int oldx = x;
int c = xinc;
//Colors on the line
int [] colors = {#FF0000, #FFA500, #FFFF00, #00FF00, #0000FF, #A020F0};
//List of Wacky Objects
ArrayList<Wacky> circleList = new ArrayList<Wacky>();
//Setup function
void setup() {
	size(1000,1000);
	background(0,0,0);
}
//Draw Function
void draw() {
	//Color of transparent rect. Same as background
	fill(0,0,0,20);
	rect(0, 0, width, height, 10);
	//Moves the line
	updateX();
	updateY();
	//Generates a a random number to see if changes slope
	int r = int(random(0, 35));
	if (r == 0){
		//change slope and generate a shrinking sphere
		stroke(0,0,0);
		Wacky placeHolder = new Wacky(x,y);
		circleList.add(placeHolder);
		slope = newslope();
	}
	//draw the lines
	for (int i = 0; i <= colors.length-1; i++){
		stroke(colors[i]);
		line(oldx, oldy+i*5, x, y+i*5);
	}
	//draw the wacky object in the list
	for (Wacky i: circleList){
		i.drawAndShrink();
	}
	//change save old positions to draw line off of
	oldy = y;
	oldx = x;
}
//function that generates a new random slope
int newslope() {
	return int(random(-10,11));
}
//function that updates x cordinate
void updateX(){
	if (oldx >= 1000){
		c = -xinc;
	}
	else if (oldx <= 0){
		c = xinc;
	}
	x+=c;
}
//function that updates y cordinate
void updateY(){
	if (y + slope >= height || y + slope <= 0){
		slope = slope *-1;
	}
	y += slope;
}
//Wacky Class
class Wacky{
	//radius of circle
	int r = int(random(50,150));
	//postion values of circle
	int x;
	int y;
	Wacky(int x, int y){
		//sets postion of circle to the x and y value of the change in slope
		this.x = x;
		this.y = y;
	}
	//function that shrinks the circles radius and draws it.
	void drawAndShrink(){
		stroke(227,223,255);
		circle(x,y,r);
		if (r > 0){
			r--;
		}
	}
}