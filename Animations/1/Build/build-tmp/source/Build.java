/* autogenerated by Processing revision 1277 on 2022-02-16 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class Build extends PApplet {

//Global Variables
int slope = newslope();
int y = 1000/2;
int x = 0;
int xinc = 6;
int oldy = y;
int oldx = x;
int c = xinc;
//Colors on the line
int [] colors = {0xFFFF0000, 0xFFFFA500, 0xFFFFFF00, 0xFF00FF00, 0xFF0000FF, 0xFFA020F0};
//List of Wacky Objects
ArrayList<Wacky> circleList = new ArrayList<Wacky>();
//Setup function
 public void setup() {
	/* size commented out by preprocessor */;
	background(0,0,0);
}

 public void draw() {
	fill(0,0,0,20);
	rect(0, 0, width, height, 10);
	updateX();
	updateY();
	int r = PApplet.parseInt(random(0, 35));
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

 public int newslope() {
	return PApplet.parseInt(random(-10,11));
}

 public void updateX(){
	if (oldx >= 1000){
		c = -xinc;
	}
	else if (oldx <= 0){
		c = xinc;
	}
	x+=c;
}

 public void updateY(){
	if (y + slope >= height || y + slope <= 0){
		slope = slope *-1;
	}
	y += slope;
}

class Wacky{
	int r = PApplet.parseInt(random(50,150));
	int x;
	int y;
	Wacky(int x, int y){
		this.x = x;
		this.y = y;
	}
	 public void drawAndShrink(){
		stroke(227,223,255);
		circle(x,y,r);
		if (r > 0){
			r--;
		}
	}
}


  public void settings() { size(1000, 1000); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
