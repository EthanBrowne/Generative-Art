/* autogenerated by Processing revision 1277 on 2022-03-14 */
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

 public void setup() {
	/* size commented out by preprocessor */;
	background(255,255,255);
	pg = createGraphics(1000,1000);
}

 public void draw() {
	pg.beginDraw();
	fill(255,255,255);
	rect(0,0,width,height);
	collide();
	fill(0,0,0);
	circle(circleX, circleY, 15);
	int r = PApplet.parseInt(random(0,26));
	if (r == 0){
		Wacky placeHolder = new Wacky(circleX+PApplet.parseInt(random(-10,11)),circleY+PApplet.parseInt(random(-10,11)));
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

 public void collide(){
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

 public void respawn(){
	circleX = 500;
	circleY = 250;
	mx = 0;
}
class Wacky{
	//color list
	int [] colors = {0xFFFF0000, 0xFFFFA500, 0xFFFFFF00, 0xFF00FF00, 0xFF0000FF, 0xFFA020F0};
	//radius of circle
	int r = PApplet.parseInt(random(15,60));
	//postion values of circle
	float x;
	int y;
	Wacky(float x, int y){
		//sets postion of circle to the x and y value of the change in slope
		this.x = x;
		this.y = y;
	}
	//function that shrinks the circles radius and draws it.
	 public void drawAndShrink(){
		noFill();
		pg.stroke(colors[PApplet.parseInt(random(0,colors.length))]);
		pg.circle(x,y,r);
		if (r > 0){
			r--;
		}
	}
	 public void drawAndGrow(){
		noFill();
		stroke(0,0,0);
		circle(x,y,r);
		r++;
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
